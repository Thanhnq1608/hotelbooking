import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotelbooking/app/history/history.dart';
import 'package:hotelbooking/app/views/room/controller/room_booking_controller.dart';
import 'package:hotelbooking/app/views/room/service/oderRoomService.dart';
import 'package:hotelbooking/app/views/room/service/orderroom.model.dart';
import 'package:hotelbooking/login_register/auth_api_service.dart';
import 'package:hotelbooking/login_register/employee.model.dart';
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
                                    Text('Ti???n ?????t c???c'),
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
                                                'Nh???p s??? ti???n b???n mu???n ?????t c???c'),
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
                                                  'H???y',
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
                                                  int.parse(textController
                                                              .text) <
                                                          caculatorPayment(0) *
                                                              (30 / 100)
                                                      ? Get.snackbar(
                                                          "Th??ng b??o",
                                                          'S??? ti???n ?????t c???c t???i thi???u 30% gi?? tr??? ????n h??ng',
                                                          snackPosition:
                                                              SnackPosition.TOP,
                                                          backgroundColor:
                                                              Colors.red,
                                                          colorText:
                                                              Colors.white)
                                                      : Get.defaultDialog(
                                                          title: "X??c nh???n",
                                                          middleText:
                                                              "S??? ti???n ?????t c???c c???a b???n: ${textController.text}. B???n c?? mu???n ti???p t???c",
                                                          backgroundColor:
                                                              Colors.white,
                                                          titleStyle: TextStyle(
                                                              color:
                                                                  Colors.pink),
                                                          middleTextStyle:
                                                              TextStyle(
                                                                  color: Colors
                                                                      .pink),
                                                          onCancel: () {},
                                                          onConfirm: () async {
                                                            Get.defaultDialog(
                                                                title:
                                                                    "X??c nh???n",
                                                                middleText:
                                                                    "B???n vui l??ng chuy???n kho???n ?????n STK: 999999 v???i n??i dung: H??? t??n-Sdt-chuy???n ti???n ?????t ph??ng",
                                                                backgroundColor:
                                                                    Colors
                                                                        .white,
                                                                titleStyle: TextStyle(
                                                                    color: Colors
                                                                        .pink),
                                                                middleTextStyle:
                                                                    TextStyle(
                                                                        color: Colors
                                                                            .pink),
                                                                onCancel: () {},
                                                                onConfirm:
                                                                    () async {
                                                                  await indextRoom(
                                                                      payloadUpdate);
                                                                });

                                                            //
                                                          });
                                                } else if (result.isError) {
                                                  Get.snackbar("",
                                                      '???? x???y ra l???i vui l??ng th??? l???i',
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
                                                  '?????ng ??',
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
                    '?????t ph??ng ngay',
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
    List<String> tokenId = [];
    await AuthApiService().getEmployee().then((value) {
      for (var i = 0; i < value.data.length; i++) {
        tokenId.add(value.data[i].tokenId);
      }
    });

    Result<bool> resultUpdate;
    final prefs = await SharedPreferences.getInstance();
    String phoneUser = prefs.getString('phone') ?? '';
    for (var i = 0; i < listsIdRoom.length; i++) {
      resultUpdate =
          await updateRoomStatus(payloadUpdate, idRoom: listsIdRoom[i]);
    }
    if (resultUpdate.isValue) {
      tokenId.forEach((element) async {
        var payloadNotify = {
          "data": {"title": "Th??ng B??o", "message": "C?? ????n ?????t ph??ng m???i"},
          "to": "$element"
        };
        await postNotify(payloadNotify);
      });
      Get.offAll(History(
        phone: phoneUser,
      ));
    }
  }
}
