import 'package:get/get.dart';
import '/data/models/candidate.dart';
import '/configs/routes/navigation.dart';

enum ViewType { grid, list }

class CandidatesController extends GetxController {
  // Variables réactives
  final RxList<Candidate> allCandidates = <Candidate>[].obs;
  final RxList<Candidate> filteredCandidates = <Candidate>[].obs;
  final RxString searchQuery = ''.obs;
  final Rx<ViewType> currentViewType = ViewType.grid.obs;
  final RxBool isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    loadCandidates();

    // Écouter les changements de recherche
    ever(searchQuery, (_) => filterCandidates());
  }

  // Charger les candidats
  void loadCandidates() {
    isLoading.value = true;

    // Simuler un délai de chargement
    Future.delayed(Duration(milliseconds: 500), () {
      allCandidates.value = Candidate.getSampleCandidates();
      filteredCandidates.value = allCandidates;
      isLoading.value = false;
    });
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
            candidate.party.toLowerCase().contains(searchQuery.value);
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

  // Naviguer vers le détail d'un candidat (MISE À JOUR)
  void navigateToCandidateDetail(Candidate candidate) {
    MyNavigation.goToCandidateDetail(candidate);
  }

  // Rafraîchir la liste
  void refreshCandidates() {
    searchQuery.value = '';
    loadCandidates();
  }

  // Getter pour savoir si on est en vue grille
  bool get isGridView => currentViewType.value == ViewType.grid;

  // Getter pour savoir si on est en vue liste
  bool get isListView => currentViewType.value == ViewType.list;
}
