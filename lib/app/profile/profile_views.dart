import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotelbooking/app/history/history.dart';
import 'package:hotelbooking/login_register/auth_api_service.dart';
import 'package:hotelbooking/login_register/model_auth/status_success.dart';
import 'package:hotelbooking/model/user.dart';
import 'package:hotelbooking/routes/app_routes.dart';
import 'package:hotelbooking/tools/change_language_picker.dart';
import 'profile_controller.dart';

class ProfileView extends StatelessWidget {
  var controller = Get.put(ProfileController());
  final String id;
  final String token;
  ProfileView({this.id, this.token});

  Widget _topProfile(BuildContext context, {StatusSuccessGet snapshot}) {
    return Container(
      height: 225,
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
                child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 225,
                    child: Obx(
                      () => Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width: 100,
                            height: 100,
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
                                    image: NetworkImage(
                                        controller.networkImage.value),
                                    fit: BoxFit.fill)),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 8),
                            child: (snapshot.data == null)
                                ? Text('csc')
                                : Text(
                                    snapshot.data.customer.name,
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 20,
                                        fontWeight: FontWeight.w500),
                                  ),
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(vertical: 8),
                            child: (snapshot.data == null)
                                ? Text('csc')
                                : Text(
                                    snapshot.data.customer.email,
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 15),
                                  ),
                          ),
                        ],
                      ),
                    )))
          ],
        ),
      ),
    );
  }

  Widget _bodyProfileScreen(BuildContext context, {StatusSuccessGet snashot}) {
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
                  onTap: () {
                    var user = User(
                        username: snashot.data.customer.name,
                        email: snashot.data.customer.email,
                        fullname: snashot.data.customer.name,
                        phone: snashot.data.customer.phoneNumber,
                        dateOfBirth: snashot.data.customer.dateOfBirth
                            .replaceAll('T00:00:00.000Z', ''),
                        address: snashot.data.customer.address,
                        avatarURL: controller.networkImage.value);
                    Get.toNamed(AppRoute.manageProfile, arguments: user);
                  },
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
                child: InkWell(
                  onTap: () => Get.to(History()),
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
                          controller.language.value,
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
                  onTap: () async {
                    var result = await Get.bottomSheet(ChangeLanguagePicker());
                    controller.language.value = result;
                  },
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
        title: const Text(
          'Thông tin người dùng',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Column(
        children: [
          Align(
              alignment: Alignment.topCenter,
              child: FutureBuilder(
                  future: AuthApiService().GetInforUser(id: id, token: token),
                  builder: (context, snapshot) {
                    if (snapshot?.hasData == null) Container();
                    return _topProfile(context, snapshot: snapshot?.data);
                  })),
          Expanded(
              child: DraggableScrollableSheet(
                  initialChildSize: 1,
                  minChildSize: 1,
                  maxChildSize: 1,
                  expand: true,
                  builder: (context, ScrollController scrollController) {
                    return SingleChildScrollView(
                      controller: scrollController,
                      child: FutureBuilder<StatusSuccessGet>(
                          future: AuthApiService().GetInforUser(),
                          builder: (context, snapshot) {
                            return snapshot.hasData
                                ? _bodyProfileScreen(context,
                                    snashot: snapshot.data)
                                : _bodyProfileScreen(context);
                          }),
                    );
                  })),
        ],
      ),
    );
  }
}
