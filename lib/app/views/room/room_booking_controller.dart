import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RoomBookingController extends GetxController
    with SingleGetTickerProviderMixin {
  Rx<bool> isActiveHour = false.obs;
  Rx<bool> isActiveOvernight = false.obs;
  Rx<bool> isActiveDaily = false.obs;
  Rx<int> quantilyRoom = 1.obs;
  Rx<DateTime> dateStart = DateTime.now().obs;
  Rx<DateTime> dateEnd = DateTime.now().obs;
  Rx<TimeOfDay> timeStart = TimeOfDay.now().obs;
  Rx<TimeOfDay> timeEnd = TimeOfDay.now().obs;

  TabController tabController;
  Rx<int> selectedIndex = 0.obs;

  Future<Null> selectDatePicker(BuildContext context, int status) async {
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2021),
      lastDate: DateTime(2050),
    );
    if (picked != null && picked.isAfter(DateTime.now())) {
      if (status == 1) {
        dateStart.value = picked;
      } else {
        dateEnd.value = picked;
      }
    }
  }

  Future<TimeOfDay> selectTimePicker(BuildContext context, int status) async {
    final TimeOfDay picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (picked != null && picked != TimeOfDay.now()) {
      if (status == 1) {
        timeStart.value = picked;
      } else {
        timeEnd.value = picked;
      }
    }
  }

  bool checkTimeBookRoom() {
    if (dateEnd.value.isAfter(dateStart.value)) {
      Get.snackbar("", 'You have successfully booked your room',
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.pink,
          colorText: Colors.white);
      return true;
    } else {
      Get.snackbar("", 'The date you choose must be after the current date',
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.pink,
          colorText: Colors.white);
      return false;
    }
  }

  @override
  void onInit() {
    tabController = TabController(length: 2, vsync: this);
    super.onInit();
  }
}
