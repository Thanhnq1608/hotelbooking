import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RoomBookingController extends GetxController {
  Rx<bool> isActiveHour = false.obs;
  Rx<bool> isActiveOvernight = false.obs;
  Rx<bool> isActiveDaily = false.obs;
  Rx<int> quantilyRoom = 1.obs;
  Rx<DateTime> dateStart = DateTime.now().obs;
  Rx<DateTime> dateEnd = DateTime.now().obs;
  Rx<TimeOfDay> timeStart = TimeOfDay.now().obs;
  Rx<TimeOfDay> timeEnd = TimeOfDay.now().obs;

  Future<Null> selectDateStartPicker(BuildContext context) async {
    final DateTime pickedStart = await showDatePicker(
      context: context,
      initialDate: dateStart.value,
      firstDate: DateTime(2021),
      lastDate: DateTime(2050),
    );
    if (pickedStart != null && pickedStart != dateStart.value) {
      dateStart.value = pickedStart;
    }
  }

  Future<Null> selectDateEndPicker(BuildContext context) async {
    final DateTime pickedEnd = await showDatePicker(
      context: context,
      initialDate: dateStart.value,
      firstDate: DateTime(2021),
      lastDate: DateTime(2050),
    );
    if (pickedEnd != null && pickedEnd != dateStart.value) {
      dateEnd.value = pickedEnd;
    }
  }

  Future<TimeOfDay> selectTimeStartPicker(BuildContext context) async {
    final TimeOfDay pickeStart = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (pickeStart != null && pickeStart != dateStart.value) {
      timeStart.value = pickeStart;
    }
  }

  Future<TimeOfDay> selectTimeEndPicker(BuildContext context) async {
    final TimeOfDay pickeEnd = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (pickeEnd != null && pickeEnd != dateStart.value) {
      timeEnd.value = pickeEnd;
    }
  }
}
