import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../bottom_navigation_controller.dart';

class BottomNavigationView extends GetView<BottomNavigationController> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Stack(
      children: [
        Positioned(
            top: MediaQuery.of(context).size.height * 0.03,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.1,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20))),
              child: Row(
                children: [
                  Expanded(
                      flex: 1,
                      child: Align(
                        alignment: Alignment.center,
                        child: Container(
                          width: MediaQuery.of(context).size.height * 0.075,
                          height: MediaQuery.of(context).size.height * 0.075,
                          child: Obx(
                            () => IconButton(
                              icon: Icon(
                                Icons.library_books_rounded,
                                color: controller.iconColorBook(),
                              ),
                              iconSize: 40,
                              onPressed: () {
                                controller.onClickBook();
                              },
                            ),
                          ),
                        ),
                      )),
                  Expanded(
                      flex: 1,
                      child: Align(
                        alignment: Alignment.center,
                        child: Container(
                          width: MediaQuery.of(context).size.height * 0.075,
                          height: MediaQuery.of(context).size.height * 0.075,
                          child: Obx(
                            () => IconButton(
                              icon: Icon(Icons.person,
                                  color: controller.iconColorProfile()),
                              iconSize: 40,
                              onPressed: () {
                                controller.onClickProfile();
                              },
                            ),
                          ),
                        ),
                      ))
                ],
              ),
            )),
        Positioned(
          // top: MediaQuery.of(context).size.height * 0.05,
          left: MediaQuery.of(context).size.width * 0.4,
          child: Container(
            width: MediaQuery.of(context).size.height * 0.09,
            height: MediaQuery.of(context).size.height * 0.09,
            decoration: BoxDecoration(
                color: Color(0xFFFF6666),
                borderRadius: BorderRadius.all(Radius.circular(20)),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black45, blurRadius: 10, spreadRadius: 1)
                ]),
            child: Center(
              child: IconButton(
                icon: Icon(
                  Icons.add_sharp,
                  color: Colors.white,
                ),
                iconSize: 50,
                alignment: Alignment.center,
                onPressed: () {},
              ),
            ),
          ),
        )
      ],
    );
  }
}
