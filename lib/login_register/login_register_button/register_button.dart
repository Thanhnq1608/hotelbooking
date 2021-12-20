import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:hotelbooking/login_register/auth_api_service.dart';
import 'package:async/async.dart';
import 'package:hotelbooking/login_register/foget_password/foget_pass_controller.dart';

class RegisterButton extends StatelessWidget {
  var controller = Get.put(ForgetPassController());
  var formKeyName;
  var isCheckBox;
  final emailUserController;
  final phoneUserController;
  final passwordUserController;
  final fullNameController;
  final registerBloc;
  final addressUserController;
  RegisterButton(
      {this.formKeyName,
      this.isCheckBox,
      this.emailUserController,
      this.phoneUserController,
      this.passwordUserController,
      this.fullNameController,
      this.addressUserController,
      this.registerBloc});

  @override
  Widget build(BuildContext context) {
    return FlatButton(
        minWidth: MediaQuery.of(context).size.width,
        onPressed: () async {
          if (isCheckBox == true) {
            Result<bool> result = await AuthApiService().SignUp(
              name: fullNameController.text,
              email: emailUserController.text,
              phone: phoneUserController.text,
              password: passwordUserController.text,
              address: addressUserController.text,
            );
            if (result.isValue) {
              controller.sendOTP(phoneUserController.text);
              // Get.back();
            } else {
              Fluttertoast.showToast(
                  msg: 'Đăng kí thất bại. Vui lòng thử lại',
                  backgroundColor: Colors.red);
            }
          } else {
            Fluttertoast.showToast(
                msg: 'Bạn phải đồng ý điều khoản dịch vụ',
                backgroundColor: Colors.red);
          }
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
