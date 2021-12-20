import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotelbooking/app/history/history.dart';
import 'package:hotelbooking/app/history/history.detail/history.detail.items.dart';
import 'package:hotelbooking/app/history/history.detail/history.infor.dart';
import 'package:hotelbooking/app/history/history_service.dart';
import 'package:hotelbooking/app/views/room_detail/service/room.detail.model.dart';

import '../history.model.dart';
import 'bottom.history.dart';
import 'history.detail.item2.dart';

class HistoryDetail extends StatelessWidget {
  final HistoryModel historyModel;

  HistoryDetail({
    this.historyModel,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Đơn phòng chi tiết'),
      ),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: HistoryInfor(
              historyModel: historyModel,
            ),
          ),
          historyModel.bookingStatus == 3
              ? FutureBuilder<List<HistoryRoom>>(
                  future: getRoomBooked(id: historyModel.sId),
                  builder: (context, snapshot) {
                    return snapshot.hasData
                        ? Expanded(
                            child: ListView.builder(
                              itemCount: snapshot.data.length,
                              itemBuilder: (context, indext) {
                                return Container(
                                    margin: EdgeInsets.symmetric(
                                        horizontal: 16, vertical: 8),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(20),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey,
                                          spreadRadius: 5,
                                          blurRadius: 7,
                                          offset: Offset(0,
                                              3), // changes position of shadow
                                        ),
                                      ],
                                    ),
                                    child: HistoryDetailItems(
                                      idRoom: snapshot.data[indext].idRoom,
                                    ));
                              },
                            ),
                          )
                        : Container();
                  })
              :
//
              FutureBuilder<List<RoomDetailModel>>(
                  future: getIDRoomBooking(historyModel.sId),
                  builder: (context, snapshot) {
                    return snapshot.hasData
                        ? Expanded(
                            child: ListView.builder(
                              itemCount: snapshot.data.length,
                              itemBuilder: (context, indext) {
                                return Container(
                                    margin: EdgeInsets.symmetric(
                                        horizontal: 16, vertical: 8),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(20),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey,
                                          spreadRadius: 5,
                                          blurRadius: 7,
                                          offset: Offset(0,
                                              3), // changes position of shadow
                                        ),
                                      ],
                                    ),
                                    child: HistoryDetailItems2(
                                      roomDetailModel: snapshot.data[indext],
                                    ));
                              },
                            ),
                          )
                        : Container();
                  }),
        ],
      ),
      bottomNavigationBar: historyModel.bookingStatus == 0
          ? BottomHistory(
              idBooking: historyModel.sId,
            )
          : null,
    );
  }
}
