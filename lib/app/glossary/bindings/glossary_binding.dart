import 'package:get/get.dart';
import '/app/glossary/controllers/glossary_controller.dart';

class GlossaryBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => GlossaryController());
  }
}
