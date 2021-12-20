import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:hotelbooking/login_register/foget_password/foget_pass_controller.dart';

class ForgetPasswordPage extends GetView<ForgetPassController> {
  Rx<bool> isObscureText = true.obs;
  Rx<bool> isObscureReText = true.obs;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Scaffold(
      appBar: _appBar(),
      body: _bodyForget(),
    );
  }

  Widget _bodyForget() {
    return Container(
      height: 390,
      margin: EdgeInsets.all(10),
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
          Text(
            "Nhập số điện thoại",
            style: TextStyle(fontStyle: FontStyle.italic),
          ),
          SizedBox(
            height: 10,
          ),
          TextFormField(
            controller: controller.phoneController,
            autofocus: true,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(20),
                ),
              ),
              hintText: "VD: 0332751701",
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            "Mật khẩu mới",
            style: TextStyle(fontStyle: FontStyle.italic),
          ),
          SizedBox(
            height: 10,
          ),
          Obx(
            () => TextFormField(
              obscureText: isObscureText.value,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(15),
                  ),
                ),
                hintText: "Nhập mật khẩu mới",
                suffixIcon: IconButton(
                  icon: Icon(
                    Icons.remove_red_eye,
                    color: isObscureText.value ? Colors.black45 : Colors.blue,
                  ),
                  onPressed: () {
                    if (isObscureText.value) {
                      isObscureText.value = false;
                    } else {
                      isObscureText.value = true;
                    }
                  },
                ),
              ),
              controller: controller.passwordController,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Obx(
            () => TextFormField(
              obscureText: isObscureReText.value,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(15),
                  ),
                ),
                hintText: "Nhập lại mật khẩu mới",
                suffixIcon: IconButton(
                  icon: Icon(
                    Icons.remove_red_eye,
                    color: isObscureReText.value ? Colors.black45 : Colors.blue,
                  ),
                  onPressed: () {
                    if (isObscureReText.value) {
                      isObscureReText.value = false;
                    } else {
                      isObscureReText.value = true;
                    }
                  },
                ),
              ),
              controller: controller.rePasswordController,
            ),
          ),
          SizedBox(
            height: 20,
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
               controller.onClickConfirmForget();
            },
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
