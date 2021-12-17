
import 'package:flutter/material.dart';
import 'package:hotelbooking/app/history/history.detail/history.detail.items.dart';
import 'package:hotelbooking/app/history/history.detail/history.infor.dart';
import 'package:hotelbooking/app/history/history_service.dart';

import '../history.model.dart';

class HistoryDetail extends StatelessWidget {
  final priceRoom;
  final HistoryModel historyModel;
  final roomName;
  HistoryDetail({
    this.priceRoom,
    this.roomName,
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
          FutureBuilder<List<HistoryRoom>>(
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
                                      offset: Offset(
                                          0, 3), // changes position of shadow
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
              }),
        ],
      ),
    );
  }
}
