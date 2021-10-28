import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:hotelbooking/app/room/components/bottom.room.dart';
import 'package:hotelbooking/app/room/components/images.room.dart';
import 'package:hotelbooking/app/room/components/main.room.dart';

class Room extends StatefulWidget {
  @override
  _RoomState createState() => _RoomState();
}

class _RoomState extends State<Room> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          'Select Dates',
          style: TextStyle(color: Colors.black),
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
