import 'package:get/get.dart';
import 'package:templateproject/configs/routes/navigation.dart';

class MenusController extends GetxController {
  // Variable pour l'état de chargement
  final RxBool isLoading = false.obs;

  // Naviguer vers le calendrier électoral
  void goToCalendrierElectoral() {
    MyNavigation.goToCalendar();
  }

  // Naviguer vers le processus électoral
  void goToProcessusElectoral() {
    MyNavigation.goToElectoralProcess();
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
    MyNavigation.goToSettings();
  }

  // Naviguer vers à propos de l'application
  void goToAPropos() {
    MyNavigation.goToAbout();
  }

  void goToLutteContreDesinformation() {
    MyNavigation.goToDisinformation();
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
      case 'disinformation':
        goToLutteContreDesinformation();
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
