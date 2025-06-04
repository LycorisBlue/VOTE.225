import 'package:get/get.dart';
import '../controllers/home_crontroller.dart';
import '/app/candidates/controllers/candidates_controller.dart';
import '/app/assistance/controllers/assistance_controller.dart';
import '/app/menu/controllers/menu_controller.dart';
import '/shared_components/layout/bottom_navigation/bn_contolleur.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController());
    Get.lazyPut(() => CandidatesController());
    Get.lazyPut(() => AssistanceController());
    Get.lazyPut(() => MenusController());
    Get.lazyPut(() => BNavigationController());
  }
}
