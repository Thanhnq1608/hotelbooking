import 'package:get/get.dart';

import 'bottom_navigation_controller.dart';

class BottomNavigationBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(BottomNavigationController());
  }
}
