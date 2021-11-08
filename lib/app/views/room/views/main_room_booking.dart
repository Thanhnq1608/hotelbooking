import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../room_booking_controller.dart';

class MainRoom extends GetView<RoomBookingController> {
  Widget _bookingOption(BuildContext context) {
    return new Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Obx(
            () => Container(
              decoration: BoxDecoration(
                color: controller.isActiveHour.value
                    ? Colors.pinkAccent
                    : Colors.white,
                border: Border.all(
                  color: Colors.black,
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              child: FlatButton(
                onPressed: () {
                  controller.isActiveHour.value = true;
                  controller.isActiveDaily.value = false;
                  controller.isActiveOvernight.value = false;
                },
                child: Text(
                  'Hourly',
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ),
          ),
          Obx(
            () => Container(
              decoration: BoxDecoration(
                color: controller.isActiveDaily.value
                    ? Colors.pinkAccent
                    : Colors.white,
                border: Border.all(
                  color: Colors.black,
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              child: FlatButton(
                onPressed: () {
                  controller.isActiveHour.value = false;
                  controller.isActiveDaily.value = true;
                  controller.isActiveOvernight.value = false;
                },
                child: Text(
                  'Daily',
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ),
          ),
          Obx(
            () => Container(
              decoration: BoxDecoration(
                color: controller.isActiveOvernight.value
                    ? Colors.pinkAccent
                    : Colors.white,
                border: Border.all(
                  color: Colors.black,
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              child: FlatButton(
                onPressed: () {
                  controller.isActiveHour.value = false;
                  controller.isActiveDaily.value = false;
                  controller.isActiveOvernight.value = true;
                },
                child: Text(
                  'Overnight',
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _timePicker(BuildContext context) {
    return new Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Container(
          width: 132,
          height: 67,
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(
              color: Colors.white,
              width: 1,
            ),
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.grey,
                blurRadius: 7,
                offset: Offset(0, 5), // changes position of shadow
              ),
            ],
          ),
          child: Obx(
            () => FlatButton(
              onPressed: () {
                controller.isActiveHour.value == true
                    ? controller.selectTimePicker(context, 1)
                    : controller.selectDatePicker(context, 1);
                print('${controller.timeStart.value}');
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.only(bottom: 8),
                    child: Text(
                        '${controller.timeStart.value.hour}:${controller.timeStart.value.minute}'),
                  ),
                  Container(
                    child: Text(
                        '${controller.dateStart.value.day}/${controller.dateStart.value.month}/${controller.dateStart.value.year}'),
                  )
                ],
              ),
            ),
          ),
        ),
        Container(
          width: 132,
          height: 67,
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(
              color: Colors.white,
              width: 1,
            ),
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.grey,
                blurRadius: 7,
                offset: Offset(0, 5), // changes position of shadow
              ),
            ],
          ),
          child: Obx(
            () => FlatButton(
              onPressed: () {
                controller.isActiveHour.value == true
                    ? controller.selectTimePicker(context, 0)
                    : controller.selectDatePicker(context, 0);
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.only(bottom: 8),
                    child: Text(
                        '${controller.timeEnd.value.hour}:${controller.timeEnd.value.minute}'),
                  ),
                  Container(
                    child: Text(
                        '${controller.dateEnd.value.day}/${controller.dateEnd.value.month}/${controller.dateEnd.value.year}'),
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _quantiltRoom() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.only(bottom: 16),
          alignment: Alignment.center,
          child: Text(
            'The number of rooms you want to book',
            style: TextStyle(
                fontWeight: FontWeight.w700, fontSize: 14, height: 1.3),
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 64, right: 64),
          height: 30,
          decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                    color: Colors.black45,
                    blurRadius: 4,
                    spreadRadius: 2,
                    offset: Offset(0, 1))
              ],
              border: Border.all(color: Colors.white, width: 1),
              borderRadius: BorderRadius.circular(10)),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                decoration: BoxDecoration(
                    border: Border(
                        right: BorderSide(
                  color: Color(0xFF000000),
                  style: BorderStyle.solid,
                ))),
                child: IconButton(
                  icon: Icon(
                    Icons.remove,
                    size: 15,
                  ),
                  onPressed: () {
                    if (controller.quantilyRoom.value > 1) {
                      controller.quantilyRoom.value--;
                    }
                  },
                ),
              ),
              Container(
                  width: 40,
                  alignment: Alignment.center,
                  child: Text('${controller.quantilyRoom.value}')),
              Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    border: Border(
                        left: BorderSide(
                  color: Color(0xFF000000),
                  width: 1.0,
                  style: BorderStyle.solid,
                ))),
                child: IconButton(
                  icon: Icon(
                    Icons.add,
                    size: 15,
                  ),
                  onPressed: () {
                    controller.quantilyRoom.value++;
                  },
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      margin: EdgeInsets.only(left: 16, right: 16, top: 32),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(color: Colors.grey, offset: Offset(0, 5), blurRadius: 7)
          ]),
      child: Column(
        children: [
          Container(
              margin: EdgeInsets.only(top: 8, left: 8, right: 8),
              child: _bookingOption(context)),
          Container(
            margin: EdgeInsets.only(top: 24),
            child: _timePicker(context),
          ),
          Container(
              margin: EdgeInsets.only(top: 60, bottom: 16, left: 60, right: 60),
              child: Obx(() => _quantiltRoom()))
        ],
      ),
    );
  }
}
