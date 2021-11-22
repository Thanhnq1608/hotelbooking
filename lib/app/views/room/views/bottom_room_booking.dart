import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotelbooking/app/views/room/service/oderRoomService.dart';
import 'package:hotelbooking/tools/format.dart';
import '../controller/room_booking_controller.dart';
import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';

class BottomRoom extends StatelessWidget {
  var controller = Get.put(RoomBookingController());
  final int priceRoom;
  BottomRoom({this.priceRoom});
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
                                      inputFormatters: [
                                        CurrencyTextInputFormatter(
                                          decimalDigits: 0,
                                           locale: 'vi',
                                        )
                                      ],
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
                                                  horizontal: 32, vertical: 16),
                                              decoration: BoxDecoration(
                                                  color: Colors.red,
                                                  border: Border.all(
                                                      color: Colors.red,
                                                      width: 1,
                                                      style: BorderStyle.solid),
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
                                              var payload = {
                                                "fullName": 'tien test'
                                                    .replaceAll(' ', ''),
                                                'phone': '011345678',
                                                'timeBookingStart':
                                                    controller.dateStart,
                                                'timeBookingEnd':
                                                    controller.dateEnd,
                                                "totalRoomRate": priceRoom *
                                                    controller
                                                        .quantilyRoom.value,
                                                'email': 'test@gmail.com',
                                                'advanceDeposit':
                                                    textController.text,
                                                'bookingStatus': '0'
                                              };
                                              await postOderRoom(payload);
                                            },
                                            child: Container(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 32, vertical: 16),
                                              decoration: BoxDecoration(
                                                  color: Colors.green,
                                                  border: Border.all(
                                                      color: Colors.green,
                                                      width: 1,
                                                      style: BorderStyle.solid),
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
                  'Book Now',
                  style: TextStyle(color: Colors.white),
                )),
          )
        ],
      ),
    );
  }
}
