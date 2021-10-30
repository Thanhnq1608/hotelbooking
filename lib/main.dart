import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotelbooking/app/room/components/binding/room_booking_binding.dart';
import 'package:hotelbooking/app/room/views/room.dart';
import 'package:hotelbooking/app/room_detail/components/binding/room_detail_binding.dart';
import 'package:hotelbooking/app/room_detail/views/room_detail_view.dart';

void main() {
  runApp(GetMaterialApp(
    theme: ThemeData(primarySwatch: Colors.red),
    debugShowCheckedModeBanner: false,
    initialRoute: '/room_detail',
    getPages: [
      GetPage(
          name: '/room_detail',
          page: () => RoomDetailView(),
          binding: RoomDetailBinding()),
      GetPage(
          name: '/room_detail/room_booking',
          page: () => Room(),
          binding: RoomBookingBinding())
    ],
  ));
}
