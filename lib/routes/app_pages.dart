import 'package:get/get.dart';
import 'package:hotelbooking/app/list_room_empty/list_room_bindings.dart';
import 'package:hotelbooking/app/list_room_empty/list_room_empty.dart';
import 'package:hotelbooking/app/profile/profile_bindings.dart';
import 'package:hotelbooking/app/profile/profile_views.dart';
import 'package:hotelbooking/app/manage_profile/manage_profile_view.dart';
import 'package:hotelbooking/app/views/room/bindings/room_booking_binding.dart';
import 'package:hotelbooking/app/views/room/views/room_booking.dart';
import 'package:hotelbooking/app/views/room_detail/bindings/room_detail_binding.dart';
import 'package:hotelbooking/app/views/room_detail/views/room_detail_view.dart';
import 'app_routes.dart';

class AppPage {
  static final initial = "/";

  static final pages = [
    GetPage(
        name: AppRoute.roomDetail,
        page: () => RoomDetailView(),
        binding: RoomDetailBinding()),
    GetPage(
        name: AppRoute.booking,
        page: () => Room(),
        binding: RoomBookingBinding()),
    GetPage(
        name: AppRoute.profile,
        page: () => ProfileView(),
        binding: ProfileBindings()),
    GetPage(
      name: AppRoute.manageProfile,
      page: () => ManageProfileView(),
    ),
    GetPage(
        name: AppRoute.listRoomEmpty,
        page: () => ListRoomView(),
        binding: ListRoomBindings()),
  ];
}
