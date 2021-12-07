import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'bottom_room_booking.dart';
import 'bottom_room_empty.dart';
import 'images_room_booking.dart';
import 'main_room_booking.dart';

class Room extends StatefulWidget {
  final String idRoom;
  final int priceRoom;
  Room({Key key, this.idRoom, this.priceRoom});
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
          'Chọn ngày đặt phòng',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ImagesRoom(),
            MainRoom(),
          ],
        ),
      ),
      bottomNavigationBar: (widget.idRoom != null && widget.priceRoom != null)
          ? BottomRoom(
              idRoom: widget.idRoom,
              priceRoom: widget.priceRoom,
            )
          : BottomRoomEmpty(),
    );
  }
}
