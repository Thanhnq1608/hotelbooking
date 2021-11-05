import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ListRoomController extends GetxController {
  Rx<String> textToSearch;
  var isSortByPrice = false.obs;
  var isSortByKindOfRoom = false.obs;
  var isSortByNumber = false.obs;
  var linkImageRoom =
      'https://i.pinimg.com/564x/5d/41/96/5d41966cb07811e82dc8803b945dee23.jpg'
          .obs;

  void onClicktoSort() {
    if (isSortByPrice.value) {
      isSortByKindOfRoom.value = false;
      isSortByNumber.value = false;
    } else if (isSortByKindOfRoom.value) {
      isSortByPrice.value = false;
      isSortByNumber.value = false;
    } else if (isSortByNumber.value) {
      isSortByPrice.value = false;
      isSortByKindOfRoom.value = false;
    }
  }

  IconData changeIconWhileClick(bool check) {
    return check
        ? Icons.radio_button_checked_outlined
        : Icons.radio_button_off_rounded;
  }
}
