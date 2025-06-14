import 'package:get/route_manager.dart';
import '/configs/routes/page_name.dart';
import '/data/models/candidate.dart';

class MyNavigation {
  static void goToHome() {
    Get.offAllNamed(MyRoutes.home);
  }

  static void goToCandidates() {
    Get.toNamed(MyRoutes.candidates);
  }

  static void goToCandidateDetail(Candidate candidate) {
    Get.toNamed(MyRoutes.candidateDetail, arguments: candidate);
  }

  static void goToAssistance() {
    Get.toNamed(MyRoutes.assistance);
  }

  static void goToMenu() {
    Get.toNamed(MyRoutes.menu);
  }

  static void goToLogin() {
    Get.offAllNamed(MyRoutes.login);
  }

  static void goTo404Page() {
    Get.offAllNamed(MyRoutes.unknownRoute);
  }

  static void goToCalendar() {
    Get.toNamed(MyRoutes.calendar);
  }

  static void goToFAQ() {
    Get.toNamed(MyRoutes.faq);
  }

  static void goToAbout() {
    Get.toNamed(MyRoutes.about);
  }

  static void goToGlossary() {
    Get.toNamed(MyRoutes.glossary);
  }
}
