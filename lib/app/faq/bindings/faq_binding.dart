import 'package:get/get.dart';
import '/app/faq/controllers/faq_controller.dart';

class FAQBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => FAQController());
  }
}
