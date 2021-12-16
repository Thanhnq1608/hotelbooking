import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotelbooking/app/views/room/views/room_booking.dart';
import 'package:hotelbooking/app/views/room_detail/service/room.detail.model.dart';
import 'package:hotelbooking/app/views/room_detail/service/room.service.dart';
import 'package:hotelbooking/app/views/room_detail/views/room_overview_view.dart';
import 'package:hotelbooking/tools/format.dart';
import 'package:url_launcher/url_launcher.dart';
import '../controller/room_detail_controller.dart';
import 'room_amenties_view.dart';

class RoomDetailView extends GetView<RoomDetailController> {
  final String idRoom;
  final String nameRoom;
  final List<String> imageList;
  RoomDetailView({
    this.idRoom,
    this.nameRoom,
    this.imageList,
  });
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
            onPressed: () => Get.back(),
          ),
          title: Text("${nameRoom}"),
        ),
        body: Stack(children: [
          Container(
            margin: EdgeInsets.only(top: 32),
            child: Align(
              alignment: Alignment.topCenter,
              child: CarouselSlider(
                options: CarouselOptions(
                  enlargeCenterPage: true,
                  enableInfiniteScroll: true,
                  autoPlay: true,
                ),
                items: imageList
                    .map((e) => ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Container(
                            child: Image.network(
                              e,
                              width: double.infinity,
                              height: 300,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ))
                    .toList(),
              ),
            ),
          ),
          Positioned.fill(
            top: 300,
            child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                      color: Colors.black,
                      width: 1.0,
                      style: BorderStyle.solid),
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30)),
                ),
                child: Column(
                  children: [
                    Expanded(
                      child: Container(
                        child: DraggableScrollableSheet(
                            initialChildSize: 1,
                            minChildSize: 1,
                            maxChildSize: 1,
                            expand: true,
                            builder: (BuildContext context,
                                ScrollController scrollController) {
                              return SingleChildScrollView(
                                controller: scrollController,
                                child: FutureBuilder<RoomDetailModel>(
                                    future: getRoomDetail(idRoom),
                                    builder: (context, snapshot) {
                                      if (snapshot.hasError)
                                        print(snapshot.error);
                                      return snapshot.hasData
                                          ? Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                  RoomTitle(
                                                    roomName:
                                                        snapshot.data.roomName,
                                                    priceRoom:
                                                        snapshot.data.roomPrice,
                                                  ),
                                                  RoomAmentiesView(),
                                                  RoomOverview(),
                                                ])
                                          : Center(
                                              child: Image.asset(
                                                  'assets/images/loading.gif'));
                                    }),
                              );
                            }),
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      height: MediaQuery.of(context).size.height * 0.1,
                      child: Center(
                        child: Container(
                            // margin: EdgeInsets.only(top: 5),
                            width: MediaQuery.of(context).size.width * 0.8,
                            height: MediaQuery.of(context).size.height * 0.05,
                            decoration: BoxDecoration(
                                color: Color(0xFFFF6666),
                                borderRadius: BorderRadius.circular(30),
                                boxShadow: [
                                  BoxShadow(
                                      blurRadius: 2.0,
                                      spreadRadius: 2.0,
                                      offset: Offset(0, 2),
                                      color: Color(0xFFC8CBCC))
                                ]),
                            child: FutureBuilder<RoomDetailModel>(
                                future: getRoomDetail(idRoom),
                                builder: (context, snapshot) {
                                  return snapshot.hasData
                                      ? InkWell(
                                          highlightColor: Color(0xFFFF6666),
                                          child: Center(
                                            child: Text(
                                              'Đặt Phòng Ngay',
                                              style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.w700,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                          onTap: () {
                                            Get.to(Room(
                                              imageList: imageList,
                                              idRoom: snapshot.data.id,
                                              priceRoom:
                                                  snapshot.data.roomPrice,
                                            ));
                                          },
                                        )
                                      : Container();
                                })),
                      ),
                    )
                  ],
                )),
          ),
        ]));
  }
}

class RoomTitle extends StatelessWidget {
  final String roomName;
  final int priceRoom;

  const RoomTitle({Key key, this.roomName, this.priceRoom}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin:
                      EdgeInsets.only(left: 16, bottom: 10, top: 20, right: 8),
                  child: Text(
                    '$roomName',
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
                    )
                  ],
                )
              ],
            ),
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
                    '${MoneyUtility.formatCurrency(priceRoom)}',
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
            FutureBuilder<DocumentSnapshot>(
                future: FirebaseFirestore.instance
                    .collection('configs')
                    .doc('contacts')
                    .get(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    Map<String, dynamic> data =
                        snapshot.data.data() as Map<String, dynamic>;
                    return Row(
                      children: [
                        data['hotLine'] == null || data['hotLine'] == ''
                            ? Container()
                            : Container(
                                margin: EdgeInsets.only(right: 20),
                                width: 50,
                                height: 50,
                                child: RawMaterialButton(
                                    shape: CircleBorder(),
                                    elevation: 5.0,
                                    fillColor: Color(0xFFFF6666),
                                    child: Icon(
                                      Icons.phone,
                                      color: Colors.white,
                                    ),
                                    onPressed: () async {
                                      String link = "tel:${data['hotLine']}";
                                      if (link != null &&
                                          await canLaunch(
                                              link.replaceAll(' ', ''))) {
                                        launch('$link');
                                      }
                                    }),
                              ),
                        data['linkMessenger'] == null ||
                                data['linkMessenger'] == ''
                            ? Container()
                            : Container(
                                margin: EdgeInsets.only(right: 20),
                                width: 50,
                                height: 50,
                                child: RawMaterialButton(
                                    shape: CircleBorder(),
                                    elevation: 5.0,
                                    fillColor: Color(0xFFFF6666),
                                    child: Image.asset(
                                        'assets/images/messenger.png'),
                                    onPressed: () async {
                                      String link = "${data['linkMessenger']}";
                                      if (link != null &&
                                          await canLaunch(
                                              link.replaceAll(' ', ''))) {
                                        launch('$link');
                                      }
                                    }),
                              ),
                      ],
                    );
                  }
                  return Container();
                })
          ],
        ),
      ],
    );
  }
}
