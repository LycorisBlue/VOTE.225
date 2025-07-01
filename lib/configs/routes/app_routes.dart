import 'package:get/get.dart';
import '/app/electoral_process/screens/carte_screen.dart';
import '/app/settings/screens/cgu.dart';
import '/app/settings/screens/mention_legal.dart';
import '/app/settings/screens/privacy.dart';
import '/app/settings/screens/mention_legal.dart';
import '/app/electoral_process/screens/carte_screen.dart';
import '/app/settings/screens/cgu.dart';
import '/app/settings/screens/privacy.dart';
import '/app/candidates/bindings/candidates_binding.dart';
import '/app/home/screens/news_article_detail.dart';
import '/app/calendar/bindings/calendar_binding.dart';
import '/app/calendar/screens/calendar_screen.dart';
import '/app/home/screens/home_screen.dart';
import '/app/home/bindings/home_binding.dart';
import '/app/account/bindings/account_binding.dart';
import '/app/faq/screens/faq_screen.dart';
import '/app/faq/bindings/faq_binding.dart';
import '/app/account/screens/login_screen.dart';
import '/app/candidates/screens/candidate_detail_screen.dart';
import '/app/about/screens/about_screen.dart';
import '/app/about/bindings/about_binding.dart';
import '/app/glossary/screens/glossary_screen.dart';
import '/app/glossary/bindings/glossary_binding.dart';
import '/app/settings/screens/settings_screen.dart';
import '/app/settings/bindings/settings_binding.dart';
import '/app/disinformation/screens/disinformation_screen.dart';
import '/app/disinformation/bindings/disinformation_binding.dart';
import '/app/disinformation/screens/report_detail_screen.dart';
import '/app/disinformation/screens/tip_detail_screen.dart';
import '/app/electoral_process/screens/electoral_process_screen.dart';
import '/app/electoral_process/screens/electoral_process_detail_screen.dart';
import '/app/electoral_process/bindings/electoral_process_binding.dart';
import '/app/carte_bureaux/screens/carte_bureaux_screen.dart';
import '/app/carte_bureaux/bindings/carte_bureaux_binding.dart';
import '/app/project_comparison/screens/project_comparison_screen.dart';
import '/app/project_comparison/screens/comparison_results_screen.dart';
import '/app/project_comparison/bindings/project_comparison_binding.dart';
import '/configs/routes/page_name.dart';

class AppPages {
  // static const initial = MyRoutes.home;
  static const home = MyRoutes.home;
  static const login = MyRoutes.login;
  static const candidateDetail = MyRoutes.candidateDetail;
  static const articleDetail = MyRoutes.articleDetail;
  static const calendar = MyRoutes.calendar;
  static const faq = MyRoutes.faq;
  static const about = MyRoutes.about;
  static const glossary = MyRoutes.glossary;
  static const settings = MyRoutes.settings;
  static const electoralProcess = MyRoutes.electoralProcess;
  static const electoralProcessDetail = MyRoutes.electoralProcessDetail;
  static const carteElectoral = MyRoutes.carteElectoral;
  static const privacyPolicy = MyRoutes.privacyPolicy;
  static const cgu = MyRoutes.cgu;
  static const projectComparison = MyRoutes.projectComparison;
  static const comparisonResults = MyRoutes.comparisonResults;
  static const mentionLegale = MyRoutes.mentionLegale;

  static const unknownRoute = MyRoutes.unknownRoute;

  static final routes = [
    GetPage(
      name: home,
      page: () => MainScreen(),
      title: PageTitle.home,
      binding: HomeBinding(),
    ),
    GetPage(
      name: login,
      page: () => LoginPage(),
      title: PageTitle.loginPage,
      binding: AccountBinding(),
    ),
    GetPage(
      name: candidateDetail,
      page: () => CandidateDetailScreen(),
      title: PageTitle.candidateDetail,
      binding: CandidatesBinding(),
    ),
    GetPage(
      name: articleDetail,
      page: () => ArticleDetailScreen(),
      title: PageTitle.articleDetail,
      binding: HomeBinding(),
    ),
    GetPage(
      name: calendar,
      page: () => CalendarScreen(),
      title: PageTitle.calendar,
      binding: CalendarBinding(),
    ),
    GetPage(
      name: faq,
      page: () => FAQScreen(),
      title: PageTitle.faq,
      binding: FAQBinding(),
    ),
    GetPage(
      name: about,
      page: () => AboutScreen(),
      title: PageTitle.about,
      binding: AboutBinding(),
    ),
    GetPage(
      name: glossary,
      page: () => GlossaryScreen(),
      title: PageTitle.glossary,
      binding: GlossaryBinding(),
    ),
    GetPage(
      name: settings,
      page: () => SettingsScreen(),
      title: PageTitle.settings,
      binding: SettingsBinding(),
    ),
    GetPage(
      name: MyRoutes.disinformation,
      page: () => DisinformationScreen(),
      title: PageTitle.disinformation,
      binding: DisinformationBinding(),
    ),
    GetPage(
      name: MyRoutes.reportDetail,
      page: () => ReportDetailScreen(),
      title: PageTitle.reportDetail,
    ),
    GetPage(
      name: MyRoutes.tipDetail,
      page: () => TipDetailScreen(),
      title: PageTitle.tipDetail,
    ),
    GetPage(
      name: electoralProcess,
      page: () => ElectoralProcessScreen(),
      title: PageTitle.electoralProcess,
      binding: ElectoralProcessBinding(),
    ),
    GetPage(
      name: electoralProcessDetail,
      page: () => ElectoralProcessDetailScreen(),
      title: PageTitle.electoralProcessDetail,
      binding: ElectoralProcessBinding(),
    ),
    GetPage(
      name: carteElectoral,
      page: () => CarteElectoralScreen(),
      title: PageTitle.carteElectoral,
      binding: ElectoralProcessBinding(),
    ),
    GetPage(
      name: cgu,
      page: () => CGUScreen(),
      title: PageTitle.cgu,
      binding: SettingsBinding(),
    ),
    GetPage(
      name: privacyPolicy,
      page: () => PrivacyPolicyScreen(),
      title: PageTitle.privacyPolicy,
      binding: SettingsBinding(),
    ),
    GetPage(
      name: MyRoutes.carteBureaux,
      page: () => CarteBureauxScreen(),
      title: PageTitle.carteBureaux,
      binding: CarteBureauxBinding(),
    ),
    GetPage(
      name: projectComparison,
      page: () => ProjectComparisonScreen(),
      title: PageTitle.projectComparison,
      binding: ProjectComparisonBinding(),
    ),
    GetPage(
      name: comparisonResults,
      page: () => ComparisonResultsScreen(),
      title: PageTitle.comparisonResults,
      binding: ProjectComparisonBinding(),
    ),
    GetPage(
      name: mentionLegale,
      page: () => MentionLegalScreen(),
      title: PageTitle.mentionLegale,
      binding: SettingsBinding(),
    ),
  ];
}
