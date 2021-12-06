import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotelbooking/app.dart';
import 'package:hotelbooking/login_register/auth_api_service.dart';
import 'package:hotelbooking/login_register/model_auth/status_success.dart';
import 'package:async/async.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginButtonUser extends StatelessWidget {
  var controllerEmail;
  var controllPassword;
  var fromKey;
  final loginBloc;
  LoginButtonUser({
    this.fromKey,
    this.controllerEmail,
    this.controllPassword,
    this.loginBloc,
  });
  @override
  Widget build(BuildContext context) {
    return FlatButton(
        minWidth: MediaQuery.of(context).size.width,
        onPressed: () async {
          Result<StatusSuccess> result = await AuthApiService().SignIn(
            email: controllerEmail.text,
            password: controllPassword.text,
          );
          if (result.isValue) {
            Get.to(App(
              id: result.asValue.value.data.customer.id,
              token: result.asValue.value.data.token,
            ));
          } else if (result.isError) {
            print('cscs' + result.asError.error);
          }
        },
        child: Text(
          "Đăng nhập",
          style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w500,
              color: Colors.white,
              height: 1.3,
              fontStyle: FontStyle.normal),
        ));
  }
}
