import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotelbooking/app/history/history.dart';
import 'package:hotelbooking/app/history/history.model.dart';
import 'package:hotelbooking/app/history/history_service.dart';
import 'package:hotelbooking/app/views/room/service/oderRoomService.dart';
import 'package:hotelbooking/app/views/room/service/orderroom.model.dart';
import 'package:hotelbooking/login_register/auth_api_service.dart';
import 'package:hotelbooking/tools/format.dart';
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
                      future: getHistoryRoom(),
                      builder: (context, snapshot) {
                        return snapshot.hasData
                            ? TextButton(
                                onPressed: () {
                                  if (snapshot.data.last.bookingStatus != 3) {
                                    Get.snackbar("Th??ng b??o",
                                        'B???n ph???i ho??n th??nh ????n ?????t ph??ng tr?????c khi ?????t ????n m???i',
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
                                                      Text('Ti???n ?????t c???c'),
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
                                                                  'Nh???p s??? ti???n b???n mu???n ?????t c???c'),
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
                                                                    'H???y',
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
                                                                  if (result
                                                                      .isValue) {
                                                                    Get.defaultDialog(
                                                                        title: "X??c nh???n",
                                                                        middleText: "S??? ti???n ?????t c???c c???a b???n: ${textController.text}. B???n c?? mu???n ti???p t???c",
                                                                        backgroundColor: Colors.white,
                                                                        titleStyle: TextStyle(color: Colors.pink),
                                                                        middleTextStyle: TextStyle(color: Colors.pink),
                                                                        onCancel: ()async {
                                                                          await deleteOrder(id:result.asValue.value.id );
                                                                          Get.back();
                                                                        },
                                                                        onConfirm: () async {
                                                                          int.parse(textController.text) < (priceRoom * controller.quantilyRoom.value) * (30 / 100)
                                                                              ? Get.snackbar("Th??ng b??o", 'S??? ti???n ?????t c???c t???i thi???u 30% gi?? tr??? ????n h??ng', snackPosition: SnackPosition.TOP, backgroundColor: Colors.red, colorText: Colors.white)
                                                                              : Get.defaultDialog(
                                                                                  title: "X??c nh???n",
                                                                                  middleText: "B???n vui l??ng chuy???n kho???n ?????n STK: 999999 v???i n??i dung: H??? t??n-Sdt-chuy???n ti???n ?????t ph??ng",
                                                                                  backgroundColor: Colors.white,
                                                                                  titleStyle: TextStyle(color: Colors.pink),
                                                                                  middleTextStyle: TextStyle(color: Colors.pink),
                                                                                  onCancel: () {},
                                                                                  onConfirm: () async {
                                                                                    Result<bool> resultUpdate = await updateRoomStatus(payloadUpdate, idRoom: idRoom);
                                                                                    if (resultUpdate.isValue) {
                                                                                      await notify();
                                                                                      Get.snackbar("Th??nh c???ng", 'B???n ???? ?????t ph??ng th??nh c??ng', snackPosition: SnackPosition.TOP, backgroundColor: Colors.green, colorText: Colors.white);
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
                                                                        '???? x???y ra l???i vui l??ng th??? l???i',
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
                                                                    '?????ng ??',
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
                                  '?????t ph??ng ngay',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ))
                            : Container(
                                child: Center(
                                child: Text(
                                  '?????t ph??ng ngay',
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
    List<String> tokenId = [];
    await AuthApiService().getEmployee().then((value) {
      for (var i = 0; i < value.data.length; i++) {
        tokenId.add(value.data[i].tokenId);
      }
    });

    tokenId.forEach((element) async {
      var payloadNotify = {
        "data": {
          "title": "Create Order",
          "message": "Have a new order booking"
        },
        "to": "$element"
      };
      await postNotify(payloadNotify);
    });
  }
}
