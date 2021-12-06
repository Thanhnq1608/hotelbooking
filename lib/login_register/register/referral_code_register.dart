import 'package:flutter/material.dart';

class ReferralCodeRegister extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Form(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Mã giới thiệu',
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
          decoration: InputDecoration(
              border: OutlineInputBorder(), hintText: 'Nhập mã giới thiệu'),
        ),
      ],
    ));
  }
}
