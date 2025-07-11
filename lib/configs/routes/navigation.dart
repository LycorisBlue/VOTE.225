import 'package:get/route_manager.dart';
import '/data/models/disinformation.dart';
import '/data/models/events.dart';
import '/configs/routes/page_name.dart';
import '/data/models/candidate.dart';
import '/data/models/project_comparison.dart';

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

  static void goToArticleDetail(Article article) {
    Get.toNamed(MyRoutes.articleDetail, arguments: article);
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

  static void goToSettings() {
    Get.toNamed(MyRoutes.settings);
  }

  static void goToDisinformation() {
    Get.toNamed(MyRoutes.disinformation);
  }

  static void goToReportDetail(DisinformationReport report) {
    Get.toNamed(MyRoutes.reportDetail, arguments: report);
  }

  static void goToTipDetail(String tipId) {
    Get.toNamed(MyRoutes.tipDetail, arguments: tipId);
  }

  static void goToElectoralProcess() {
    Get.toNamed(MyRoutes.electoralProcess);
  }

  static void goToElectoralProcessDetail() {
    Get.toNamed(MyRoutes.electoralProcessDetail);
  }

  static void goToCarteElectoral() {
    Get.toNamed(MyRoutes.carteElectoral);
  }

  static void goToCGU() {
    Get.toNamed(MyRoutes.cgu);
  }

  static void goToPrivacy() {
    Get.toNamed(MyRoutes.privacyPolicy);

  }
  static void goToCarteBureaux() {
    Get.toNamed(MyRoutes.carteBureaux);
  }

  static void goToProjectComparison() {
    Get.toNamed(MyRoutes.projectComparison);
  }

  static void goToComparisonResults(ProjectComparison comparison) {
    Get.toNamed(MyRoutes.comparisonResults, arguments: comparison);
  }

  static void goToMentionLegale() {
    Get.toNamed(MyRoutes.mentionLegale);
  }
}
