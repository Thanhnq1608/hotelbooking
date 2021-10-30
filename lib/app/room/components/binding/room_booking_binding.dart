import 'package:get/get.dart';
import 'package:hotelbooking/app/room/components/controller/room_booking_controller.dart';

class RoomBookingBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(RoomBookingController());
  }
}
