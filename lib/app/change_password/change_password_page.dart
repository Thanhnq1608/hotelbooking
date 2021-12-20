import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:hotelbooking/login_register/auth_api_service.dart';

class ChangePasswordPage extends StatelessWidget {
  var isObscureText = true.obs;
  var isObscureReText = true.obs;
  var isObscureOldText = true.obs;

  var currentPasswordController = TextEditingController();
  var newPasswordController = TextEditingController();
  var reNewPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: _appBar(),
      body: Obx(() => _bodyForget()),
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
            "Mật khẩu hiện tại",
            style: TextStyle(fontStyle: FontStyle.italic),
          ),
          SizedBox(
            height: 10,
          ),
          TextFormField(
            controller: currentPasswordController,
            autofocus: true,
            obscureText: isObscureOldText.value,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(20),
                ),
              ),
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
              controller: newPasswordController,
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
              controller: reNewPasswordController,
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
            onTap: () async {
              var payload = {"password": reNewPasswordController.text};
              if (newPasswordController.text != reNewPasswordController.text) {
                Fluttertoast.showToast(
                    msg: "Mật khẩu không trùng nhau",
                    backgroundColor: Colors.red,
                    fontSize: 20);
              } else {
                await AuthApiService().UpdateUser(payload);
                Fluttertoast.showToast(
                    msg: "Bạn đã đổi mật khẩu thành công",
                    backgroundColor: Colors.green,
                    fontSize: 12);
                Get.back();
              }
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
        "Đổi mật khẩu",
        style: TextStyle(
          color: Colors.black,
        ),
      ),
    );
  }
}
