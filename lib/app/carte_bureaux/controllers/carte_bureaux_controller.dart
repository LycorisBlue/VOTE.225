import 'dart:io';

import 'package:get/get.dart';
import '../../../themes/colors.dart';
import '/data/models/bureau_vote.dart';
import 'package:url_launcher/url_launcher.dart';

class CarteBureauxController extends GetxController {
  // Variables réactives pour les données
  final RxList<BureauVote> allBureaux = <BureauVote>[].obs;
  final RxList<BureauVote> filteredBureaux = <BureauVote>[].obs;
  final Rx<BureauVote?> selectedBureau = Rx<BureauVote?>(null);

  // Variables pour la recherche
  final RxString searchQuery = ''.obs;

  // État de chargement
  final RxBool isLoading = false.obs;
  final RxBool hasError = false.obs;
  final RxString errorMessage = ''.obs;

  @override
  void onInit() {
    super.onInit();
    loadBureaux();

    // Écouter les changements de recherche
    ever(searchQuery, (_) => filterBureaux());
  }

  // Charger les bureaux de vote
  void loadBureaux() {
    isLoading.value = true;
    hasError.value = false;

    try {
      // Simuler un délai de chargement
      Future.delayed(Duration(milliseconds: 500), () {
        allBureaux.value = BureauVote.getSampleBureaux();
        filteredBureaux.value = allBureaux;

        // Sélectionner le premier bureau par défaut
        if (allBureaux.isNotEmpty) {
          selectedBureau.value = allBureaux.first;
        }

        isLoading.value = false;
      });
    } catch (e) {
      hasError.value = true;
      errorMessage.value = 'Erreur lors du chargement des bureaux de vote';
      isLoading.value = false;
    }
  }

  // Mettre à jour la requête de recherche
  void updateSearchQuery(String query) {
    searchQuery.value = query.toLowerCase().trim();
  }

  // Filtrer les bureaux selon la recherche
  void filterBureaux() {
    if (searchQuery.value.isEmpty) {
      filteredBureaux.value = allBureaux;
    } else {
      filteredBureaux.value = allBureaux.where((bureau) {
        return bureau.nom.toLowerCase().contains(searchQuery.value) ||
            bureau.adresse.toLowerCase().contains(searchQuery.value) ||
            (bureau.commune?.toLowerCase().contains(searchQuery.value) ?? false) ||
            (bureau.quartier?.toLowerCase().contains(searchQuery.value) ?? false);
      }).toList();
    }
  }

  // Sélectionner un bureau de vote
  void selectBureau(BureauVote bureau) {
    selectedBureau.value = bureau;
  }

  // Effacer la recherche
  void clearSearch() {
    searchQuery.value = '';
  }

// Ouvrir l'itinéraire
  void openItinerary() async {
    if (selectedBureau.value != null) {
      final bureau = selectedBureau.value!;
      final lat = bureau.latitude;
      final lng = bureau.longitude;

      String url;

      try {
        if (Platform.isIOS) {
          // URL pour Apple Maps sur iOS
          url = 'https://maps.apple.com/?daddr=$lat,$lng';

          if (await canLaunchUrl(Uri.parse(url))) {
            await launchUrl(
              Uri.parse(url),
              mode: LaunchMode.externalApplication,
            );
          } else {
            // Fallback vers Google Maps si Apple Maps n'est pas disponible
            url = 'https://www.google.com/maps/dir/?api=1&destination=$lat,$lng';
            await launchUrl(
              Uri.parse(url),
              mode: LaunchMode.externalApplication,
            );
          }
        } else if (Platform.isAndroid) {
          // URL pour Google Maps sur Android
          url = 'https://www.google.com/maps/dir/?api=1&destination=$lat,$lng';

          if (await canLaunchUrl(Uri.parse(url))) {
            await launchUrl(
              Uri.parse(url),
              mode: LaunchMode.externalApplication,
            );
          } else {
            // Fallback vers le navigateur web
            await launchUrl(
              Uri.parse(url),
              mode: LaunchMode.inAppWebView,
            );
          }
        } else {
          // Pour d'autres plateformes (Web, Desktop)
          url = 'https://www.google.com/maps/dir/?api=1&destination=$lat,$lng';
          await launchUrl(
            Uri.parse(url),
            mode: LaunchMode.platformDefault,
          );
        }

        // Message de succès
        Get.snackbar(
          'Itinéraire',
          'Ouverture de l\'itinéraire vers ${bureau.nom}',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: AppColors.primaryColor.withOpacity(0.8),
          colorText: AppColors.whiteColor,
          duration: Duration(seconds: 2),
        );
      } catch (e) {
        Get.snackbar(
          'Erreur',
          'Impossible d\'ouvrir l\'itinéraire',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: AppColors.redColor.withOpacity(0.8),
          colorText: AppColors.whiteColor,
          duration: Duration(seconds: 3),
        );
      }
    }
  }

  // Appeler le bureau (si numéro disponible)
  void callBureau() {
    if (selectedBureau.value?.telephone != null) {
      Get.snackbar(
        'Appel',
        'Appel vers ${selectedBureau.value!.telephone}',
        snackPosition: SnackPosition.BOTTOM,
        duration: Duration(seconds: 2),
      );
    }
  }

  // Rafraîchir les données
  void refreshBureaux() {
    loadBureaux();
  }

  // Retourner à l'écran précédent
  void goBack() {
    Get.back();
  }

  // Getters utilitaires
  bool get hasData => filteredBureaux.isNotEmpty;
  bool get hasSelectedBureau => selectedBureau.value != null;
  int get bureauxCount => filteredBureaux.length;
  bool get hasSearchQuery => searchQuery.value.isNotEmpty;

  String get searchResultText {
    if (hasSearchQuery) {
      if (filteredBureaux.isEmpty) {
        return 'Aucun bureau trouvé pour "${searchQuery.value}"';
      }
      return '${filteredBureaux.length} bureau${filteredBureaux.length > 1 ? 'x' : ''} trouvé${filteredBureaux.length > 1 ? 's' : ''}';
    }
    return '${allBureaux.length} bureau${allBureaux.length > 1 ? 'x' : ''} de vote';
  }
}
