import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'bottom_room_booking.dart';
import 'images_room_booking.dart';
import 'main_room_booking.dart';

class Room extends StatefulWidget {
  const Room({Key key}) : super(key: key);
  @override
  _RoomState createState() => _RoomState();
}

class _RoomState extends State<Room> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink,
        title: Text(
          'Select Dates',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [ImagesRoom(), MainRoom()],
        ),
      ),
      bottomNavigationBar: BottomRoom(
        priceRoom: Get.arguments,
      ),
    );
  }
}
