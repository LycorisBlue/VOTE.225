import 'package:get/get.dart';

import '../../../configs/routes/navigation.dart';

class MenusController extends GetxController {
  // Variable pour l'état de chargement
  final RxBool isLoading = false.obs;

  // Naviguer vers le calendrier électoral
  void goToCalendrierElectoral() {
    MyNavigation.goToCalendar();
  }

  // Naviguer vers le processus électoral
  void goToProcessusElectoral() {
    Get.snackbar(
      'Processus Électoral',
      'Fonctionnalité à venir',
      snackPosition: SnackPosition.BOTTOM,
      duration: Duration(seconds: 2),
    );
  }

  // Naviguer vers le glossaire électoral
  void goToGlossaireElectoral() {
    MyNavigation.goToGlossary();
  }

  // Naviguer vers la FAQ citoyenne
  void goToFAQCitoyenne() {
    MyNavigation.goToFAQ();
  }

  // Naviguer vers les paramètres
  void goToParametres() {
    Get.snackbar(
      'Paramètres',
      'Fonctionnalité à venir',
      snackPosition: SnackPosition.BOTTOM,
      duration: Duration(seconds: 2),
    );
  }

  // Naviguer vers à propos de l'application
  void goToAPropos() {
    MyNavigation.goToAbout();
  }

  // Méthode générique pour gérer les clics sur les éléments du menu
  void handleMenuItemTap(String menuType) {
    switch (menuType) {
      case 'calendar':
        goToCalendrierElectoral();
        break;
      case 'process':
        goToProcessusElectoral();
        break;
      case 'glossary':
        goToGlossaireElectoral();
        break;
      case 'faq':
        goToFAQCitoyenne();
        break;
      case 'settings':
        goToParametres();
        break;
      case 'about':
        goToAPropos();
        break;
      default:
        Get.snackbar(
          'Menu',
          'Fonctionnalité non disponible',
          snackPosition: SnackPosition.BOTTOM,
        );
    }
  }
}
