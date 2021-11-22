import 'package:flutter/material.dart';

class HistoryItems extends StatelessWidget {
  const HistoryItems({Key key}) : super(key: key);

  Widget _buildInfor() {
    return Container(
      margin: EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            child: Text(
              'PH11445',
              style: TextStyle(fontSize: 26),
            ),
          ),
          Container(
            child: Icon(Icons.info_outline),
          ),
        ],
      ),
    );
  }

  Widget _buildTimeBooking() {
    return Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Icon(Icons.alarm),
          Container(
              child: Text('18:00 20/09/2021', style: TextStyle(fontSize: 13))),
          Icon(Icons.arrow_forward),
          Container(
              child: Text('18:00 20/09/2021', style: TextStyle(fontSize: 13))),
        ],
      ),
    );
  }

  Widget _buildPrice() {
    return Container(
      margin: EdgeInsets.all(16),
      child: Text('600.0000 đ',
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.w700,
          )),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [_buildInfor(), _buildTimeBooking(), _buildPrice()],
      ),
    );
  }
}
