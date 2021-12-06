
import 'package:flutter/material.dart';
import 'package:hotelbooking/login_register/login/login_form.dart';
import 'package:hotelbooking/login_register/login_register_button/login_button_user.dart';
import 'package:hotelbooking/login_register/register/register.dart';

class LoginUser extends StatefulWidget {

  LoginUser({Key key,});
  @override
  _LoginUserState createState() => _LoginUserState();
}

class _LoginUserState extends State<LoginUser> {
  final GlobalKey<FormState> _fromKey = GlobalKey<FormState>();
  final controllerEmail = TextEditingController();
  final controllerPassword = TextEditingController();

  @override
  void initState() {
    super.initState();
  
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        title: Text(
          'Đăng Nhập',
          style: TextStyle(
              fontSize: 17,
              height: 1.3,
              fontWeight: FontWeight.w700,
              color: Color(0xff233142)),
        ),
      ),
      body:
         SingleChildScrollView(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(left: 16, top: 16, right: 16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(
                        margin: EdgeInsets.only(left: 16, right: 16, top: 16),
                        child: LoginForm(
                          formKeyName: _fromKey,
                          controllerEmail: controllerEmail,
                          controllerPassword: controllerPassword,
                        )),
                    Container(
                      child: TextButton(
                        onPressed: () async {
                          // await AuthApiService().SignIn(
                          //     email: 'viettiennguyen267@gmail.com',
                          //     password: '"Test123@"');
                        },
                        child: Text(
                          'Quên mật khẩu?',
                          style: TextStyle(
                            fontSize: 15,
                            height: 1.3,
                            fontWeight: FontWeight.w500,
                            color: Color(0xff8799AF),
                          ),
                        ),
                      ),
                    ),
                    Container(
                        margin: EdgeInsets.only(left: 16, top: 16, right: 16),
                        decoration: BoxDecoration(
                            color: Color(0xffE84D4E),
                            borderRadius: BorderRadius.circular(8)),
                        child: LoginButtonUser(
                          fromKey: _fromKey,
                          controllerEmail: controllerEmail,
                          controllPassword: controllerPassword,
                        )),
                  ],
                ),
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      child: Text(
                        'Bạn chưa có tài khoản ? ',
                        style: TextStyle(
                          fontSize: 15,
                          height: 1.3,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    Container(
                      child: TextButton(
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return Register(
                              );
                            
                          }));
                        },
                        child: Text(
                          'Đăng ký ',
                          style: TextStyle(
                            fontSize: 15,
                            height: 1.3,
                            color: Color(0xff4184E8),
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        )
      );
  
  }
}
