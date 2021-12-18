import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:hotelbooking/app.dart';
import 'package:hotelbooking/app/manage_profile/manage_profile_controller.dart';
import 'package:hotelbooking/app/manage_profile/user.update.model.dart';
import 'package:hotelbooking/app/profile/profile_views.dart';
import 'package:hotelbooking/login_register/auth_api_service.dart';
import 'package:async/async.dart';

class BottomProfile extends StatelessWidget {
  ManageProfileController controller;
  BottomProfile({this.controller});

  @override
  Widget build(BuildContext context) {
    return new Container(
      height: 100,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              blurRadius: 7,
            )
          ]),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Container(
              margin: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(20),
              ),
              child: TextButton(
                  onPressed: () {
                    Get.off(() => App(selectedIndex: 1));
                  },
                  child: Text(
                    'Hủy',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.w600),
                  )),
            ),
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Color(0xFFFF6666),
                borderRadius: BorderRadius.circular(20),
              ),
              child: TextButton(
                  onPressed: () async {
                    var payload = {
                      'fullName': controller.fullnameController.text,
                      'email': controller.emailController.text,
                      'DateOfBirth': controller.dateOfBirthController.text,
                      'address': controller.addressController.text,
                    };
                    Result<UserUpdateModel> result =
                        await AuthApiService().UpdateUser(payload);
                    if (result.isValue) {
                      Get.back();
                      await Fluttertoast.showToast(
                          msg: 'Bạn đã cập nhật thông tin thành công',
                          backgroundColor: Colors.green,
                          toastLength: Toast.LENGTH_LONG);
                    } else {
                      Fluttertoast.showToast(
                          msg: 'Cập nhật thông tin thất bại',
                          backgroundColor: Colors.red,
                          toastLength: Toast.LENGTH_LONG);
                    }
                  },
                  child: Text(
                    'Thay đổi',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w600),
                  )),
            ),
          )
        ],
      ),
    );
  }
}
