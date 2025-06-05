import 'package:get/get.dart';
import '../../app/calendar/bindings/calendar_binding.dart';
import '../../app/calendar/screens/calendar_screen.dart';
import '../../app/home/screens/home_screen.dart';
import '/app/home/bindings/home_binding.dart';
import '/app/account/bindings/account_binding.dart';
import '/app/candidates/bindings/candidate_detail_binding.dart';
import '/app/faq/screens/faq_screen.dart';
import '/app/faq/bindings/faq_binding.dart';
import '/app/account/screens/login_screen.dart';
import '/app/candidates/screens/candidate_detail_screen.dart';
import '/app/about/screens/about_screen.dart';
import '/app/about/bindings/about_binding.dart';
import '/app/glossary/screens/glossary_screen.dart';
import '/app/glossary/bindings/glossary_binding.dart';
import '/configs/routes/page_name.dart';

class AppPages {
  static const initial = MyRoutes.home;
  static const login = MyRoutes.login;

  static const unknownRoute = MyRoutes.unknownRoute;

  static final routes = [
    GetPage(
      name: MyRoutes.home,
      page: () => MainScreen(),
      title: PageTitle.home,
      binding: HomeBinding(),
    ),
    GetPage(
      name: MyRoutes.login,
      page: () => const LoginPage(),
      title: PageTitle.loginPage,
      binding: AccountBinding(),
    ),
    GetPage(
      name: MyRoutes.candidateDetail,
      page: () => CandidateDetailScreen(),
      title: PageTitle.candidateDetail,
      binding: CandidateDetailBinding(),
    ),
      GetPage(
      name: MyRoutes.calendar,
      page: () => CalendarScreen(),
      title: PageTitle.calendar,
      binding: CalendarBinding(),
    ),

    GetPage(
      name: MyRoutes.faq,
      page: () => FAQScreen(),
      title: PageTitle.faq,
      binding: FAQBinding(),
    ),

    GetPage(
      name: MyRoutes.about,
      page: () => AboutScreen(),
      title: PageTitle.about,
      binding: AboutBinding(),
    ),

    GetPage(
      name: MyRoutes.glossary,
      page: () => GlossaryScreen(),
      title: PageTitle.glossary,
      binding: GlossaryBinding(),
    ),
  ];
}
