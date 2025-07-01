import 'package:get/get.dart';
import '/data/models/project_comparison.dart';

class ProjectComparisonController extends GetxController {
  // Variables réactives pour la navigation entre onglets
  final RxInt currentTabIndex = 0.obs;
  final List<String> tabTitles = ['Tous les Projets', 'Comparer'];

  // Variables pour les données des projets
  final RxList<CandidateProject> allProjects = <CandidateProject>[].obs;
  final RxList<ThemeType> availableThemes = <ThemeType>[].obs;

  // Variables pour la comparaison
  final RxList<CandidateProject> selectedCandidates = <CandidateProject>[].obs;
  final RxList<ThemeType> selectedThemes = <ThemeType>[].obs;

  // État de chargement
  final RxBool isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    loadProjects();
    initializeThemes();
  }

  // Charger les projets des candidats
  void loadProjects() {
    isLoading.value = true;

    // Simuler un délai de chargement
    Future.delayed(Duration(milliseconds: 500), () {
      allProjects.value = CandidateProject.getSampleProjects();
      isLoading.value = false;
    });
  }

  // Initialiser les thématiques disponibles
  void initializeThemes() {
    availableThemes.value = ThemeType.values;
  }

  // Changer d'onglet
  void changeTab(int index) {
    currentTabIndex.value = index;
  }

  // Sélectionner/désélectionner un candidat pour la comparaison
  void toggleCandidateSelection(CandidateProject candidate) {
    if (selectedCandidates.contains(candidate)) {
      selectedCandidates.remove(candidate);
    } else if (selectedCandidates.length < 2) {
      selectedCandidates.add(candidate);
    } else {
      // Remplacer le premier candidat si on en a déjà 2
      selectedCandidates[0] = candidate;
    }
  }

  // Sélectionner/désélectionner une thématique
  void toggleThemeSelection(ThemeType theme) {
    if (selectedThemes.contains(theme)) {
      selectedThemes.remove(theme);
    } else {
      selectedThemes.add(theme);
    }
  }

  // Vérifier si un candidat est sélectionné
  bool isCandidateSelected(CandidateProject candidate) {
    return selectedCandidates.contains(candidate);
  }

  // Vérifier si une thématique est sélectionnée
  bool isThemeSelected(ThemeType theme) {
    return selectedThemes.contains(theme);
  }

  // Obtenir le texte du bouton candidat
  String getCandidateButtonText(int index) {
    if (index < selectedCandidates.length) {
      return selectedCandidates[index].candidateName;
    }
    return 'Candidat ${index + 1}';
  }

  // Vérifier si la comparaison peut être lancée
  bool get canCompare => selectedCandidates.length >= 2 && selectedThemes.isNotEmpty;

  // Lancer la comparaison
  void startComparison() {
    if (!canCompare) {
      Get.snackbar(
        'Comparaison impossible',
        'Veuillez sélectionner au moins 2 candidats et 1 thématique',
        snackPosition: SnackPosition.BOTTOM,
      );
      return;
    }

    final comparison = ProjectComparison(
      candidates: selectedCandidates.toList(),
      selectedThemes: selectedThemes.toList(),
    );

    // Navigation vers l'écran de résultats
    Get.toNamed('/comparison-results', arguments: comparison);
  }

  // Naviguer vers le détail d'un projet
  void goToProjectDetail(CandidateProject project) {
    Get.snackbar(
      'Projet',
      'Navigation vers le projet de ${project.candidateName}',
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  // Retourner à l'écran précédent
  void goBack() {
    Get.back();
  }

  // Effacer toutes les sélections
  void clearSelections() {
    selectedCandidates.clear();
    selectedThemes.clear();
  }

  // Getters utilitaires
  String get currentTabTitle => tabTitles[currentTabIndex.value];
  bool get isTousLesProjetsTab => currentTabIndex.value == 0;
  bool get isComparerTab => currentTabIndex.value == 1;
  int get selectedCandidatesCount => selectedCandidates.length;
  int get selectedThemesCount => selectedThemes.length;
}
