import 'package:flutter/material.dart';

class AddressRegister extends StatelessWidget {
  final addressController;

  const AddressRegister({Key key, this.addressController}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.only(top: 8),
          child: Text(
            'Địa chỉ',
            style: TextStyle(
              fontSize: 15,
              height: 1.3,
              fontWeight: FontWeight.w500,
              color: Color(0xff233142),
            ),
          ),
        ),
        Container(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(top: 8),
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Tỉnh/Thành phố',
                    hintStyle: TextStyle(
                      fontSize: 12,
                      height: 1.3,
                      fontWeight: FontWeight.w500,
                      color: Color(0xff8799AF),
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 8),
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Quận/Huyện',
                    hintStyle: TextStyle(
                      fontSize: 12,
                      height: 1.3,
                      fontWeight: FontWeight.w500,
                      color: Color(0xff8799AF),
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 8),
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Phường/Xã',
                    hintStyle: TextStyle(
                      fontSize: 12,
                      height: 1.3,
                      fontWeight: FontWeight.w500,
                      color: Color(0xff8799AF),
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 8),
                child: TextField(
                  controller:addressController ,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Nhập địa chỉ cụ thể',
                    hintStyle: TextStyle(
                      fontSize: 12,
                      height: 1.3,
                      fontWeight: FontWeight.w500,
                      color: Color(0xff8799AF),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
