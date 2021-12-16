import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotelbooking/tools/bottom_date_picker.dart';
import '../controller/room_booking_controller.dart';

class MainRoom extends StatelessWidget {
  var controller = Get.put(RoomBookingController());
  Widget _bookingOption(BuildContext context) {
    return new Container(child: Text('Chọn thời gian sử dụng phòng'));
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

  @override
  Widget build(BuildContext context) {
    return new Container(
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 64),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(color: Colors.grey, offset: Offset(0, 5), blurRadius: 7)
          ]),
      child: Container(
        margin: EdgeInsets.all(32),
        child: Column(
          children: [
            _timePicker(context),
          ],
        ),
      ),
    );
  }
}
