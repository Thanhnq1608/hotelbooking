import 'package:get/get.dart';
import 'package:hotelbooking/app/views/room/room_booking_controller.dart';

class RoomBookingBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(RoomBookingController());
  }
}
