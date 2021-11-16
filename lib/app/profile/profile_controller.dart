import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  var username = 'thanhnq1608@gmail.com'.obs;
  var fullname = 'Quang Thanh'.obs;
  var dateOfBirrth = DateTime.now().obs;
  var address = 'Hải Phòng';
  var language = 'English'.obs;
  var networkImage =
      'https://i.pinimg.com/564x/31/ba/37/31ba3731e1b1f3791ee2ad5860a1098c.jpg'
          .obs;
  Rx<bool> isCheckGender = true.obs;

  void setAvaterByGender() {
    if (isCheckGender.value == true) {
      // ignore: await_only_futures
      networkImage.value =
          'https://i.pinimg.com/564x/31/ba/37/31ba3731e1b1f3791ee2ad5860a1098c.jpg';
    } else {
      // ignore: await_only_futures
      networkImage.value =
          'https://i.pinimg.com/564x/90/25/f0/9025f06ee116ef0e3f406f9be52eb9a3.jpg';
    }
  }
}
