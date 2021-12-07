import 'package:flutter/material.dart';

class TelPassRegister extends StatefulWidget {
  final emailUserController;
  final phoneUserController;
  final passwordUserController;
  final formKeyName;
  final registerState;
  TelPassRegister(
      {this.formKeyName,
      this.emailUserController,
      this.phoneUserController,
      this.passwordUserController,
      this.registerState});

  @override
  _TelPassRegisterState createState() => _TelPassRegisterState();
}

class _TelPassRegisterState extends State<TelPassRegister> {
  @override
  Widget build(BuildContext context) {
    return Container(
      //key: formKeyName,
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
            controller: widget.phoneUserController,
            decoration: InputDecoration(
                border: OutlineInputBorder(), hintText: 'Nhập số điện thoại'),
            validator: (_) {
              return widget.registerState;
            },
            keyboardType: TextInputType.emailAddress,
          ),
          SizedBox(
            height: 8,
          ),
          Text(
            'Email',
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
            controller: widget.emailUserController,
            decoration: InputDecoration(
                border: OutlineInputBorder(), hintText: 'Nhập email'),
            validator: (_) {
              return widget.registerState;
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
            controller: widget.passwordUserController,
            obscureText: true,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Nhập mật khẩu',
            ),
            validator: (_) {
              return widget.registerState;
            },
            keyboardType: TextInputType.text,
          ),
        ],
      ),
    );
  }
}
