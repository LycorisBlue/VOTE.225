import 'package:get/get.dart';
import '/app/carte_bureaux/controllers/carte_bureaux_controller.dart';

class CarteBureauxBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CarteBureauxController());
  }
}
