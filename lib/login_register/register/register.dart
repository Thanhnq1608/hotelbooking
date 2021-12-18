
import 'package:flutter/material.dart';
import 'package:hotelbooking/login_register/login_register_button/register_button.dart';
import 'package:hotelbooking/login_register/register/address_register.dart';
import 'package:hotelbooking/login_register/register/footer_register.dart';
import 'package:hotelbooking/login_register/register/profile_register.dart';

class Register extends StatefulWidget {
  Register({Key key});
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final GlobalKey<FormState> _fromKeyRegisterName = GlobalKey<FormState>();
  final emailUserController = TextEditingController();
  final phonelUserController = TextEditingController();
  final passwordUserController = TextEditingController();
  final fullNameController = TextEditingController();
  final addressController = TextEditingController();
  var isCheckBox = false;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.grey),
        backgroundColor: Colors.white,
        title: Text(
          'Đăng ký',
          style: TextStyle(
              fontSize: 17,
              height: 1.3,
              fontWeight: FontWeight.w700,
              color: Color(0xff233142)),
        ),
      ),
      body: SingleChildScrollView(
            child: Column(children: [
              Container(
                margin: EdgeInsets.only(left: 16, top: 16, right: 16),
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  children: [
                    Container(
                        child: ProfileRegister(
                      formKeyName: _fromKeyRegisterName,
                      fullNameController: fullNameController,
                      emailUserController: emailUserController,
                      phoneUserController: phonelUserController,
                      passwordUserController: passwordUserController,
                    )),
                    Container(
                      child: AddressRegister(addressController: addressController,),
                    ),
                    Container(
                      child: Row(
                        children: [
                          Checkbox(
                              value: isCheckBox,
                              onChanged: (Value) {
                                setState(() {
                                  isCheckBox = Value;
                                });
                              }),
                          Text(
                            'Tôi đồng ý với điều khoản dịch vụ',
                            style: TextStyle(
                                fontSize: 12,
                                height: 1.3,
                                fontWeight: FontWeight.w500),
                          )
                        ],
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: Color(0xffE84D4E),
                          borderRadius: BorderRadius.circular(8)),
                      child: RegisterButton(
                        isCheckBox: isCheckBox,
                        addressUserController: addressController,
                        formKeyName: _fromKeyRegisterName,
                        emailUserController: emailUserController,
                        phoneUserController: phonelUserController,
                        passwordUserController: passwordUserController,
                        fullNameController: fullNameController,
                      ),
                    )
                  ],
                ),
              ),
              Container(child: FootterRegister()),
            ]),
          ));}
        }
   
 
