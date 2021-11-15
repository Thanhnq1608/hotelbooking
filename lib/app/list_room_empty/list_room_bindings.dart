import 'package:get/get.dart';
import 'list_room_controller.dart';

class ListRoomBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(ListRoomController());
  }
}
