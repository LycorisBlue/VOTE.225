import 'package:get/get.dart';
import '/data/models/faq_item.dart';

class FAQController extends GetxController {
  // Variables réactives pour la recherche et les filtres
  final RxString searchQuery = ''.obs;
  final Rx<FAQCategory?> selectedCategory = Rx<FAQCategory?>(null);
  final RxString activeFilterName = 'Tous'.obs;

  // Variables pour les données FAQ
  final RxList<FAQItem> allFAQItems = <FAQItem>[].obs;
  final RxList<FAQItem> filteredFAQItems = <FAQItem>[].obs;

  // Variables pour l'état d'expansion des items
  final RxList<String> expandedItems = <String>[].obs;

  // État de chargement
  final RxBool isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    loadFAQItems();

    // Écouter les changements de recherche et de filtre
    ever(searchQuery, (_) => filterFAQItems());
    ever(selectedCategory, (_) => filterFAQItems());
  }

  // Charger les éléments FAQ
  void loadFAQItems() {
    isLoading.value = true;

    // Simuler un délai de chargement
    Future.delayed(Duration(milliseconds: 500), () {
      allFAQItems.value = FAQItem.getSampleFAQItems();
      filteredFAQItems.value = allFAQItems;
      isLoading.value = false;
    });
  }

  // Mettre à jour la requête de recherche
  void updateSearchQuery(String query) {
    searchQuery.value = query.toLowerCase().trim();
  }

  // Filtrer les éléments FAQ
  void filterFAQItems() {
    List<FAQItem> filtered = allFAQItems;

    // Filtrer par catégorie si sélectionnée
    if (selectedCategory.value != null) {
      filtered = filtered.where((item) {
        return item.category == selectedCategory.value;
      }).toList();
    }

    // Filtrer par recherche si il y a une requête
    if (searchQuery.value.isNotEmpty) {
      filtered = filtered.where((item) {
        // Recherche dans la question
        bool matchesQuestion = item.question.toLowerCase().contains(searchQuery.value);

        // Recherche dans la réponse
        bool matchesAnswer = item.answer.toLowerCase().contains(searchQuery.value);

        // Recherche dans les tags
        bool matchesTags = item.tags?.any((tag) => tag.toLowerCase().contains(searchQuery.value)) ?? false;

        return matchesQuestion || matchesAnswer || matchesTags;
      }).toList();
    }

    filteredFAQItems.value = filtered;
  }

  // Basculer l'expansion d'un item FAQ
  void toggleItemExpansion(String itemId) {
    if (expandedItems.contains(itemId)) {
      expandedItems.remove(itemId);
    } else {
      expandedItems.add(itemId);
    }
  }

  // Vérifier si un item est étendu
  bool isItemExpanded(String itemId) {
    return expandedItems.contains(itemId);
  }

  // Réduire tous les items
  void collapseAllItems() {
    expandedItems.clear();
  }

  // Étendre tous les items
  void expandAllItems() {
    expandedItems.value = filteredFAQItems.map((item) => item.id).toList();
  }

  // Changer le filtre de catégorie
  void changeCategoryFilter(FAQCategory? category) {
    selectedCategory.value = category;
    if (category == null) {
      activeFilterName.value = 'Tous';
    } else {
      activeFilterName.value = category.name;
    }
  }

  // Filtres prédéfinis
  void showAllItems() {
    changeCategoryFilter(null);
  }

  void showInscriptionItems() {
    changeCategoryFilter(FAQCategory.inscription);
  }

  void showVoteItems() {
    changeCategoryFilter(FAQCategory.vote);
  }

  void showResultsItems() {
    changeCategoryFilter(FAQCategory.resultats);
  }

  // Effacer la recherche
  void clearSearch() {
    searchQuery.value = '';
  }

  // Effacer tous les filtres
  void clearAllFilters() {
    searchQuery.value = '';
    selectedCategory.value = null;
    activeFilterName.value = 'Tous';
  }

  // Retourner à l'écran précédent
  void goBack() {
    Get.back();
  }

  // Rafraîchir les données
  void refreshFAQItems() {
    expandedItems.clear();
    loadFAQItems();
  }

  // Ouvrir un lien externe
  void openLink(String url) {
    // Logique pour ouvrir les liens (sera implémentée avec url_launcher)
    Get.snackbar(
      'Lien',
      'Ouverture de $url',
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  // Getters utilitaires
  bool get hasSearchQuery => searchQuery.value.isNotEmpty;

  bool get hasActiveFilter => selectedCategory.value != null;

  bool get hasFiltersApplied => hasSearchQuery || hasActiveFilter;

  int get totalFAQItems => allFAQItems.length;

  int get filteredFAQItemsCount => filteredFAQItems.length;

  int get expandedItemsCount => expandedItems.length;

  String get searchResultText {
    if (!hasSearchQuery && !hasActiveFilter) {
      return '${filteredFAQItems.length} questions disponibles';
    }

    if (filteredFAQItems.isEmpty) {
      return 'Aucun résultat trouvé';
    }

    return '${filteredFAQItems.length} résultat${filteredFAQItems.length > 1 ? 's' : ''} trouvé${filteredFAQItems.length > 1 ? 's' : ''}';
  }
}
