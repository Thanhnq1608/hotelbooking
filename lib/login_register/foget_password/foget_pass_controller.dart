import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:hotelbooking/login_register/auth_api_service.dart';
import 'package:hotelbooking/login_register/foget_password/type_otp_page.dart';
import 'package:hotelbooking/login_register/login/login_user.dart';
import 'package:hotelbooking/login_register/model_auth/status_success.dart';
import 'package:async/async.dart';

class ForgetPassController extends GetxController {
  FirebaseAuth auth = FirebaseAuth.instance;
  var isCheckTimeOut = false.obs;
  var id = "".obs;
  var OTPController = TextEditingController();
  var phoneController = TextEditingController();
  var passwordController = TextEditingController();
  var rePasswordController = TextEditingController();

  void onClickConfirmForget() async {
    if (phoneController.text.isEmpty ||
        passwordController.text.isEmpty ||
        rePasswordController.text.isEmpty) {
      Get.snackbar("Error", "Bạn không đưuọc bỏ trống dữ liệu");
    } else if (rePasswordController.text != passwordController.text) {
      Get.snackbar("Error", "Mật khẩu nhập lại không chính xác");
    } else {
      await sendOTP(phoneController.text);
    }
  }

  Future<void> sendOTP(String phone) async {
    auth.setLanguageCode("vi");
    String phonenumber =
        "+84" + phone.substring(1, phone.length);
    print(phonenumber);
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: phonenumber,
      timeout: Duration(seconds: 60),
      verificationCompleted: (PhoneAuthCredential credential) async {
        // ANDROID ONLY!

        // Sign the user in (or link) with the auto-generated credential
        await auth.signInWithCredential(credential);
      },
      verificationFailed: (FirebaseAuthException e) {
        if (e.code == 'invalid-phone-number') {
          print('The provided phone number is not valid.');
        }
      },
      codeSent: (String verificationId, int resendToken) {
        id.value = verificationId;
        Get.to(() => TypeOTPPage());
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        isCheckTimeOut.value = true;
      },
    );
  }

  Future<void> verifyOTP() async {
    if (OTPController.text.isEmpty) {
      Get.snackbar("Error", "Bạn chưa nhập OTP");
    } else {
      final AuthCredential credential = PhoneAuthProvider.credential(
        verificationId: id.value,
        smsCode: OTPController.text,
      );
      if (credential != null) {
        var payload = {
          "phone": "0332751701",
          "password": "123456789",
        };
        // Result<StatusSuccessGet> result =
        //     await AuthApiService().resetPassword(payload);
        _verifySuccess();
      } else {
        Get.snackbar("Code Invalid", "Mã OTP không chính xác!");
      }
    }
  }

  void _verifySuccess() {
    Get.offAll(() => LoginUser());
    // Get.snackbar("Success", "Bạn đã đổi mật khẩu thành công!");
  }
}
