import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomNavigationController extends GetxController {
  var isCheckFocusProfile = false.obs;
  var isCheckFocusBook = true.obs;
  Color iconColorBook() {
    if (isCheckFocusBook.value) {
      return Color(0xFFFF6666);
    } else {
      return Color(0xFFCCCCCC);
    }
  }

  Color iconColorProfile() {
    if (isCheckFocusProfile.value) {
      return Color(0xFFFF6666);
    } else {
      return Color(0xFFCCCCCC);
    }
  }

  void onClickProfile() {
    Get.toNamed('/profile');
    if (isCheckFocusProfile.value == false) {
      isCheckFocusProfile.value = true;
      isCheckFocusBook.value = false;
    }
  }

  void onClickBook() {
    Get.toNamed('/list_room');
    if (isCheckFocusBook.value == false) {
      isCheckFocusProfile.value = false;
      isCheckFocusBook.value = true;
    }
  }
}
