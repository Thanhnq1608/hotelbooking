import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:hotelbooking/app/list_room_empty/list_room_empty.dart';
import 'package:hotelbooking/app/profile/profile_views.dart';
import 'package:hotelbooking/login_register/auth_api_service.dart';
import 'app/views/room/views/room_booking.dart';

class App extends StatefulWidget {
  var selectedIndex = 0;
  App({this.selectedIndex});

  @override
  _MyApp createState() => _MyApp();
}

class _MyApp extends State<App> {
  String tokenId;
  @override
  void initState() {
    super.initState();
    AuthApiService().getInforUser().then((value) async {
      if (value.data.customer.tokenID.isEmpty ||
          value.data.customer.tokenID != tokenId) {
        var payload = {'tokenId': tokenId};
        print('different TokenID');
        await AuthApiService().UpdateTokenIdUser(payload);
      }
    });
    // notification
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      RemoteNotification notification = message.notification;
      AndroidNotification android = message.notification?.android;
      if (notification != null && android != null) {
        flutterLocalNotificationsPlugin.show(
            notification.hashCode,
            notification.title,
            notification.body,
            NotificationDetails(
              android: AndroidNotificationDetails(
                channel.id,
                channel.name,
                channel.description,
                color: Colors.blue,
                playSound: true,
                icon: '@mipmap/ic_launcher',
              ),
            ));
      }
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      RemoteNotification notification = message.notification;
      AndroidNotification android = message.notification?.android;
      if (notification != null && android != null) {
        showDialog(
            context: context,
            builder: (_) {
              return AlertDialog(
                title: Text(notification.title),
                content: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [Text(notification.body)],
                  ),
                ),
              );
            });
      }
    });
    // Get TokenId from Firebase
    FirebaseMessaging.instance.getToken().then((String token) {
      assert(token != null);
      tokenId = token;
    });
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
// Notification
const AndroidNotificationChannel channel = AndroidNotificationChannel(
    'high_importance_channel', // id
    'High Importance Notifications', // title
    'This channel is used for important notifications.', // description
    importance: Importance.high,
    playSound: true);

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
}
