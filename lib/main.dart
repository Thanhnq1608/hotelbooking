import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'app/views/profile/profile_bindings.dart';
import 'app/views/profile/views/manage_profile_view.dart';
import 'app/views/profile/views/profile_views.dart';
import 'app/views/room/room_booking_binding.dart';
import 'app/views/room/views/room_booking.dart';
import 'app/views/room_detail/room_detail_binding.dart';
import 'app/views/room_detail/views/room_detail_view.dart';
import 'components/bottom_navigation/bottom_navigation_binding.dart';

void main() {
  runApp(GetMaterialApp(
    theme: ThemeData(
        backgroundColor: Color(0xFFF8F0F0), primaryColor: Color(0xFFFF6666)),
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
          binding: RoomBookingBinding()),
      GetPage(
          name: '/profile',
          page: () => ProfileView(),
          bindings: [ProfileBindings(), BottomNavigationBindings()]),
      GetPage(
          name: '/profile/manage_profile',
          page: () => ManageProfileView(),
          binding: ProfileBindings()),
    ],
  ));
}
