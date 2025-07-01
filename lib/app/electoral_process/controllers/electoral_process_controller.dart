import 'dart:ui';

import 'package:get/get.dart';
import '/data/models/electoral_process.dart';
import '/data/models/region_info.dart';
import '/configs/routes/navigation.dart';

class ElectoralProcessController extends GetxController {
  // Variables réactives pour les données du processus électoral
  final RxList<ElectoralProcess> allProcessSteps = <ElectoralProcess>[].obs;
  final RxList<ElectoralProcess> filteredProcessSteps = <ElectoralProcess>[].obs;

  // Variables réactives pour la région sélectionnée
  final Rx<RegionInfo?> selectedRegion = Rx<RegionInfo?>(null);
  final RxBool showRegionInfo = false.obs;

  // État de chargement
  final RxBool isLoading = false.obs;

  // Variables pour le tooltip (existantes)
  final regionName = RxnString();
  final tapPosition = Rxn<Offset>();

  @override
  void onInit() {
    super.onInit();
    loadProcessSteps();
  }

  // Charger les étapes du processus électoral
  void loadProcessSteps() {
    isLoading.value = true;

    // Simuler un délai de chargement
    Future.delayed(Duration(milliseconds: 500), () {
      allProcessSteps.value = ElectoralProcess.getSampleProcessSteps();
      filteredProcessSteps.value = allProcessSteps;
      isLoading.value = false;
    });
  }

  // Naviguer vers les détails d'une étape
  void goToStepDetail(ElectoralProcess step) {
    // Navigation vers l'écran de détail statique
    MyNavigation.goToElectoralProcessDetail();
  }

  // Retourner à l'écran précédent
  void goBack() {
    Get.back();
  }

  // Rafraîchir les données
  void refreshProcessSteps() {
    loadProcessSteps();
  }

  // Méthode modifiée pour gérer le tap sur une région
  void onRegionTap(String name, Offset position) {
    // Affichage du tooltip temporaire (existant)
    regionName.value = name;
    tapPosition.value = Offset(position.dx, position.dy - 110);

    // Nouvelle fonctionnalité : récupérer et afficher les infos de la région
    final regionInfo = RegionInfo.getRegionByName(name);
    if (regionInfo != null) {
      selectedRegion.value = regionInfo;
      showRegionInfo.value = true;
    }

    // Masquer le tooltip après 3 secondes
    Future.delayed(Duration(seconds: 3), () {
      regionName.value = null;
      tapPosition.value = null;
    });
  }

  // Masquer les informations de la région
  void hideRegionInfo() {
    showRegionInfo.value = false;
    selectedRegion.value = null;
  }

  // Réinitialiser la sélection de région
  void resetRegionSelection() {
    selectedRegion.value = null;
    showRegionInfo.value = false;
    regionName.value = null;
    tapPosition.value = null;
  }

  // Getters utilitaires
  bool get hasData => filteredProcessSteps.isNotEmpty;

  bool get isLoadingData => isLoading.value;

  int get processStepsCount => filteredProcessSteps.length;

  String get pageTitle => 'Processus Electoral';

  bool get hasSelectedRegion => selectedRegion.value != null;

  String get selectedRegionName => selectedRegion.value?.nom ?? '';
}
