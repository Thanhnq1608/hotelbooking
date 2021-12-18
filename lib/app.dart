import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotelbooking/app/list_room_empty/list_room_empty.dart';
import 'package:hotelbooking/app/profile/profile_views.dart';

import 'app/views/room/views/room_booking.dart';

class App extends StatefulWidget {
  var selectedIndex=0;
  App({this.selectedIndex});

  @override
  _MyApp createState() => _MyApp();
}

class _MyApp extends State<App> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> _widgetOptions = <Widget>[
      ListRoomView(),
      ProfileView(),
    ];
    void _onItemTapped(int index) {
      setState(() {
        widget.selectedIndex = index;
      });
    }

    return Scaffold(
        body: Center(
          child: _widgetOptions.elementAt(widget.selectedIndex),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Trang chủ',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Thông tin',
            ),
          ],
          currentIndex: widget.selectedIndex,
          selectedItemColor: Color(0xFFFF6666),
          onTap: _onItemTapped,
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Get.to(() => Room());
          },
          backgroundColor: Color(0xFFFF6666),
          child: Container(
            child: Icon(Icons.add),
          ),
        ));
  }
}
