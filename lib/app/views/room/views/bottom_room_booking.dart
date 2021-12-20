import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotelbooking/app/history/history.dart';
import 'package:hotelbooking/app/history/history.model.dart';
import 'package:hotelbooking/app/history/history_service.dart';
import 'package:hotelbooking/app/views/room/service/oderRoomService.dart';
import 'package:hotelbooking/app/views/room/service/orderroom.model.dart';
import 'package:hotelbooking/app/views/room/views/dilog_success.dart';
import 'package:hotelbooking/tools/format.dart';
import 'package:hotelbooking/tools/notify.model.dart';
import 'package:hotelbooking/tools/notify.service.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../controller/room_booking_controller.dart';
import 'package:async/async.dart';

class BottomRoom extends StatelessWidget {
  final int priceRoom;
  final String idRoom;
  final List listTokenID;
  BottomRoom({this.priceRoom, this.idRoom, this.listTokenID});

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
      child: (idRoom != null && priceRoom != null)
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                    margin: EdgeInsets.only(top: 16),
                    child: Obx(
                      () => Text(
                        '${MoneyUtility.formatCurrency(priceRoom * controller.quantilyRoom.value)}',
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
                  child: FutureBuilder<List<HistoryModel>>(
                      future: getHistoryRoom('0972683051'),
                      builder: (context, snapshot) {
                        return snapshot.hasData
                            ? TextButton(
                                onPressed: () {
                                  if (snapshot.data.last.bookingStatus != 3) {
                                    Get.snackbar("Thông báo",
                                        'Bạn phải hoàn thành đơn đạt phòng trước khi đặt đơn mới',
                                        snackPosition: SnackPosition.TOP,
                                        backgroundColor: Colors.red,
                                        colorText: Colors.white);
                                  } else {
                                    if (controller.checkTimeBookRoom() ==
                                        true) {
                                      return showDialog(
                                          context: context,
                                          builder: (context) => AlertDialog(
                                                content: Container(
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              100)),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    children: [
                                                      Text('Tiền đặt cọc'),
                                                      Container(
                                                        margin: EdgeInsets.only(
                                                            top: 16),
                                                        child: TextField(
                                                          keyboardType:
                                                              TextInputType
                                                                  .number,
                                                          controller:
                                                              textController,
                                                          decoration: InputDecoration(
                                                              enabledBorder: OutlineInputBorder(
                                                                  borderRadius:
                                                                      BorderRadius.all(
                                                                          Radius.circular(
                                                                              30))),
                                                              focusedBorder: OutlineInputBorder(
                                                                  borderRadius:
                                                                      BorderRadius.all(
                                                                          Radius.circular(
                                                                              30))),
                                                              hintText:
                                                                  'Nhập số tiền bạn muốn đặt cọc'),
                                                        ),
                                                      ),
                                                      Container(
                                                        margin: EdgeInsets.only(
                                                            top: 8),
                                                        child: Row(
                                                          children: [
                                                            TextButton(
                                                                onPressed: () =>
                                                                    Get.back(),
                                                                child:
                                                                    Container(
                                                                  padding: EdgeInsets.symmetric(
                                                                      horizontal:
                                                                          32,
                                                                      vertical:
                                                                          16),
                                                                  decoration: BoxDecoration(
                                                                      color: Colors
                                                                          .red,
                                                                      border: Border.all(
                                                                          color: Colors
                                                                              .red,
                                                                          width:
                                                                              1,
                                                                          style: BorderStyle
                                                                              .solid),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              60)),
                                                                  child: Text(
                                                                    'Hủy',
                                                                    style: TextStyle(
                                                                        color: Colors
                                                                            .white),
                                                                  ),
                                                                )),
                                                            TextButton(
                                                                onPressed:
                                                                    () async {
                                                                  final prefs =
                                                                      await SharedPreferences
                                                                          .getInstance();
                                                                  String
                                                                      nameUser =
                                                                      prefs.getString(
                                                                              'name') ??
                                                                          '';
                                                                  String
                                                                      phoneUser =
                                                                      prefs.getString(
                                                                              'phone') ??
                                                                          '';
                                                                  String email =
                                                                      prefs.getString(
                                                                              'email') ??
                                                                          '';
                                                                  var payload = <
                                                                      String,
                                                                      String>{
                                                                    "fullName":
                                                                        nameUser.replaceAll(
                                                                            ' ',
                                                                            ''),
                                                                    'phone':
                                                                        phoneUser,
                                                                    'timeBookingStart':
                                                                        '${controller.dateStart.value.hour}:${controller.dateStart.value.minute} ${controller.dateStart.value.day}/${controller.dateStart.value.month}/${controller.dateStart.value.year}',
                                                                    'timeBookingEnd':
                                                                        '${controller.dateEnd.value.hour}:${controller.dateEnd.value.minute} ${controller.dateEnd.value.day}/${controller.dateEnd.value.month}/${controller.dateEnd.value.year}',
                                                                    "totalRoomRate":
                                                                        '${priceRoom * controller.quantilyRoom.value}',
                                                                    'email':
                                                                        email,
                                                                    'advanceDeposit':
                                                                        '${textController.text}',
                                                                    'bookingStatus':
                                                                        '0'
                                                                  };

                                                                  await Get
                                                                      .back();
                                                                  Result<OrderRoomBooked>
                                                                      result =
                                                                      await postOderRoom(
                                                                    payload,
                                                                    timeBookingStart:
                                                                        controller
                                                                            .dateStart
                                                                            .toString(),
                                                                    timeBookingEnd:
                                                                        controller
                                                                            .dateEnd
                                                                            .toString(),
                                                                    totalRoomRate: priceRoom *
                                                                        controller
                                                                            .quantilyRoom
                                                                            .value,
                                                                    advanceDeposit:
                                                                        textController
                                                                            .text,
                                                                  );
                                                                  var payloadUpdate =
                                                                      {
                                                                    "roomStatus":
                                                                        1,
                                                                    "idBooking":
                                                                        '${result.asValue.value.id}',
                                                                  };
                                                                  var payloadNotify =
                                                                      {
                                                                    "data": {
                                                                      "title":
                                                                          "Thông Báo",
                                                                      "message":
                                                                          "Có đơn đặt phòng mới"
                                                                    },
                                                                    "to":
                                                                        "clul0k_4SUm7mDvD7udo8C:APA91bG2o1RxHqMry8te3R9o6WNIhwoL2QjLlFR9jOD584IZ4D9BOFLiszzB-n-8QIrR3M6g-SApftNtOZxpuUnHqop8oJ0xqPCWUim_iEsSDNOTSoU0gZS7G9F-ukUZlI9m5oCb2D0-"
                                                                  };
                                                                  if (result
                                                                      .isValue) {
                                                                    Get.defaultDialog(
                                                                        title: "Xác nhận",
                                                                        middleText: "Số tiền đặt cọc của bạn: ${textController.text}. Bạn có muốn tiếp tục",
                                                                        backgroundColor: Colors.white,
                                                                        titleStyle: TextStyle(color: Colors.pink),
                                                                        middleTextStyle: TextStyle(color: Colors.pink),
                                                                        onCancel: () => Get.back(),
                                                                        onConfirm: () async {
                                                                          Get.defaultDialog(
                                                                              title: "Xác nhận",
                                                                              middleText: "Bạn vui lòng chuyển khoản đến STK: 999999 với nôi dung: Họ tên-Sdt-chuyển tiền đặt phòng",
                                                                              backgroundColor: Colors.white,
                                                                              titleStyle: TextStyle(color: Colors.pink),
                                                                              middleTextStyle: TextStyle(color: Colors.pink),
                                                                              onCancel: () => Get.back(),
                                                                              onConfirm: () async {
                                                                                Result<bool> resultUpdate = await updateRoomStatus(payloadUpdate, idRoom: idRoom);
                                                                                if (resultUpdate.isValue) {
                                                                                  await postNotify(payloadNotify);
                                                                                  Get.snackbar("Thành cồng", 'Bạn đã đặt phòng thành công', snackPosition: SnackPosition.TOP, backgroundColor: Colors.green, colorText: Colors.white);
                                                                                  Get.offAll(History(
                                                                                    phone: phoneUser,
                                                                                  ));
                                                                                }
                                                                              });
                                                                        });
                                                                  } else if (result
                                                                      .isError) {
                                                                    Get.snackbar(
                                                                        "",
                                                                        'Đã xảy ra lỗi vui lòng thử lại',
                                                                        snackPosition:
                                                                            SnackPosition
                                                                                .TOP,
                                                                        backgroundColor:
                                                                            Colors
                                                                                .red,
                                                                        colorText:
                                                                            Colors.white);
                                                                  }
                                                                },
                                                                child:
                                                                    Container(
                                                                  padding: EdgeInsets.symmetric(
                                                                      horizontal:
                                                                          32,
                                                                      vertical:
                                                                          16),
                                                                  decoration: BoxDecoration(
                                                                      color: Colors
                                                                          .green,
                                                                      border: Border.all(
                                                                          color: Colors
                                                                              .green,
                                                                          width:
                                                                              1,
                                                                          style: BorderStyle
                                                                              .solid),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              60)),
                                                                  child: Text(
                                                                    'Đồng Ý',
                                                                    style: TextStyle(
                                                                        color: Colors
                                                                            .white),
                                                                  ),
                                                                )),
                                                          ],
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              ));
                                    } else {}
                                  }
                                  // controller.checkTimeBookRoom();
                                },
                                child: Text(
                                  'Đặt phòng ngay',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ))
                            : Container(
                                child: Center(
                                child: Text(
                                  'Đặt phòng ngay',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ));
                      }),
                )
              ],
            )
          : Container(),
    );
  }

  void notify() async {
    var payloadNotify = {
      "data": {"title": "Create Order", "message": "Have a new order booking"},
      "to":
          "dOkCu5PISgS62M0SCZfT3q:APA91bGhCT6NLXl-iFyFMFln63Pg23LdUx0O4MsYh1uJBGsWzrU6r-6tZKeRNPmx2b7Nl9AtD364lbmv5yLFzdeHNdPcm04wadUipbUKNPRymAYkAUdD9TirzXBKtCsuyPzH1NgZzmdu"
    };
    // resultUpdate =
    await postNotify(payloadNotify);
    // for (var i = 0; i < listTokenID.length; i++) {
    // }
    // if (resultUpdate.isValue) {
    //   await Get.back();
    //   Get.snackbar("Thành cồng", 'Bạn đã đặt phòng thành công',
    //       snackPosition: SnackPosition.TOP,
    //       backgroundColor: Colors.green,
    //       colorText: Colors.white);
    // }
  }
}
