import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomDatePicker extends StatefulWidget {
  const BottomDatePicker({
    Key key,
    this.initialDate,
    this.height = 320,
  }) : super(key: key);

  final DateTime initialDate;
  final double height;

  @override
  _BottomDatePickerState createState() => _BottomDatePickerState();
}

class _BottomDatePickerState extends State<BottomDatePicker> {
  DateTime currentDate;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height,
      color: Colors.white,
      child: DefaultTabController(
        length: 2,
        child: Column(
          children: [
            AppBar(
              elevation: 0,
              backgroundColor: Colors.white,
              leading: IconButton(
                icon: Icon(
                  Icons.close_rounded,
                  color: Colors.black,
                ),
                onPressed: () {
                  if (currentDate != null) {
                    Get.back();
                  }
                },
              ),
              actions: [
                InkWell(
                  child: Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      "Xong",
                      style: TextStyle(color: Colors.blue),
                    ),
                  ),
                  onTap: () {
                    Get.back(result: currentDate);
                  },
                )
              ],
              title: Text('Booking date'),
            ),
            Expanded(
              child: CupertinoDatePicker(
                initialDateTime: widget.initialDate ?? DateTime.now(),
                mode: CupertinoDatePickerMode.dateAndTime,
                use24hFormat: true,
                onDateTimeChanged: (newDate) => currentDate = newDate,
              ),
            )
          ],
        ),
      ),
    );
  }
}
