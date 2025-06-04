import 'package:get/get.dart';

class BNavigationController extends GetxController {
  var tabIndex = 0.obs;

  void changeTabIndex(int index) {
    tabIndex.value = index;
  }

  // Méthode pour revenir à l'accueil
  void goToHome() {
    tabIndex.value = 0;
  }

  // Méthode pour aller aux candidats
  void goToCandidates() {
    tabIndex.value = 1;
  }

  // Méthode pour aller à l'assistance
  void goToAssistance() {
    tabIndex.value = 2;
  }

  // Méthode pour aller au menu
  void goToMenu() {
    tabIndex.value = 3;
  }
}
