import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotelbooking/routes/app_pages.dart';

void main() {
  runApp(GetMaterialApp(
    theme: ThemeData(
        backgroundColor: Color(0xFFF8F0F0), primaryColor: Color(0xFFFF6666)),
    debugShowCheckedModeBanner: false,
    initialRoute: AppPage.initial,
    getPages: AppPage.pages,
  ));
}
