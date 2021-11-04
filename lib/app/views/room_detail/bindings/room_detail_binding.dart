import 'package:get/get.dart';
import 'package:hotelbooking/app/views/room_detail/controller/room_detail_controller.dart';

class RoomDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(RoomDetailController());
  }
}
