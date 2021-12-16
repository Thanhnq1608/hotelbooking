import 'package:flutter/material.dart';
import 'package:hotelbooking/app/history/history.detail/history.detail.items.dart';
import 'package:hotelbooking/app/history/history.detail/history.infor.dart';

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
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              child: HistoryDetailItems()),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: HistoryInfor(
              historyModel: historyModel,
            ),
          ),
        ],
      ),
    );
  }
}
