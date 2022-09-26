import 'package:get/get.dart';

import '../controllers/calender_controller.dart';
import '../controllers/controller.dart';

class MyBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(() => HomeController());
    Get.lazyPut<CalenderController>(() => CalenderController());
  }
}
