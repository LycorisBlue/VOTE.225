import 'package:get/get.dart';
import '/app/electoral_process/controllers/electoral_process_controller.dart';

class ElectoralProcessBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ElectoralProcessController());
  }
}
