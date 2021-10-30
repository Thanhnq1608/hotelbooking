import 'package:get/get.dart';
import 'package:hotelbooking/app/room_detail/components/comtroller/room_detail_controller.dart';

class RoomDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(RoomDetailController());
  }
}
