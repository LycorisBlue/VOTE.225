import 'package:get/get.dart';
import '/app/menu/controllers/menu_controller.dart';

class MenuBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MenusController());
  }
}
