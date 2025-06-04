import 'package:get/get.dart';
import '/app/candidates/controllers/candidates_controller.dart';

class CandidatesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CandidatesController());
  }
}
