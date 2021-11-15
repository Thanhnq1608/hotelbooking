import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotelbooking/app/views/list_room_empty/bindings/list_room_bindings.dart';
import 'package:hotelbooking/app/views/list_room_empty/views/list_room_empty.dart';
import 'app/views/profile/bindings/profile_bindings.dart';
import 'app/views/profile/views/manage_profile_view.dart';
import 'app/views/profile/views/profile_views.dart';
import 'app/views/room/bindings/room_booking_binding.dart';
import 'app/views/room/views/room_booking.dart';
import 'app/views/room_detail/bindings/room_detail_binding.dart';
import 'app/views/room_detail/views/room_detail_view.dart';
import 'components/bottom_navigation/bottom_navigation_binding.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(GetMaterialApp(
    theme: ThemeData(
        backgroundColor: Color(0xFFF8F0F0), primaryColor: Color(0xFFFF6666)),
    debugShowCheckedModeBanner: false,
    initialRoute: '/list_room',
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
      GetPage(
          name: '/list_room',
          page: () => ListRoomView(),
          bindings: [ListRoomBindings(), BottomNavigationBindings()]),
    ],
  ));
}
