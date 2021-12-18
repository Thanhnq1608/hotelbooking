import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotelbooking/app/history/history.dart';
import 'package:hotelbooking/app/views/room/controller/room_booking_controller.dart';
import 'package:hotelbooking/app/views/room/service/oderRoomService.dart';
import 'package:hotelbooking/app/views/room/service/orderroom.model.dart';
import 'package:hotelbooking/tools/format.dart';
import 'package:hotelbooking/tools/notify.service.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:async/async.dart';

class BottomRoomBook extends StatelessWidget {
  final List listsRoom;
  final List listsIdRoom;
  final String idRoom;
  BottomRoomBook({
    this.idRoom,
    this.listsIdRoom,
    this.listsRoom,
  });

  var controller = Get.put(RoomBookingController());
  final textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
                    '${MoneyUtility.formatCurrency(caculatorPayment(0))}',
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
                    // if (controller.checkTimeBookRoom() == true) {
                    return showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                              content: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(100)),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text('Tiền đặt cọc'),
                                    Container(
                                      margin: EdgeInsets.only(top: 16),
                                      child: TextField(
                                        keyboardType: TextInputType.number,
                                        controller: textController,
                                        decoration: InputDecoration(
                                            enabledBorder: OutlineInputBorder(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(30))),
                                            focusedBorder: OutlineInputBorder(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(30))),
                                            hintText:
                                                'Nhập số tiền bạn muốn đặt cọc'),
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(top: 8),
                                      child: Row(
                                        children: [
                                          TextButton(
                                              onPressed: () => Get.back(),
                                              child: Container(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 32,
                                                    vertical: 16),
                                                decoration: BoxDecoration(
                                                    color: Colors.red,
                                                    border: Border.all(
                                                        color: Colors.red,
                                                        width: 1,
                                                        style:
                                                            BorderStyle.solid),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            60)),
                                                child: Text(
                                                  'Hủy',
                                                  style: TextStyle(
                                                      color: Colors.white),
                                                ),
                                              )),
                                          TextButton(
                                              onPressed: () async {
                                                final prefs =
                                                    await SharedPreferences
                                                        .getInstance();
                                                String id =
                                                    prefs.getString('id') ?? '';
                                                var payload = <String, String>{
                                                  "totalRoomRate":
                                                      '${caculatorPayment(0)}',
                                                  'advanceDeposit':
                                                      '${textController.text}',
                                                };

                                                await Get.back();
                                                Result<bool> result =
                                                    await updateOderRoom(
                                                        payload,
                                                        id: id);
                                                var payloadUpdate = {
                                                  "roomStatus": 1,
                                                  "idBooking": '$id',
                                                };

                                                if (result.isValue) {
                                                  Get.defaultDialog(
                                                      title: "Xác nhận",
                                                      middleText:
                                                          "Số tiền đặt cọc của bạn: ${textController.text}. Bạn có muốn tiếp tục",
                                                      backgroundColor:
                                                          Colors.white,
                                                      titleStyle: TextStyle(
                                                          color: Colors.pink),
                                                      middleTextStyle:
                                                          TextStyle(
                                                              color:
                                                                  Colors.pink),
                                                      onCancel: () =>
                                                          Get.back(),
                                                      onConfirm: () async {
                                                        Get.defaultDialog(
                                                            title: "Xác nhận",
                                                            middleText:
                                                                "Bạn vui lòng chuyển khoản đến STK: 999999 với nôi dung: Họ tên-Sdt-chuyển tiền đặt phòng",
                                                            backgroundColor:
                                                                Colors.white,
                                                            titleStyle:
                                                                TextStyle(
                                                                    color: Colors
                                                                        .pink),
                                                            middleTextStyle:
                                                                TextStyle(
                                                                    color: Colors
                                                                        .pink),
                                                            onCancel: () =>
                                                                Get.back(),
                                                            onConfirm:
                                                                () async {
                                                              await indextRoom(
                                                                  payloadUpdate);
                                                            });

                                                        //
                                                      });
                                                } else if (result.isError) {
                                                  Get.snackbar("",
                                                      'Đã xảy ra lỗi vui lòng thử lại',
                                                      snackPosition:
                                                          SnackPosition.TOP,
                                                      backgroundColor:
                                                          Colors.red,
                                                      colorText: Colors.white);
                                                }
                                              },
                                              child: Container(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 32,
                                                    vertical: 16),
                                                decoration: BoxDecoration(
                                                    color: Colors.green,
                                                    border: Border.all(
                                                        color: Colors.green,
                                                        width: 1,
                                                        style:
                                                            BorderStyle.solid),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            60)),
                                                child: Text(
                                                  'Đồng Ý',
                                                  style: TextStyle(
                                                      color: Colors.white),
                                                ),
                                              )),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ));
                    // } else {}
                    // controller.checkTimeBookRoom();
                  },
                  child: Text(
                    'Đặt phòng ngay',
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 20,
                        color: Colors.white),
                  )),
            )
          ],
        ));
  }

  int caculatorPayment(int priceRoom) {
    for (var i = 0; i < listsRoom.length; i++) {
      // ignore: unnecessary_statements
      priceRoom += int.parse(listsRoom[i]) * controller.quantilyRoom.value;
    }
    return priceRoom;
  }

  void indextRoom(payloadUpdate) async {
    var payloadNotify = {
      "data": {"title": "Thông Báo", "message": "Có đơn đặt phòng mới"},
      "to":
          "d2dqQvlSR2Wixcx8Xobrc_:APA91bHCjvrRX5_fTb_lG1OkYGp90dTJlqbL7f8RVXctlShqSZRbqA18TuAfa5v1XfI11goUlYzdBycO1D0P3QS5xsbcw4N8h50i9JBwXLncQROj0Dxg9hhVsjZyIg6w7j2Uc9fMRdOc"
    };
    Result<bool> resultUpdate;
    final prefs = await SharedPreferences.getInstance();
    String phoneUser = prefs.getString('phone') ?? '';
    for (var i = 0; i < listsIdRoom.length; i++) {
      resultUpdate =
          await updateRoomStatus(payloadUpdate, idRoom: listsIdRoom[i]);
    }
    if (resultUpdate.isValue) {
      
      await postNotify(payloadNotify);
      await Get.snackbar("Thành cồng", 'Bạn đã đặt phòng thành công',
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.green,
          colorText: Colors.white);
      Get.offAll(History(
        phone: phoneUser,
      ));
    }
  }
}
