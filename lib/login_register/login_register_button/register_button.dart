import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotelbooking/login_register/auth_api_service.dart';
import 'package:async/async.dart';

class RegisterButton extends StatelessWidget {
  var formKeyName;
  final emailUserController;
  final passwordUserController;
  final fullNameController;
  final registerBloc;
  final addressUserController;
  RegisterButton(
      {this.formKeyName,
      this.emailUserController,
      this.passwordUserController,
      this.fullNameController,
      this.addressUserController,
      this.registerBloc});

  @override
  Widget build(BuildContext context) {
    return FlatButton(
        minWidth: MediaQuery.of(context).size.width,
        onPressed: () async {
          Result<bool> result = await AuthApiService().SignUp(
            name: fullNameController.text,
            email: emailUserController.text,
            password: passwordUserController.text,
            address: addressUserController.text,
          );
          if (result.isValue) {
            Get.back();
          } else {}
        },
        child: Text(
          "Đăng ký",
          style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w500,
              color: Colors.white,
              height: 1.3,
              fontStyle: FontStyle.normal),
        ));
  }
}
