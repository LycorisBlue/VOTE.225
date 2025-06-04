import 'package:get/get.dart';
import '../../app/home/screens/home_screen.dart';
import '/app/home/bindings/home_binding.dart';
import '/app/account/bindings/account_binding.dart';
import '/app/candidates/bindings/candidate_detail_binding.dart';
import '/app/account/screens/login_screen.dart';
import '/app/candidates/screens/candidate_detail_screen.dart';
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
  ];
}
