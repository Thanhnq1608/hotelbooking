import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hotelbooking/views/room_detail/room_overview_view.dart';
// import 'package:get/get.dart';
import 'room_amenties_view.dart';

class RoomDetailView extends StatelessWidget {
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
        body: Column(children: [
          Stack(children: [
            Center(
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
                  child: Image.asset(
                    'assets/icon/icon_heart_border.png',
                    width: 20,
                    height: 20,
                    fit: BoxFit.fill,
                  ),
                  onPressed: null),
            ),
            Center(
                child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.white),
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30)),
                  ),
                  margin: EdgeInsets.only(top: 300),
                  width: double.infinity,
                  height: 300,
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
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                RoomTitle(),
                                RoomAmentiesView(),
                                RoomOverview(),
                              ]),
                        );
                      }),
                ),
                Center(
                  child: Container(
                    margin: EdgeInsets.only(top: 10),
                    width: MediaQuery.of(context).size.width * 0.8,
                    height: MediaQuery.of(context).size.width * 0.1,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        boxShadow: [
                          BoxShadow(
                              blurRadius: 2.0,
                              spreadRadius: 2.0,
                              offset: Offset(0, 2),
                              color: Color(0xFFC8CBCC))
                        ]),
                    child: TextButton(
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Color(0xFFFF6666)),
                      ),
                      child: Center(
                        child: Text(
                          'Book Now',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                      onPressed: null,
                    ),
                  ),
                )
              ],
            )),
          ]),
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
