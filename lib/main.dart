import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotelbooking/login_register/login/login_user.dart';
import 'package:hotelbooking/routes/app_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(GetMaterialApp(
    theme: ThemeData(
      backgroundColor: Color(0xFFF8F0F0),
      primaryColor: Color(0xFFFF6666),
    ),
    debugShowCheckedModeBanner: false,
    initialRoute: AppPage.initial,
    getPages: AppPage.pages,
    home: LoginUser(),
  ));
}
