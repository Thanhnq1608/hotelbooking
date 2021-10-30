import 'package:flutter/cupertino.dart';

class RoomOverview extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(left: 24, top: 5),
            child: Text(
              'Overview',
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
          Container(
            margin: EdgeInsets.only(left: 24, top: 10),
            child: Text(''),
          )
        ],
      ),
    );
  }
}
