import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotelbooking/app/manage_profile/manage_profile_controller.dart';
import 'package:hotelbooking/app/profile/profile_controller.dart';
import 'package:intl/intl.dart';

class ManageProfileView extends StatelessWidget {
  final controller = Get.put(ManageProfileController(user: Get.arguments));

  Widget _bodyManage(BuildContext context) {
    return Container(
        width: context.width,
        height: context.height * 0.9,
        margin: EdgeInsets.only(top: context.height * 0.01),
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            Positioned(
                top: context.height * 0.05,
                child: Container(
                  width: context.width * 0.95,
                  height: context.height * 0.76,
                  padding: EdgeInsets.only(top: 40, left: 10, right: 10),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  child: Column(
                    children: [
                      TextField(
                        decoration: InputDecoration(labelText: 'Fullname'),
                        controller: controller.fullnameController,
                      ),
                      TextField(
                        decoration: InputDecoration(labelText: 'Phone Number'),
                        controller: controller.phoneNumberController,
                      ),
                      TextField(
                        decoration: InputDecoration(labelText: 'Email'),
                        controller: controller.emailController,
                      ),
                      TextField(
                        readOnly: true,
                        decoration: InputDecoration(labelText: 'Date of birth'),
                        controller: controller.dateOfBirthController,
                        onTap: () {
                          Get.bottomSheet(CupertinoDatePicker(
                            backgroundColor: Colors.white,
                            initialDateTime: DateTime.now(),
                            mode: CupertinoDatePickerMode.date,
                            onDateTimeChanged: (value) {
                              controller.user.update((val) {
                                val.dateOfBirth = value.toString();
                                controller.dateOfBirthController.text =
                                    DateFormat('dd/MM/yyyy').format(value);
                              });
                            },
                          ));
                        },
                      ),
                      TextField(
                        decoration: InputDecoration(labelText: 'Address'),
                        controller: controller.addressController,
                      ),
                    ],
                  ),
                )),
            Container(
                width: context.width * 0.2,
                height: context.width * 0.2,
                margin: EdgeInsets.only(top: context.height * 0.01),
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
                                image: NetworkImage(
                                    controller.user.value.avatarURL),
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
    return Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        appBar: AppBar(
          backgroundColor: Theme.of(context).primaryColor,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios_rounded,
              color: Colors.white,
            ),
            onPressed: () => Get.back(),
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
              width: context.width,
              height: context.height * 0.1,
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
