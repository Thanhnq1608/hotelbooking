import 'package:flutter/material.dart';

class BottomRoom extends StatelessWidget {
  const BottomRoom({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Container(
      height: 142,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              blurRadius: 7,
            )
          ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            margin: EdgeInsets.only(top: 16),
            child: Text(
              '400.000 đ',
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
                  height: 1.2),
              textAlign: TextAlign.center,
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 25, top: 20, right: 25, bottom: 32),
            decoration: BoxDecoration(
              color: Colors.pinkAccent,
              borderRadius: BorderRadius.circular(20),
            ),
            child: TextButton(
                onPressed: () {},
                child: Text(
                  'Book Now',
                  style: TextStyle(color: Colors.white),
                )),
          )
        ],
      ),
    );
  }
}
