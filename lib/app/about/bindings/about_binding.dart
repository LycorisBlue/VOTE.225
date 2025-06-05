import 'package:get/get.dart';
import '/app/about/controllers/about_controller.dart';

class AboutBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AboutController());
  }
}
