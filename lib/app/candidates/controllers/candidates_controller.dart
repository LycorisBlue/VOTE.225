import 'package:get/get.dart';
import '/data/models/candidate.dart';
import '/data/repositories/candidates_repository.dart';
import '/configs/injectiondepency/injection.dart';
import '/configs/routes/navigation.dart';

enum ViewType { grid, list }

class CandidatesController extends GetxController {
  // Injection du repository
  final CandidatesRepository _candidatesRepository = sl<CandidatesRepository>();

  // Variables réactives
  final RxList<Candidate> allCandidates = <Candidate>[].obs;
  final RxList<Candidate> filteredCandidates = <Candidate>[].obs;
  final RxString searchQuery = ''.obs;
  final Rx<ViewType> currentViewType = ViewType.grid.obs;
  final RxBool isLoading = false.obs;
  final RxBool hasError = false.obs;
  final RxString errorMessage = ''.obs;

  @override
  void onInit() {
    super.onInit();
    loadCandidates();

    // Écouter les changements de recherche
    ever(searchQuery, (_) => filterCandidates());
  }

  // Charger les candidats depuis GraphQL
  void loadCandidates() async {
    isLoading.value = true;
    hasError.value = false;
    errorMessage.value = '';

    try {
      final result = await _candidatesRepository.getCandidates();

      result.fold(
        // En cas d'erreur
        (error) {
          hasError.value = true;
          errorMessage.value = error.first; // Premier élément contient le message d'erreur
          allCandidates.clear();
          filteredCandidates.clear();

          // Afficher une notification d'erreur
          Get.snackbar(
            'Erreur',
            errorMessage.value,
            snackPosition: SnackPosition.TOP,
            duration: Duration(seconds: 5),
          );
        },
        // En cas de succès
        (candidates) {
          hasError.value = false;
          allCandidates.value = candidates;
          filteredCandidates.value = candidates;

          if (candidates.isEmpty) {
            Get.snackbar(
              'Information',
              'Aucun candidat trouvé',
              snackPosition: SnackPosition.BOTTOM,
              duration: Duration(seconds: 3),
            );
          }
        },
      );
    } catch (e) {
      hasError.value = true;
      errorMessage.value = 'Erreur inattendue: $e';
      allCandidates.clear();
      filteredCandidates.clear();
    } finally {
      isLoading.value = false;
    }
  }

  // Basculer entre vue grille et liste
  void toggleViewType(ViewType viewType) {
    currentViewType.value = viewType;
  }

  // Mettre à jour la recherche
  void updateSearchQuery(String query) {
    searchQuery.value = query.toLowerCase();
  }

  // Filtrer les candidats selon la recherche
  void filterCandidates() {
    if (searchQuery.value.isEmpty) {
      filteredCandidates.value = allCandidates;
    } else {
      filteredCandidates.value = allCandidates.where((candidate) {
        return candidate.fullName.toLowerCase().contains(searchQuery.value) ||
            candidate.party.toLowerCase().contains(searchQuery.value) ||
            candidate.city.toLowerCase().contains(searchQuery.value) ||
            candidate.currentFunction.toLowerCase().contains(searchQuery.value);
      }).toList();
    }
  }

  // Ajouter/retirer des favoris
  void toggleFavorite(String candidateId) {
    final candidateIndex = allCandidates.indexWhere((c) => c.id == candidateId);
    if (candidateIndex != -1) {
      final candidate = allCandidates[candidateIndex];
      allCandidates[candidateIndex] = candidate.copyWith(isFavorite: !candidate.isFavorite);
      filterCandidates(); // Mettre à jour la liste filtrée
    }
  }

  // Naviguer vers le détail d'un candidat
  void navigateToCandidateDetail(Candidate candidate) {
    MyNavigation.goToCandidateDetail(candidate);
  }

  // Rafraîchir la liste depuis le serveur
  void refreshCandidates() {
    searchQuery.value = '';
    loadCandidates();
  }

  // Réessayer en cas d'erreur
  void retryLoadCandidates() {
    loadCandidates();
  }

  // Basculer vers les données d'exemple en cas d'échec
  void loadSampleData() {
    hasError.value = false;
    errorMessage.value = '';
    allCandidates.value = Candidate.getSampleCandidates();
    filteredCandidates.value = allCandidates;

    Get.snackbar(
      'Mode hors ligne',
      'Données d\'exemple chargées',
      snackPosition: SnackPosition.BOTTOM,
      duration: Duration(seconds: 3),
    );
  }

  // Getter pour savoir si on est en vue grille
  bool get isGridView => currentViewType.value == ViewType.grid;

  // Getter pour savoir si on est en vue liste
  bool get isListView => currentViewType.value == ViewType.list;

  // Getter pour vérifier si on a des données
  bool get hasData => filteredCandidates.isNotEmpty;

  // Getter pour vérifier si on est en état de chargement
  bool get isLoadingData => isLoading.value;

  // Getter pour vérifier si on a une erreur
  bool get hasErrorState => hasError.value;
}
