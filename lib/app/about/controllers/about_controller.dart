import 'package:get/get.dart';

class AboutController extends GetxController {
  // Informations de l'application
  final String appName = '225 VOTES';
  final String appVersion = '1.0.0';

  // Description de l'application
  final String appDescription =
      '225 Vote est une application citoyenne conçue pour faciliter l\'accès à l\'information électorale en Côte d\'Ivoire. Elle permet aux utilisateurs de :';

  // Liste des fonctionnalités
  final List<String> features = [
    'S\'informer sur les conditions d\'inscription sur la liste électorale.',
    'Connaître les documents requis et les centres d\'enrôlement.',
    'Vérifier leur inscription et suivre l\'évolution du processus électoral.',
    'Recevoir des rappels et actualités officielles de la CEI.',
  ];

  // Objectif de l'application
  final String objective =
      'Notre objectif : favoriser une participation électorale active, transparente et informée pour tous les Ivoiriens.';

  // Variables réactives pour l'état
  final RxBool isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    // Initialisation simple si nécessaire
  }

  // Retourner à l'écran précédent
  void goBack() {
    Get.back();
  }

  // Getters utilitaires
  String get fullAppName => appName;
  String get currentVersion => 'Version $appVersion';
  int get featuresCount => features.length;
}
