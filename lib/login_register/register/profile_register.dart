
import 'package:flutter/material.dart';
import 'package:hotelbooking/login_register/register/tel_pass_register.dart';

class ProfileRegister extends StatelessWidget {
  final fullNameController;
  final emailUserController;
  final passwordUserController;
  final formKeyName;
  final registerState;

  ProfileRegister({
    this.formKeyName,
    this.fullNameController,
    this.emailUserController,
    this.passwordUserController,
    this.registerState,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
        key: formKeyName,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Họ và tên',
              style: TextStyle(
                fontSize: 15,
                height: 1.3,
                fontWeight: FontWeight.w500,
                color: Color(0xff233142),
              ),
            ),
            SizedBox(
              height: 8,
            ),
            TextFormField(
              controller: fullNameController,
              decoration: InputDecoration(
                  border: OutlineInputBorder(), hintText: 'Nhập tên của bạn'),
              validator: (_) {
                return registerState;
              },
            ),
            TelPassRegister(
              registerState: registerState,
              emailUserController: emailUserController,
              passwordUserController: passwordUserController,
            )
          ],
        ));
  }
}
