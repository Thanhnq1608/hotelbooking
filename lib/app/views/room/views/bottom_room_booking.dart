import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotelbooking/app/views/room/service/oderRoomService.dart';
import '../room_booking_controller.dart';

class BottomRoom extends GetView<RoomBookingController> {
  BottomRoom({this.priceRoom});
  final int priceRoom;

  @override
  Widget build(BuildContext context) {
    // caculatorPayment();
    return new Container(
      height: 100,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              blurRadius: 7,
            )
          ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
              margin: EdgeInsets.only(top: 16),
              child: Obx(
                () => Text(
                  '${priceRoom * controller.quantilyRoom.value} đ',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                      fontSize: 20,
                      height: 1.2),
                  textAlign: TextAlign.center,
                ),
              )),
          Container(
            margin: EdgeInsets.only(
                left: MediaQuery.of(context).size.width * 0.1,
                top: 10,
                right: MediaQuery.of(context).size.width * 0.1,
                bottom: 5),
            height: MediaQuery.of(context).size.height * 0.05,
            decoration: BoxDecoration(
              color: Color(0xFFFF6666),
              borderRadius: BorderRadius.circular(20),
            ),
            child: TextButton(
                onPressed: () {
                  if (controller.checkTimeBookRoom() == true) {
                    postOderRoom(
                        totalRoomRate: controller.quantilyRoom.value,
                        totalPayment:
                            priceRoom * controller.quantilyRoom.value);
                  } else {}
                  // controller.checkTimeBookRoom();
                },
                child: Text(
                  'Book Now',
                  style: TextStyle(color: Colors.white),
                )),
          )
        ],
      ),
    );
  }
}
