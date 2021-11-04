import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/profile_controller.dart';

class ManageProfileView extends GetView<ProfileController> {
  TextEditingController _fullnameController = TextEditingController();

  Widget _bodyManage(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.9,
        padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.05),
        margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.01),
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            Positioned(
                top: MediaQuery.of(context).size.height * 0.05,
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.9,
                  height: MediaQuery.of(context).size.height * 0.76,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(
                            top: MediaQuery.of(context).size.height * 0.1),
                        width: MediaQuery.of(context).size.width * 0.8,
                        height: MediaQuery.of(context).size.height * 0.08,
                        child: TextField(
                          decoration: InputDecoration(labelText: 'Fullname'),
                          controller: _fullnameController,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                            top: MediaQuery.of(context).size.height * 0.1),
                        width: MediaQuery.of(context).size.width * 0.8,
                        height: MediaQuery.of(context).size.height * 0.08,
                        child: TextField(
                          decoration: InputDecoration(labelText: 'Fullname'),
                          controller: _fullnameController,
                        ),
                      ),
                    ],
                  ),
                )),
            Container(
                width: MediaQuery.of(context).size.width * 0.2,
                height: MediaQuery.of(context).size.width * 0.2,
                margin: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.01),
                child: Stack(
                  children: [
                    Obx(
                      () => Container(
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
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Container(
                        width: 20,
                        height: 20,
                        decoration: BoxDecoration(
                            color: Colors.white, shape: BoxShape.circle),
                        child: IconButton(
                          padding: EdgeInsets.zero,
                          icon: Icon(
                            Icons.camera_alt_rounded,
                            color: Color(0xFF8799AF),
                            size: 15,
                          ),
                          onPressed: null,
                        ),
                      ),
                    )
                  ],
                )),
          ],
        ));
  }

  @override
  Widget build(BuildContext context) {
    _fullnameController.text = controller.fullname.value;
    _fullnameController.addListener(() {
      controller.fullname.value = _fullnameController.text;
    });
    return Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        appBar: AppBar(
          backgroundColor: Theme.of(context).primaryColor,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios_rounded,
              color: Colors.white,
            ),
            onPressed: () => Get.toNamed('/profile'),
          ),
          title: const Text(
            'Manage Profile',
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(child: _bodyManage(context)),
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.1,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20))),
            )
          ],
        ));
  }
}
