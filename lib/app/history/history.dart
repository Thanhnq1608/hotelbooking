import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotelbooking/app.dart';
import 'package:hotelbooking/app/history/history.detail/history.detail.dart';
import 'package:hotelbooking/app/history/history_items.dart';
import 'package:hotelbooking/app/history/history_service.dart';
import 'history.model.dart';

class History extends StatefulWidget {
  final String phone;
  final String from;
  History({this.phone, this.from});

  @override
  _HistoryState createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  @override
    void didChangeDependencies() {
      super.didChangeDependencies();
      History();
    }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              widget.from == 'toProfile'
                  ? Get.back()
                  : Get.offAll(() => App(selectedIndex: 0));
            },
          ),
          title: Text('Lịch Sử')),
      body: RefreshIndicator(
        onRefresh: () {
          return Future.delayed(Duration(seconds: 1), () {
            setState(() {
              History();
            });
          });
        },
        child: FutureBuilder<List<HistoryModel>>(
            future: getHistoryRoom(widget.phone),
            builder: (context, snapshot) {
              return snapshot.hasData
                  ? ListView.builder(
                      itemCount: snapshot.data.length,
                      itemBuilder: (context, index) {
                        final List<HistoryModel> listHistory =
                            snapshot.data.reversed.toList();
                        return GestureDetector(
                          onTap: () {
                            Get.to(() => HistoryDetail(
                                historyModel: listHistory[index]));
                          },
                          child: Container(
                            margin: EdgeInsets.symmetric(
                                horizontal: 16, vertical: 8),
                            child:
                                HistoryItems(historyModel: listHistory[index]),
                          ),
                        );
                      })
                  : Center(child: Image.asset('assets/images/loading.gif'));
            }),
      ),
    );
  }
}
