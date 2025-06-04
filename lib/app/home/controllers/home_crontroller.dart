import 'package:get/get.dart';
import '/data/models/news_article.dart';

class HomeController extends GetxController {
  // Variable réactive pour la langue sélectionnée
  final RxString selectedLanguage = 'FR'.obs;

  // Liste des articles d'actualités
  final RxList<NewsArticle> newsArticles = <NewsArticle>[].obs;

  // État de chargement
  final RxBool isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    loadNewsArticles();
  }

  // Changer la langue
  void changeLanguage(String language) {
    selectedLanguage.value = language;
    // Logique future pour changer la langue de l'app
  }

  // Charger les articles d'actualités
  void loadNewsArticles() {
    isLoading.value = true;

    // Pour l'instant, on utilise les données d'exemple du modèle
    // Plus tard, cela pourra être remplacé par un appel API
    newsArticles.value = NewsArticle.getSampleArticles();

    isLoading.value = false;
  }

  // Naviguer vers le détail d'un article
  void navigateToArticleDetail(NewsArticle article) {
    // Logique de navigation vers le détail de l'article
    // À implémenter plus tard
    Get.snackbar(
      'Article',
      'Navigation vers: ${article.title}',
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  // Rafraîchir les actualités
  void refreshNews() {
    loadNewsArticles();
  }
}
