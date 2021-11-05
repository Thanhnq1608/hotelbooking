import 'package:get/get.dart';
import 'package:hotelbooking/app/views/list_room_empty/controller/list_room_controller.dart';

class ListRoomBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(ListRoomController());
  }
}
