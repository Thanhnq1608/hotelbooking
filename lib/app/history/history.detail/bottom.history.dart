import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:async/async.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:hotelbooking/app/history/history.dart';
import 'package:hotelbooking/app/history/history_service.dart';
import 'package:hotelbooking/app/views/room/service/oderRoomService.dart';
import 'package:hotelbooking/login_register/auth_api_service.dart';
import 'package:hotelbooking/tools/notify.service.dart';

class BottomHistory extends StatelessWidget {
  final String idBooking;
  List idRoom = [];
  BottomHistory({
    this.idBooking,
  });
  var payloadUpdate = {
    "roomStatus": 0,
    "idBooking": '',
  };
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
              child: Container(
                child: Center(
                  child: TextButton(
                    onPressed: () async {
                      Result<bool> result = await deleteOrder(id: idBooking);
                      if (result.isValue) {
                        await getIDRoomBooking(idBooking).then((value) {
                          for (var i = 0; i < value.length; i++) {
                            idRoom.add(value[i].id);
                          }
                        });
                        print(idRoom);
                        for (var i = 0; i < idRoom.length; i++) {
                          Result<bool> result2 = await updateRoomStatus(
                              payloadUpdate,
                              idRoom: idRoom[i]);
                          if (result2.isValue) {
                            List<String> tokenId = [];
                            await AuthApiService().getEmployee().then((value) {
                              for (var i = 0; i < value.data.length; i++) {
                                tokenId.add(value.data[i].tokenId);
                              }
                            });

                            tokenId.forEach((element) async {
                              var payloadNotify = {
                                "data": {
                                  "title": "Delete Order",
                                  "message": "????n ?????t ph??ng ???? b??? h???y"
                                },
                                "to": "$element"
                              };
                              await postNotify(payloadNotify);
                            });

                            Fluttertoast.showToast(
                                msg: "B???n ???? h???y ????n th??nh c??ng");
                            Get.back();
                          }
                        }
                      }
                    },
                    child: Text(
                      'H???y ph??ng',
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 20,
                          color: Colors.white),
                    ),
                  ),
                ),
              ))
        ],
      ),
    );
  }
}
