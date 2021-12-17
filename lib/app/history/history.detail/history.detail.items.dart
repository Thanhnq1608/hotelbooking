import 'package:flutter/material.dart';
import 'package:hotelbooking/app/views/room_detail/service/room.detail.model.dart';
import 'package:hotelbooking/app/views/room_detail/service/room.service.dart';
import 'package:hotelbooking/tools/format.dart';

class HistoryDetailItems extends StatelessWidget {
  final idRoom;
  HistoryDetailItems({this.idRoom});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<RoomDetailModel>(
        future: getRoomDetail(idRoom),
        builder: (context, snapshot) {
          return snapshot.hasData
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.only(
                              left: 16, bottom: 10, top: 20, right: 8),
                          child: Text(
                            snapshot.data.roomName,
                            style: TextStyle(
                              fontSize: 22,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                            maxLines: 3,
                            overflow: TextOverflow.visible,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Container(
                                  margin: EdgeInsets.only(left: 25),
                                  child: Text(
                                    'Loại Phòng:',
                                    style: TextStyle(
                                      color: Colors.black87,
                                      fontSize: 20,
                                    ),
                                  ),
                                ),
                                Container(
                                  width: 10,
                                ),
                                Text(
                                  'Vip1',
                                  style: TextStyle(
                                    color: Colors.black87,
                                    fontSize: 20,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                    Container(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Container(
                              margin: EdgeInsets.only(left: 24),
                              child: Text(
                                '${MoneyUtility.formatCurrency(snapshot.data.roomPrice)}',
                                style: TextStyle(
                                    color: Color(0xFFFF6666),
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            Container(
                              child: Text(
                                '/Đêm',
                                style: TextStyle(
                                  color: Colors.black87,
                                  fontSize: 25,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 8)
                  ],
                )
              : Container();
        });
  }
}
