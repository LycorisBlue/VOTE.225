import 'package:get/get.dart';
import '/app/disinformation/controllers/disinformation_controller.dart';

class DisinformationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => DisinformationController());
  }
}
