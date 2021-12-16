import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:hotelbooking/tools/notify.model.dart';
import 'package:hotelbooking/tools/notify.service.dart';
import 'bottom_room_booking.dart';
import 'bottom_room_empty.dart';
import 'images_room_booking.dart';
import 'main_room_booking.dart';

class Room extends StatefulWidget {
  final List<String> imageList;
  final String idRoom;
  final int priceRoom;
  Room({Key key, this.idRoom, this.priceRoom,this.imageList});
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
            ImagesRoom(imageList: widget.imageList,),
            MainRoom(),
          ],
        ),
      ),
      bottomNavigationBar: (widget.idRoom != null && widget.priceRoom != null)
          ? FutureBuilder<NotifyModel>(
              future: getEmployee(),
              builder: (context, snapshot) {
                return snapshot.hasData
                    ? BottomRoom(
                      listTokenID: snapshot.data.data,
                        idRoom: widget.idRoom,
                        priceRoom: widget.priceRoom,
                      )
                    : BottomRoom(
                        idRoom: widget.idRoom,
                        priceRoom: widget.priceRoom,
                      );
              })
          : BottomRoomEmpty(),
    );
  }
}
