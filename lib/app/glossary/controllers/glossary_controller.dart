import 'package:get/get.dart';
import '/data/models/glossary_term.dart';

class GlossaryController extends GetxController {
  // Variables réactives pour la recherche et la navigation
  final RxString searchQuery = ''.obs;
  final RxString selectedLetter = 'A'.obs;

  // Variables pour les données du glossaire
  final RxList<GlossaryTerm> allTerms = <GlossaryTerm>[].obs;
  final RxList<GlossaryTerm> filteredTerms = <GlossaryTerm>[].obs;
  final RxMap<String, List<GlossaryTerm>> termsByLetter = <String, List<GlossaryTerm>>{}.obs;

  // État de chargement
  final RxBool isLoading = false.obs;

  // Alphabet complet de A à Z
  final List<String> alphabet = [
    'A',
    'B',
    'C',
    'D',
    'E',
    'F',
    'G',
    'H',
    'I',
    'J',
    'K',
    'L',
    'M',
    'N',
    'O',
    'P',
    'Q',
    'R',
    'S',
    'T',
    'U',
    'V',
    'W',
    'X',
    'Y',
    'Z'
  ];

  @override
  void onInit() {
    super.onInit();
    loadGlossaryTerms();

    // Écouter les changements de recherche et de lettre sélectionnée
    ever(searchQuery, (_) => filterTerms());
    ever(selectedLetter, (_) => filterTerms());
  }

  // Charger les termes du glossaire
  void loadGlossaryTerms() {
    isLoading.value = true;

    // Simuler un délai de chargement
    Future.delayed(Duration(milliseconds: 500), () {
      allTerms.value = GlossaryTerm.getSampleGlossaryTerms();
      groupTermsByLetter();
      filterTerms();
      isLoading.value = false;
    });
  }

  // Grouper les termes par lettre
  void groupTermsByLetter() {
    Map<String, List<GlossaryTerm>> grouped = {};

    // Initialiser toutes les lettres avec des listes vides
    for (String letter in alphabet) {
      grouped[letter] = [];
    }

    // Grouper les termes existants
    for (GlossaryTerm term in allTerms) {
      String letter = term.normalizedFirstLetter;
      if (grouped.containsKey(letter)) {
        grouped[letter]!.add(term);
      }
    }

    // Trier les termes dans chaque lettre par ordre alphabétique
    grouped.forEach((key, value) {
      value.sort((a, b) => a.term.compareTo(b.term));
    });

    termsByLetter.value = grouped;
  }

  // Mettre à jour la requête de recherche
  void updateSearchQuery(String query) {
    searchQuery.value = query.toLowerCase().trim();
  }

  // Filtrer les termes
  void filterTerms() {
    List<GlossaryTerm> filtered = [];

    if (searchQuery.value.isNotEmpty) {
      // Mode recherche : chercher dans tous les termes
      filtered = allTerms.where((term) {
        bool matchesTerm = term.term.toLowerCase().contains(searchQuery.value);
        bool matchesDefinition = term.definition.toLowerCase().contains(searchQuery.value);
        bool matchesTags = term.tags?.any((tag) => tag.toLowerCase().contains(searchQuery.value)) ?? false;

        return matchesTerm || matchesDefinition || matchesTags;
      }).toList();
    } else {
      // Mode navigation alphabétique : afficher les termes de la lettre sélectionnée
      filtered = termsByLetter[selectedLetter.value] ?? [];
    }

    // Trier par ordre alphabétique
    filtered.sort((a, b) => a.term.compareTo(b.term));
    filteredTerms.value = filtered;
  }

  // Sélectionner une lettre
  void selectLetter(String letter) {
    if (alphabet.contains(letter)) {
      selectedLetter.value = letter;
      // Effacer la recherche quand on sélectionne une lettre
      searchQuery.value = '';
    }
  }

  // Vérifier si une lettre a des termes
  bool hasTermsForLetter(String letter) {
    return termsByLetter[letter]?.isNotEmpty ?? false;
  }

  // Obtenir le nombre de termes pour une lettre
  int getTermsCountForLetter(String letter) {
    return termsByLetter[letter]?.length ?? 0;
  }

  // Effacer la recherche
  void clearSearch() {
    searchQuery.value = '';
  }

  // Partager le glossaire
  void shareGlossary() {
    Get.snackbar(
      'Partage',
      'Fonctionnalité de partage du glossaire à venir',
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  // Partager un terme spécifique
  void shareTerm(GlossaryTerm term) {
    Get.snackbar(
      'Partage',
      'Partage du terme "${term.term}" à venir',
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  // Retourner à l'écran précédent
  void goBack() {
    Get.back();
  }

  // Rafraîchir les données
  void refreshGlossary() {
    loadGlossaryTerms();
  }

  // Naviguer vers la première lettre qui a des termes
  void goToFirstAvailableLetter() {
    for (String letter in alphabet) {
      if (hasTermsForLetter(letter)) {
        selectLetter(letter);
        break;
      }
    }
  }

  // Naviguer vers la lettre précédente qui a des termes
  void goToPreviousLetter() {
    int currentIndex = alphabet.indexOf(selectedLetter.value);
    for (int i = currentIndex - 1; i >= 0; i--) {
      if (hasTermsForLetter(alphabet[i])) {
        selectLetter(alphabet[i]);
        break;
      }
    }
  }

  // Naviguer vers la lettre suivante qui a des termes
  void goToNextLetter() {
    int currentIndex = alphabet.indexOf(selectedLetter.value);
    for (int i = currentIndex + 1; i < alphabet.length; i++) {
      if (hasTermsForLetter(alphabet[i])) {
        selectLetter(alphabet[i]);
        break;
      }
    }
  }

  // Getters utilitaires
  bool get hasSearchQuery => searchQuery.value.isNotEmpty;

  int get totalTermsCount => allTerms.length;

  int get filteredTermsCount => filteredTerms.length;

  List<String> get availableLetters => alphabet.where((letter) => hasTermsForLetter(letter)).toList();

  String get currentDisplayMode => hasSearchQuery ? 'Recherche' : 'Lettre ${selectedLetter.value}';

  String get searchResultText {
    if (hasSearchQuery) {
      if (filteredTerms.isEmpty) {
        return 'Aucun résultat trouvé pour "${searchQuery.value}"';
      }
      return '${filteredTerms.length} résultat${filteredTerms.length > 1 ? 's' : ''} trouvé${filteredTerms.length > 1 ? 's' : ''}';
    } else {
      int count = getTermsCountForLetter(selectedLetter.value);
      if (count == 0) {
        return 'Aucun terme pour la lettre ${selectedLetter.value}';
      }
      return '$count terme${count > 1 ? 's' : ''} pour la lettre ${selectedLetter.value}';
    }
  }
}
