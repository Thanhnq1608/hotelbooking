
import 'package:flutter/material.dart';

class LoginForm extends StatefulWidget {
  final formKeyName;
  final controllerEmail;
  final controllerPassword;
  final loginState;
  LoginForm({
    this.formKeyName,
    this.controllerEmail,
    this.controllerPassword,
    this.loginState,
  });

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  bool isObscureText = true;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formKeyName,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Số điện thoại',
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
            controller: widget.controllerEmail,
            decoration: InputDecoration(
                border: OutlineInputBorder(), hintText: 'Nhập số điện thoại'),
            validator: (_) {
              return widget.loginState ? null : 'Invalid email format';
            },
            keyboardType: TextInputType.emailAddress,
          ),
          SizedBox(
            height: 8,
          ),
          Text(
            'Mật khẩu',
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
            controller: widget.controllerPassword,
            obscureText: isObscureText,
            decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Nhập mật khẩu',
                suffixIcon: IconButton(
                    icon: Icon(Icons.remove_red_eye),
                    onPressed: () {
                      setState(() {
                        if (isObscureText == true) {
                          isObscureText = false;
                        } else {
                          isObscureText = true;
                        }
                      });
                    })),
            validator: (_) {
              return widget.loginState ? null : 'Invalid password format';
            },
            keyboardType: TextInputType.text,
          ),
        ],
      ),
    );
  }
}
