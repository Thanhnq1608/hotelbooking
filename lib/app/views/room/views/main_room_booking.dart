import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotelbooking/tools/bottom_date_picker.dart';
import '../controller/room_booking_controller.dart';

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
        InkWell(
          onTap: () async {
            var result = await Get.bottomSheet(BottomDatePicker());
            if (result != null) {
              controller.dateStart.value = result;
            }
          },
          child: Container(
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
              () => Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.only(bottom: 8),
                    child: Text(
                        '${controller.dateStart.value.hour}:${controller.dateStart.value.minute}'),
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
        InkWell(
          onTap: () async {
            var result = await Get.bottomSheet(BottomDatePicker(
              initialDate: controller.dateStart.value,
            ));
            if (result != null) {
              controller.dateEnd.value = result;
            }
          },
          child: Container(
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
              () => Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.only(bottom: 8),
                    child: Text(
                        '${controller.dateEnd.value.hour}:${controller.dateEnd.value.minute}'),
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
    return Container(
      width: 320,
      height: 200,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 10),
            alignment: Alignment.center,
            child: Text(
              'Number of rooms you want',
              style: TextStyle(
                  fontWeight: FontWeight.w700, fontSize: 14, height: 1.3),
            ),
          ),
          Container(
            width: 150,
            height: 30,
            padding: EdgeInsets.zero,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                border: Border.all(
                    color: Colors.black, width: 1, style: BorderStyle.solid)),
            child: Row(
              children: [
                IconButton(
                  padding: EdgeInsets.zero,
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
                Expanded(
                  child: Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.zero,
                      decoration: BoxDecoration(
                          border: Border(
                              left: BorderSide(
                                  color: Colors.black,
                                  width: 1,
                                  style: BorderStyle.solid),
                              right: BorderSide(
                                  color: Colors.black,
                                  width: 1,
                                  style: BorderStyle.solid))),
                      child: Text('${controller.quantilyRoom.value}')),
                ),
                IconButton(
                  padding: EdgeInsets.zero,
                  icon: Icon(
                    Icons.add,
                    size: 15,
                  ),
                  onPressed: () {
                    controller.quantilyRoom.value++;
                  },
                ),
              ],
            ),
          ),
        ],
      ),
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
