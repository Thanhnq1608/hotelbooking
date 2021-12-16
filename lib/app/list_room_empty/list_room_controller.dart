import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotelbooking/app/views/room_detail/service/room.detail.model.dart';

class ListRoomController extends GetxController {
  Rx<String> textToSearch;
  var isSortByPrice = false.obs;
  var isSortByKindOfRoom = false.obs;
  var isSortByNumber = false.obs;
  // RxList<RoomDetailModel> listRoomEmptysFilter= [] as RxList<RoomDetailModel>;
  Rx<NetworkImage> imageRoom = NetworkImage(
          'https://i.pinimg.com/564x/5d/41/96/5d41966cb07811e82dc8803b945dee23.jpg')
      .obs;

  void onClicktoSort(List<RoomDetailModel> listRoomEmptys) {
    if (isSortByPrice.value) {
      listRoomEmptys
          .sort((price1, price2) => price1.roomPrice - price2.roomPrice);
    }
    if (isSortByKindOfRoom.value) {
      print('object11');
    }
    if (isSortByNumber.value) {
      listRoomEmptys.sort((person, person2) =>
          person.maximumNumberOfPeople - person2.maximumNumberOfPeople);
    }
  }

  IconData changeIconWhileClick(bool check) {
    return check
        ? Icons.radio_button_checked_outlined
        : Icons.radio_button_off_rounded;
  }
}
