import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:hotelbooking/app/room/views/bottom.room.dart';
import 'package:hotelbooking/app/room/views/images.room.dart';
import 'package:hotelbooking/app/room/views/main.room.dart';

class Room extends StatefulWidget {
  @override
  _RoomState createState() => _RoomState();
}

class _RoomState extends State<Room> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () => Get.back(),
        ),
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
      bottomNavigationBar: BottomRoom(),
    );
  }
}
