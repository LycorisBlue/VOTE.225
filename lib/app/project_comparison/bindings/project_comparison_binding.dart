import 'package:get/get.dart';
import '/app/project_comparison/controllers/project_comparison_controller.dart';

class ProjectComparisonBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ProjectComparisonController());
  }
}
