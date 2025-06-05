import 'package:get/get.dart';
import '/app/calendar/controllers/calendar_controller.dart';

class CalendarBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CalendarController());
  }
}
