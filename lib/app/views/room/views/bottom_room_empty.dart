import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotelbooking/app/history/history.model.dart';
import 'package:hotelbooking/app/history/history_service.dart';
import 'package:hotelbooking/app/list_room_empty/list_room_empty.dart';
import 'package:hotelbooking/app/views/room/service/oderRoomService.dart';
import 'package:hotelbooking/app/views/room/service/orderroom.model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../controller/room_booking_controller.dart';
import 'package:async/async.dart';

class BottomRoomEmpty extends StatelessWidget {
  final int priceRoom;
  final String idRoom;
  BottomRoomEmpty({this.priceRoom, this.idRoom});

  var controller = Get.put(RoomBookingController());
  final textController = TextEditingController();

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
            margin: EdgeInsets.only(
                left: MediaQuery.of(context).size.width * 0.1,
                top: 30,
                right: MediaQuery.of(context).size.width * 0.1,
                bottom: 5),
            height: MediaQuery.of(context).size.height * 0.05,
            decoration: BoxDecoration(
              color: Color(0xFFFF6666),
              borderRadius: BorderRadius.circular(20),
            ),
            child: FutureBuilder<List<HistoryModel>>(
                future: getHistoryRoom(),
                builder: (context, snapshot) {
                  return snapshot.hasData
                      ? TextButton(
                          onPressed: () async {
                            if (snapshot.data.last.bookingStatus != 3) {
                              Get.snackbar("Thông báo",
                                  'Bạn phải hoàn thành đơn đạt phòng trước khi đặt đơn mới',
                                  snackPosition: SnackPosition.TOP,
                                  backgroundColor: Colors.red,
                                  colorText: Colors.white);
                            } else {
                              if (controller.checkTimeBookRoom() == true) {
                                final prefs =
                                    await SharedPreferences.getInstance();
                                String nameUser = prefs.getString('name') ?? '';
                                String phoneUser =
                                    prefs.getString('phone') ?? '';
                                String email = prefs.getString('email') ?? '';
                                var payload = <String, String>{
                                  "fullName": nameUser.replaceAll(' ', ''),
                                  'phone': phoneUser,
                                  'timeBookingStart':
                                      '${controller.dateStart.value.hour}:${controller.dateStart.value.minute} ${controller.dateStart.value.day}/${controller.dateStart.value.month}/${controller.dateStart.value.year}',
                                  'timeBookingEnd':
                                      '${controller.dateEnd.value.hour}:${controller.dateEnd.value.minute} ${controller.dateEnd.value.day}/${controller.dateEnd.value.month}/${controller.dateEnd.value.year}',
                                  "totalRoomRate": '0',
                                  'email': email,
                                  'advanceDeposit': '0',
                                  'bookingStatus': '0'
                                };
                                Result<OrderRoomBooked> result =
                                    await postOderRoom(payload);
                                if (result.isValue) {
                                  final prefs =
                                      await SharedPreferences.getInstance();
                                  prefs.setString(
                                      'id', result.asValue.value.id);
                                  await Get.to(() => ListRoomView(
                                        type: 'book multiple rooms',
                                      ));
                                } else {
                                  Get.snackbar("Thông báo",
                                      'Đã xảy ra lỗi vui lòng thử lại',
                                      snackPosition: SnackPosition.TOP,
                                      backgroundColor: Colors.red,
                                      colorText: Colors.white);
                                }
                              }
                            }
                          },
                          child: Text(
                            'Đặt phòng ngay',
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 20,
                                color: Colors.white),
                          ))
                      : Container(
                          child: Center(
                            child: Text(
                              'Đặt phòng ngay',
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 20,
                                  color: Colors.white),
                            ),
                          ),
                        );
                }),
          )
        ],
      ),
    );
  }
}
