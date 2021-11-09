import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotelbooking/app/views/profile/views/change_language.dart';
import 'package:hotelbooking/components/bottom_navigation/views/bottom_navigation_view.dart';

import '../controller/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  Widget _topProfile(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.3,
      margin: EdgeInsets.only(bottom: 10),
      child: Center(
        child: Stack(
          children: [
            ClipRRect(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20)),
                child: Image.asset(
                  'assets/images/bg_top_profile.jpg',
                  width: double.infinity,
                  fit: BoxFit.fill,
                )),
            Positioned(
                top: MediaQuery.of(context).size.height * 0.05,
                left: MediaQuery.of(context).size.width * 0.25,
                child: Container(
                    child: Obx(
                  () => Column(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width * 0.25,
                        height: MediaQuery.of(context).size.width * 0.25,
                        margin: EdgeInsets.only(bottom: 5),
                        decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black45,
                                  blurRadius: 10,
                                  offset: Offset(0, 2),
                                  spreadRadius: 1)
                            ],
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                image: controller.networkImage.value,
                                fit: BoxFit.fill)),
                      ),
                      Text(
                        controller.username.value,
                        style: TextStyle(color: Colors.black54, fontSize: 15),
                      ),
                      Container(
                        height: 5,
                      ),
                      Text(
                        controller.fullname.value,
                        style: TextStyle(color: Colors.black, fontSize: 20),
                      ),
                    ],
                  ),
                )))
          ],
        ),
      ),
    );
  }

  Widget _bodyProfileScreen(BuildContext context) {
    return Column(
      children: [
        Container(
          width: MediaQuery.of(context).size.width * 0.95,
          height: MediaQuery.of(context).size.height * 0.25,
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(20))),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(left: 20),
                child: Text('Settings',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 25,
                        fontWeight: FontWeight.bold)),
              ),
              Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.05,
                margin: EdgeInsets.only(top: 10),
                child: InkWell(
                  onTap: () => Get.toNamed('/profile/manage_profile'),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.height * 0.025,
                        height: MediaQuery.of(context).size.height * 0.025,
                        child: Icon(
                          Icons.person_outline,
                          color: Color(0xFF161722),
                        ),
                      ),
                      Container(
                        width: 20,
                      ),
                      Expanded(
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Manage my account',
                            style: TextStyle(
                                color: Color(0xFF161722), fontSize: 19),
                          ),
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.height * 0.025,
                        height: MediaQuery.of(context).size.height * 0.025,
                        child: Icon(
                          Icons.keyboard_arrow_right_rounded,
                          color: Color(0xFF161722),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.05,
                margin: EdgeInsets.only(top: 10),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.height * 0.025,
                      height: MediaQuery.of(context).size.height * 0.025,
                      child: Icon(
                        Icons.lock_open,
                        color: Color(0xFF161722),
                      ),
                    ),
                    Container(
                      width: 20,
                    ),
                    Expanded(
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Change password',
                          style:
                              TextStyle(color: Color(0xFF161722), fontSize: 19),
                        ),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.height * 0.025,
                      height: MediaQuery.of(context).size.height * 0.025,
                      child: Icon(
                        Icons.keyboard_arrow_right_rounded,
                        color: Color(0xFF161722),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.05,
                margin: EdgeInsets.only(top: 10),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.height * 0.025,
                      height: MediaQuery.of(context).size.height * 0.025,
                      child: Icon(
                        Icons.history,
                        color: Color(0xFF161722),
                      ),
                    ),
                    Container(
                      width: 20,
                    ),
                    Expanded(
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'History',
                          style:
                              TextStyle(color: Color(0xFF161722), fontSize: 19),
                        ),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.height * 0.025,
                      height: MediaQuery.of(context).size.height * 0.025,
                      child: Icon(
                        Icons.keyboard_arrow_right_rounded,
                        color: Color(0xFF161722),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width * 0.95,
          height: MediaQuery.of(context).size.height * 0.19,
          margin: EdgeInsets.only(top: 10),
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(20))),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(left: 20),
                child: Text('Others',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 25,
                        fontWeight: FontWeight.bold)),
              ),
              Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.05,
                margin: EdgeInsets.only(top: 10),
                child: InkWell(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.height * 0.025,
                        height: MediaQuery.of(context).size.height * 0.025,
                        child: Icon(
                          Icons.language,
                          color: Color(0xFF161722),
                        ),
                      ),
                      Container(
                        width: 20,
                      ),
                      Expanded(
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Language',
                            style: TextStyle(
                                color: Color(0xFF161722), fontSize: 19),
                          ),
                        ),
                      ),
                      Obx(
                        () => Text(
                          controller.changeLanguage().value,
                          style:
                              TextStyle(color: Color(0xFF161722), fontSize: 19),
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.height * 0.025,
                        height: MediaQuery.of(context).size.height * 0.025,
                        child: Icon(
                          Icons.keyboard_arrow_right_rounded,
                          color: Color(0xFF161722),
                        ),
                      ),
                    ],
                  ),
                  onTap: () => Get.bottomSheet(ChangeLangage()),
                ),
              ),
              Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.05,
                margin: EdgeInsets.only(top: 10),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.height * 0.025,
                      height: MediaQuery.of(context).size.height * 0.025,
                      child: Icon(
                        Icons.logout,
                        color: Color(0xFF161722),
                      ),
                    ),
                    Container(
                      width: 20,
                    ),
                    Expanded(
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Logout',
                          style:
                              TextStyle(color: Color(0xFF161722), fontSize: 19),
                        ),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.height * 0.025,
                      height: MediaQuery.of(context).size.height * 0.025,
                      child: Icon(
                        Icons.keyboard_arrow_right_rounded,
                        color: Color(0xFF161722),
                      ),
                    ),
                  ],
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
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () => Get.back(),
        ),
        title: const Text(
          'Profile',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Column(
        children: [
          Align(alignment: Alignment.topCenter, child: _topProfile(context)),
          Expanded(
              child: DraggableScrollableSheet(
                  initialChildSize: 1,
                  minChildSize: 1,
                  maxChildSize: 1,
                  expand: true,
                  builder: (context, ScrollController scrollController) {
                    return SingleChildScrollView(
                      controller: scrollController,
                      child: _bodyProfileScreen(context),
                    );
                  })),
          Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.13,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20))),
              child: BottomNavigationView())
        ],
      ),
    );
  }
}
