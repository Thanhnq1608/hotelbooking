import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hotelbooking/app/room/views/room.dart';
import 'package:hotelbooking/app/room_detail/components/comtroller/room_detail_controller.dart';
import 'package:hotelbooking/app/room_detail/views/room_overview_view.dart';
import 'package:get/get.dart';
import 'room_amenties_view.dart';

class RoomDetailView extends GetView<RoomDetailController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
            onPressed: null,
          ),
          title: const Text("RoomDetail"),
        ),
        body: Stack(children: [
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              child: Image.asset(
                'assets/images/room_photo.jpg',
                width: double.infinity,
                height: 380,
                fit: BoxFit.fill,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(
                left: MediaQuery.of(context).size.width * 0.80, top: 20),
            width: 50,
            height: 50,
            child: RawMaterialButton(
                shape: CircleBorder(),
                elevation: 5.0,
                fillColor: Color(0xFFFFFFFF),
                child: Obx(() => Image.asset(
                      controller.colorOfButtonFavorite.value,
                      width: 20,
                      height: 20,
                      fit: BoxFit.fill,
                    )),
                onPressed: () {
                  controller.onClickOnFavoriteButton();
                }),
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
                                child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      RoomTitle(),
                                      RoomAmentiesView(),
                                      RoomOverview(),
                                    ]),
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
                            child: InkWell(
                              highlightColor: Color(0xFFFF6666),
                              child: Center(
                                child: Text(
                                  'Book Now',
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              onTap: () {
                                Get.toNamed('/room_detail/room_booking');
                              },
                            )),
                      ),
                    )
                  ],
                )),
          ),
        ]));
  }
}

class RoomTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 10,
        ),
        Row(
          children: [
            Column(
              children: [
                Container(
                  margin: EdgeInsets.only(left: 24, bottom: 10),
                  child: Text(
                    'Vintage Room',
                    style: TextStyle(
                      fontSize: 25,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Row(
                  children: [
                    Container(
                      child: Text(
                        'Kind of room:',
                        style: TextStyle(
                          color: Colors.black87,
                          fontSize: 15,
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
                        fontSize: 15,
                      ),
                    )
                  ],
                )
              ],
            ),
            Container(
              margin: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * 0.35),
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
                  onPressed: () {}),
            )
          ],
        ),
        Container(
          height: 10,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.only(left: 24),
              child: Text(
                '600.000',
                style: TextStyle(
                    color: Color(0xFFFF6666),
                    fontSize: 25,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 5),
              child: Text(
                'VND',
                style: TextStyle(
                    color: Color(0xFFFF6666),
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              child: Text(
                ' / Per night',
                style: TextStyle(
                  color: Colors.black87,
                  fontSize: 15,
                ),
              ),
            )
          ],
        ),
        Container(
          height: 10,
        ),
        Row(
          children: [
            Container(
              width: 24,
            ),
            Icon(
              Icons.star,
              color: Colors.yellow,
            ),
            Icon(
              Icons.star,
              color: Colors.yellow,
            ),
            Icon(
              Icons.star,
              color: Colors.yellow,
            ),
            Icon(
              Icons.star,
              color: Colors.yellow,
            ),
            Icon(
              Icons.star_half,
              color: Colors.yellow,
            ),
            Container(
              margin: EdgeInsets.only(left: 5),
              child: Text(
                '4,5',
                style: TextStyle(fontSize: 15),
              ),
            )
          ],
        ),
      ],
    );
  }
}
