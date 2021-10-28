import 'package:flutter/material.dart';

class MainRoom extends StatefulWidget {
  @override
  _MainRoomState createState() => _MainRoomState();
}

class _MainRoomState extends State<MainRoom> {
  bool isActiveHour = false;
  bool isActiveOvernight = false;
  bool isActiveDaily = false;
  int quantilyRoom = 1;
  DateTime dateStart = DateTime.now();
  DateTime dateEnd = DateTime.now();
  TimeOfDay timeStart = TimeOfDay.now();
  TimeOfDay timeEnd = TimeOfDay.now();

  Future<Null> _selectDateStartPicker(BuildContext context) async {
    final DateTime pickedStart = await showDatePicker(
      context: context,
      initialDate: dateStart,
      firstDate: DateTime(2021),
      lastDate: DateTime(2050),
    );
    if (pickedStart != null && pickedStart != dateStart) {
      setState(() {
        dateStart = pickedStart;
      });
    }
  }

  Future<Null> _selectDateEndPicker(BuildContext context) async {
    final DateTime pickedEnd = await showDatePicker(
      context: context,
      initialDate: dateStart,
      firstDate: DateTime(2021),
      lastDate: DateTime(2050),
    );
    if (pickedEnd != null && pickedEnd != dateStart) {
      setState(() {
        dateEnd = pickedEnd;
      });
    }
  }

  Future<TimeOfDay> _selectTimeStartPicker(BuildContext context) async {
    final TimeOfDay pickeStart = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (pickeStart != null && pickeStart != dateStart) {
      setState(() {
        timeStart = pickeStart;
      });
    }
  }

  Future<TimeOfDay> _selectTimeEndPicker(BuildContext context) async {
    final TimeOfDay pickeEnd = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (pickeEnd != null && pickeEnd != dateStart) {
      setState(() {
        timeEnd = pickeEnd;
      });
    }
  }

  Widget _bookingOption() {
    return new Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            decoration: BoxDecoration(
              color: isActiveHour ? Colors.pinkAccent : Colors.white,
              border: Border.all(
                color: Colors.black,
                width: 1,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            child: FlatButton(
              onPressed: () {
                setState(() {
                  isActiveHour = true;
                  isActiveDaily = false;
                  isActiveOvernight = false;
                });
              },
              child: Text(
                'Hourly',
                style: TextStyle(color: Colors.black),
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: isActiveDaily ? Colors.pinkAccent : Colors.white,
              border: Border.all(
                color: Colors.black,
                width: 1,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            child: FlatButton(
              onPressed: () {
                setState(() {
                  isActiveHour = false;
                  isActiveDaily = true;
                  isActiveOvernight = false;
                });
              },
              child: Text(
                'Daily',
                style: TextStyle(color: Colors.black),
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: isActiveOvernight ? Colors.pinkAccent : Colors.white,
              border: Border.all(
                color: Colors.black,
                width: 1,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            child: FlatButton(
              onPressed: () {
                setState(() {
                  isActiveHour = false;
                  isActiveDaily = false;
                  isActiveOvernight = true;
                });
              },
              child: Text(
                'Overnight',
                style: TextStyle(color: Colors.black),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _timePicker() {
    return new Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Container(
          width: 132,
          height: 67,
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(
              color: Colors.white,
              width: 1,
            ),
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.grey,
                blurRadius: 7,
                offset: Offset(0, 5), // changes position of shadow
              ),
            ],
          ),
          child: FlatButton(
            onPressed: () {
              isActiveHour == true
                  ? _selectTimeStartPicker(context)
                  : _selectDateStartPicker(context);
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.only(bottom: 8),
                  child: Text('${timeStart.hour}:${timeStart.minute}'),
                ),
                Container(
                  child: Text(
                      '${dateStart.day}/${dateStart.month}/${dateStart.year}'),
                )
              ],
            ),
          ),
        ),
        Container(
          width: 132,
          height: 67,
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(
              color: Colors.white,
              width: 1,
            ),
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.grey,
                blurRadius: 7,
                offset: Offset(0, 5), // changes position of shadow
              ),
            ],
          ),
          child: FlatButton(
            onPressed: () {
              isActiveHour == true
                  ? _selectTimeEndPicker(context)
                  : _selectDateEndPicker(context);
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.only(bottom: 8),
                  child: Text('${timeEnd.hour}:${timeEnd.minute}'),
                ),
                Container(
                  child:
                      Text('${dateEnd.day}/${dateEnd.month}/${dateEnd.year}'),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _quantiltRoom(int quantily) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(bottom: 16),
          child: Text(
            'The number of rooms you want to book',
            style: TextStyle(
                fontWeight: FontWeight.w700, fontSize: 14, height: 1.3),
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 64, right: 64),
          height: 35,
          decoration: BoxDecoration(
              border: Border.all(color: Colors.black, width: 1),
              borderRadius: BorderRadius.circular(10)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                child: IconButton(
                  icon: Icon(
                    Icons.remove,
                  ),
                  onPressed: () {},
                ),
              ),
              Container(
                child: Text('$quantily'),
              ),
              Container(
                child: IconButton(
                  icon: Icon(
                    Icons.add,
                  ),
                  onPressed: () {},
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      margin: EdgeInsets.only(left: 16, right: 16, top: 32),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(color: Colors.grey, offset: Offset(0, 5), blurRadius: 7)
          ]),
      child: Column(
        children: [
          Container(
              margin: EdgeInsets.only(top: 8, left: 8, right: 8),
              child: _bookingOption()),
          Container(
            margin: EdgeInsets.only(top: 24),
            child: _timePicker(),
          ),
          Container(
              margin: EdgeInsets.only(top: 60, bottom: 16, left: 64, right: 64),
              child: _quantiltRoom(quantilyRoom))
        ],
      ),
    );
  }
}
