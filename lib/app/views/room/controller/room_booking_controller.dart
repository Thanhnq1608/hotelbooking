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

  TabController tabController;
  Rx<int> selectedIndex = 0.obs;

  bool checkTimeBookRoom() {
    if (dateEnd.value.isAfter(dateStart.value)) {
      Get.snackbar("Thông báo", 'You have successfully booked your room',
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.pink,
          colorText: Colors.white);
      return true;
    } else {
      Get.snackbar("Thông báo", 'Ngày bạn chọn phải sau ngày hiện tại',
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.red,
          colorText: Colors.white);
      return false;
    }
  }

  @override
  void onInit() {
    dateEnd.value = dateStart.value;
    tabController = TabController(length: 2, vsync: this);
    super.onInit();
  }
}
