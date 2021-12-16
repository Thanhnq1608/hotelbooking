import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotelbooking/app/history/history.detail/history.detail.dart';
import 'package:hotelbooking/app/history/history_items.dart';
import 'package:hotelbooking/app/history/history_service.dart';
import 'history.model.dart';

class History extends StatelessWidget {
  final String phone;
  History({this.phone});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Lịch Sử')),
      body: FutureBuilder<List<HistoryModel>>(
          future: getHistoryRoom(phone),
          builder: (context, snapshot) {
            return snapshot.hasData
                ? ListView.builder(
                    itemCount: snapshot.data.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          Get.to(() => HistoryDetail(
                              historyModel: snapshot.data[index]));
                        },
                        child: Container(
                          margin:
                              EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                          child:
                              HistoryItems(historyModel: snapshot.data[index]),
                        ),
                      );
                    })
                : Center(child: Image.asset('assets/images/loading.gif'));
          }),
    );
  }
}
