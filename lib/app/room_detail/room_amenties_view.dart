import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RoomAmentiesView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(0),
      width: double.infinity,
      height: MediaQuery.of(context).size.width * 0.3,
      margin: EdgeInsets.only(
        top: 20,
      ),
      decoration: BoxDecoration(
          border: Border.symmetric(
              horizontal: BorderSide(color: Color(0xFF000000)))),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(left: 24, top: 5),
              child: Text(
                'Amenties',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              color: Color(0xFF000000),
              margin: EdgeInsets.only(left: 24),
              width: 80,
              height: 2,
            ),
            Container(
              color: Color(0xFF000000),
              margin: EdgeInsets.only(left: 24, top: 5, bottom: 10),
              width: 40,
              height: 2,
            ),
            Row(
              children: [
                Container(
                  margin: EdgeInsets.only(left: 24),
                  child: Row(
                    children: [
                      Icon(
                        Icons.wifi,
                        color: Colors.black87,
                      ),
                      Container(
                        width: 5,
                      ),
                      Text(
                        'Wifi',
                        style: TextStyle(fontSize: 15),
                      )
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 32),
                  child: Row(
                    children: [
                      Icon(
                        Icons.airplay,
                        color: Colors.black87,
                      ),
                      Container(
                        width: 5,
                      ),
                      Text(
                        'Smart TV',
                        style: TextStyle(fontSize: 15),
                      )
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 24),
                  child: Row(
                    children: [
                      Icon(
                        Icons.ac_unit,
                        color: Colors.black87,
                      ),
                      Container(
                        width: 5,
                      ),
                      Text(
                        'Air conditioner',
                        style: TextStyle(fontSize: 15),
                      )
                    ],
                  ),
                )
              ],
            ),
            Row(
              children: [
                Container(
                  margin: EdgeInsets.only(left: 24, top: 5),
                  child: Row(
                    children: [
                      Icon(
                        Icons.dinner_dining,
                        color: Colors.black87,
                      ),
                      Container(
                        width: 5,
                      ),
                      Text(
                        'Dinner',
                        style: TextStyle(fontSize: 15),
                      )
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 15, top: 5),
                  child: Row(
                    children: [
                      Icon(
                        Icons.car_repair,
                        color: Colors.black87,
                      ),
                      Container(
                        width: 5,
                      ),
                      Text(
                        'Parking',
                        style: TextStyle(fontSize: 15),
                      )
                    ],
                  ),
                ),
              ],
            )
          ]),
    );
  }
}
