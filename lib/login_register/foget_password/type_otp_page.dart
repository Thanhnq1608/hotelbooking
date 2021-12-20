import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotelbooking/login_register/foget_password/foget_pass_controller.dart';

class TypeOTPPage extends GetView<ForgetPassController> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(appBar: _appBar(), body: _bodyTypeOTP());
  }

  Widget _bodyTypeOTP() {
    return Container(
      margin: EdgeInsets.all(10),
      child: Column(
        children: [
          Text(
            "Mã OTP đã được gửi vào số điện thoại ${controller.phoneController.text} Vui lòng nhập mã OTP để xác nhận",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            width: double.infinity,
            height: 230,
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                      color: Colors.black54,
                      offset: Offset(0, 0),
                      blurRadius: 5,
                      spreadRadius: 2)
                ],
                borderRadius: BorderRadius.all(Radius.circular(20)),
                color: Colors.white),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextField(
                  autofocus: true,
                  maxLength: 6,
                  keyboardType: TextInputType.number,
                  controller: controller.OTPController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(15),
                      ),
                    ),
                    hintText: "Nhập mã OTP",
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                InkWell(
                  child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(15),
                        ),
                        color: Color(0xFFE84D4E)),
                    alignment: Alignment.center,
                    child: Text(
                      "Xác nhận",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  onTap: () {
                    controller.verifyOTP();
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                Obx(
                  () => Align(
                    alignment: Alignment.center,
                    child: controller.isCheckTimeOut.value
                        ? InkWell(
                            onTap: () {
                              controller.sendOTP();
                              controller.isCheckTimeOut.value = false;
                            },
                            child: Text(
                              "Gửi lại OTP",
                              style: TextStyle(
                                  fontSize: 17,
                                  color: Color(0xFFCC3637),
                                  decoration: TextDecoration.underline),
                            ),
                          )
                        : Text(
                            "Gửi lại OTP",
                            style: TextStyle(
                                fontSize: 17,
                                color: Colors.black45,
                                decoration: TextDecoration.underline),
                          ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  AppBar _appBar() {
    return AppBar(
      backgroundColor: Colors.white,
      leading: IconButton(
        padding: EdgeInsets.zero,
        icon: Icon(
          Icons.arrow_back,
          color: Colors.black,
        ),
        onPressed: () {
          Get.back();
        },
      ),
      centerTitle: true,
      title: Text(
        "Quên mật khẩu",
        style: TextStyle(
          color: Colors.black,
        ),
      ),
    );
  }
}
