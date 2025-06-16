import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '/data/models/settings_option.dart';
import '/configs/routes/navigation.dart';
import '/services/locals/local_storage_service.dart';
import '/configs/injectiondepency/injection.dart';

class SettingsController extends GetxController {
  // Variables réactives pour les paramètres
  final Rx<LanguageOption> selectedLanguage = LanguageOption.francais.obs;
  final RxBool notificationsEnabled = true.obs;
  final Rx<TextSizeOption> selectedTextSize = TextSizeOption.moyen.obs;
  final Rx<ContrastOption> selectedContrast = ContrastOption.eleve.obs;

  // État de chargement
  final RxBool isLoading = false.obs;

  // Service de stockage local
  final LocalStorageServices _localStorage = sl<LocalStorageServices>();

  @override
  void onInit() {
    super.onInit();
    loadSettings();
  }

  // Charger les paramètres depuis le stockage local
  void loadSettings() {
    // Charger la langue (utilise la logique existante)
    String? savedLang = _localStorage.getUserSelectedLang;
    if (savedLang != null) {
      if (savedLang == 'en') {
        selectedLanguage.value = LanguageOption.english;
      } else {
        selectedLanguage.value = LanguageOption.francais;
      }
    }

    // Charger les autres paramètres (à implémenter selon vos besoins)
    // Pour l'instant, on utilise les valeurs par défaut
  }

  // Changer la langue de l'interface
  void changeLanguage(LanguageOption language) {
    selectedLanguage.value = language;

    // Sauvegarder la langue et appliquer le changement
    String langCode = language == LanguageOption.francais ? 'fr' : 'en';
    _localStorage.userSelectedLang = langCode;

    // Appliquer le changement de langue dans l'app
    Locale newLocale = language == LanguageOption.francais ? const Locale('fr', 'FR') : const Locale('en', 'US');
    Get.updateLocale(newLocale);

    Get.snackbar(
      'Langue',
      'Langue changée vers ${language == LanguageOption.francais ? 'Français' : 'English'}',
      snackPosition: SnackPosition.BOTTOM,
      duration: Duration(seconds: 2),
    );
  }

  // Basculer les notifications
  void toggleNotifications(bool enabled) {
    notificationsEnabled.value = enabled;

    Get.snackbar(
      'Notifications',
      enabled ? 'Notifications activées' : 'Notifications désactivées',
      snackPosition: SnackPosition.BOTTOM,
      duration: Duration(seconds: 2),
    );
  }

  // Changer la taille du texte
  void changeTextSize(TextSizeOption size) {
    selectedTextSize.value = size;

    Get.snackbar(
      'Taille du texte',
      'Taille changée vers ${_getTextSizeDisplayName(size)}',
      snackPosition: SnackPosition.BOTTOM,
      duration: Duration(seconds: 2),
    );
  }

  // Changer le contraste
  void changeContrast(ContrastOption contrast) {
    selectedContrast.value = contrast;

    Get.snackbar(
      'Contraste',
      'Contraste changé vers ${_getContrastDisplayName(contrast)}',
      snackPosition: SnackPosition.BOTTOM,
      duration: Duration(seconds: 2),
    );
  }

  // Navigation vers les pages d'informations légales
  void goToPolicyPage() {
    Get.snackbar(
      'Politique de Confidentialité',
      'Fonctionnalité à venir',
      snackPosition: SnackPosition.BOTTOM,
      duration: Duration(seconds: 2),
    );
  }

  void goToTermsPage() {
    Get.snackbar(
      'Conditions d\'Utilisation',
      'Fonctionnalité à venir',
      snackPosition: SnackPosition.BOTTOM,
      duration: Duration(seconds: 2),
    );
  }

  void goToAboutPage() {
    MyNavigation.goToAbout();
  }

  // Retourner à l'écran précédent
  void goBack() {
    Get.back();
  }

  // Méthodes utilitaires pour l'affichage
  String _getTextSizeDisplayName(TextSizeOption size) {
    switch (size) {
      case TextSizeOption.petit:
        return 'Petit';
      case TextSizeOption.moyen:
        return 'Moyen';
      case TextSizeOption.grand:
        return 'Grand';
    }
  }

  String _getContrastDisplayName(ContrastOption contrast) {
    switch (contrast) {
      case ContrastOption.normal:
        return 'Normal';
      case ContrastOption.eleve:
        return 'Élevé';
    }
  }

  // Getters pour l'affichage
  String get languageDisplayName {
    return selectedLanguage.value == LanguageOption.francais ? 'Français' : 'English';
  }

  String get textSizeDisplayName {
    return _getTextSizeDisplayName(selectedTextSize.value);
  }

  String get contrastDisplayName {
    return _getContrastDisplayName(selectedContrast.value);
  }

  // Méthodes pour ouvrir les sélecteurs
  void showLanguageSelector() {
    Get.bottomSheet(
      Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Get.theme.colorScheme.surface,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Choisir la langue',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            ListTile(
              title: Text('Français'),
              trailing:
                  selectedLanguage.value == LanguageOption.francais ? Icon(Icons.check, color: Get.theme.primaryColor) : null,
              onTap: () {
                changeLanguage(LanguageOption.francais);
                Get.back();
              },
            ),
            ListTile(
              title: Text('English'),
              trailing:
                  selectedLanguage.value == LanguageOption.english ? Icon(Icons.check, color: Get.theme.primaryColor) : null,
              onTap: () {
                changeLanguage(LanguageOption.english);
                Get.back();
              },
            ),
          ],
        ),
      ),
    );
  }

  void showTextSizeSelector() {
    Get.bottomSheet(
      Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Get.theme.colorScheme.surface,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Taille du texte',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            ...TextSizeOption.values.map((size) {
              return ListTile(
                title: Text(_getTextSizeDisplayName(size)),
                trailing: selectedTextSize.value == size ? Icon(Icons.check, color: Get.theme.primaryColor) : null,
                onTap: () {
                  changeTextSize(size);
                  Get.back();
                },
              );
            }).toList(),
          ],
        ),
      ),
    );
  }

  void showContrastSelector() {
    Get.bottomSheet(
      Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Get.theme.colorScheme.surface,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Niveau de contraste',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            ...ContrastOption.values.map((contrast) {
              return ListTile(
                title: Text(_getContrastDisplayName(contrast)),
                trailing: selectedContrast.value == contrast ? Icon(Icons.check, color: Get.theme.primaryColor) : null,
                onTap: () {
                  changeContrast(contrast);
                  Get.back();
                },
              );
            }).toList(),
          ],
        ),
      ),
    );
  }
}
