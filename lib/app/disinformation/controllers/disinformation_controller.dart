import 'package:get/get.dart';
import 'package:flutter/material.dart';

class DisinformationController extends GetxController {
  // Variables réactives pour la navigation entre onglets
  final RxInt currentTabIndex = 0.obs;
  final List<String> tabTitles = ['Signaler', 'Signalements', 'Conseils'];

  // Variables pour le formulaire de signalement
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController sourceController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  // Variables réactives pour le formulaire
  final RxString selectedCategory = ''.obs;
  final RxBool isLoading = false.obs;

  // Liste des catégories disponibles
  final List<String> categories = [
    'Fausses informations politiques',
    'Rumeurs de santé',
    'Théories du complot',
    'Manipulation d\'images',
    'Désinformation économique',
    'Autres',
  ];

  @override
  void onInit() {
    super.onInit();
    // Initialisation si nécessaire
  }

  @override
  void onClose() {
    // Nettoyer les contrôleurs
    descriptionController.dispose();
    sourceController.dispose();
    super.onClose();
  }

  // Changer d'onglet
  void changeTab(int index) {
    currentTabIndex.value = index;
  }

  // Changer la catégorie sélectionnée
  void changeCategory(String? category) {
    if (category != null) {
      selectedCategory.value = category;
    }
  }

  // Valider et soumettre le signalement
  void submitReport() async {
    if (!formKey.currentState!.validate()) {
      return;
    }

    if (selectedCategory.value.isEmpty) {
      Get.snackbar(
        'Erreur',
        'Veuillez sélectionner une catégorie',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red.withOpacity(0.8),
        colorText: Colors.white,
      );
      return;
    }

    isLoading.value = true;

    try {
      // Simuler l'envoi du signalement
      await Future.delayed(Duration(seconds: 2));

      // Afficher le message de succès
      Get.snackbar(
        'Succès',
        'Votre signalement a été envoyé avec succès',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green.withOpacity(0.8),
        colorText: Colors.white,
      );

      // Réinitialiser le formulaire
      _resetForm();
    } catch (e) {
      Get.snackbar(
        'Erreur',
        'Une erreur est survenue lors de l\'envoi du signalement',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red.withOpacity(0.8),
        colorText: Colors.white,
      );
    } finally {
      isLoading.value = false;
    }
  }

  // Réinitialiser le formulaire
  void _resetForm() {
    descriptionController.clear();
    sourceController.clear();
    selectedCategory.value = '';
    formKey.currentState?.reset();
  }

  // Validation de la description
  String? validateDescription(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Veuillez décrire l\'information suspecte';
    }
    if (value.trim().length < 10) {
      return 'La description doit contenir au moins 10 caractères';
    }
    return null;
  }

  // Validation de la source (optionnelle mais avec format)
  String? validateSource(String? value) {
    if (value != null && value.trim().isNotEmpty) {
      // Vérification basique d'URL
      if (!value.startsWith('http') && !value.startsWith('www')) {
        return 'Veuillez fournir un lien valide ou une capture d\'écran';
      }
    }
    return null;
  }

  // Retourner à l'écran précédent
  void goBack() {
    Get.back();
  }

  // Getters utilitaires
  String get currentTabTitle => tabTitles[currentTabIndex.value];
  bool get isSignalerTab => currentTabIndex.value == 0;
  bool get isSignalementsTab => currentTabIndex.value == 1;
  bool get isConseilsTab => currentTabIndex.value == 2;
}
