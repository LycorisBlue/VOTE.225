import 'package:get/get.dart';
import '/app/assistance/controllers/assistance_controller.dart';

class AssistanceBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AssistanceController());
  }
}
