import 'dart:convert';
import 'package:hotelbooking/app/manage_profile/user.update.model.dart';
import 'package:hotelbooking/login_register/model_auth/status_success.dart';
import 'package:http/http.dart' as http;
import 'package:async/async.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'employee.model.dart';

class AuthApiService {
  Future<Result<StatusSuccess>> SignIn({
    String email,
    String password,
  }) async {
    final url = "https://datphongkhachsan.herokuapp.com/api/v1/auth/login";
    final http.Client client = http.Client();
    final response = await client.post(
      Uri.parse(url),
      headers: <String, String>{
        'Accept': 'application/json',
        'Content-Type': 'application/json; charset=UTF-8'
      },
      body: jsonEncode(<String, String>{
        'phone': email,
        'passWord': password,
      }),
    );
    if (response.statusCode == 200) {
      final data =
          response.body is Map ? response.body : jsonDecode(response.body);
      return Result.value(StatusSuccess.fromJson(data));
    } else {
      return Result.error(jsonDecode(response.body)['message']);
    }
  }

  Future<Result<bool>> SignUp({
    String name,
    String email,
    String password,
    String address,
    String phone,
  }) async {
    final url = "https://datphongkhachsan.herokuapp.com/api/v1/auth/register";
    final http.Client client = http.Client();
    final response = await client.post(
      Uri.parse(url),
      headers: <String, String>{
        'Accept': 'application/json',
        'Content-Type': 'application/json; charset=UTF-8'
      },
      body: jsonEncode(<String, dynamic>{
        "role": "customer",
        'name': name,
        'email': email,
        'password': password,
        "fullName": name,
        "phone": phone,
        "userName": name,
        "position": "YYY",
        "DateOfBirth": "2001-10-30",
        "status": 1,
        "address": address,
        "createBy": "customer",
        "updateBy": "customer"
      }),
    );
    if (response.statusCode == 200) {
      return Result.value(true);
    } else {
      print(response.body);
      return Result.error(true);
    }
  }

  Future<StatusSuccessGet> getInforUser() async {
    final prefs = await SharedPreferences.getInstance();
    final id = prefs.getString('id');
    final token = prefs.getString('token');
    final url =
        "https://datphongkhachsan.herokuapp.com/api/v1/auth/getUser/$id";
    final http.Client client = http.Client();
    final response = await client.get(
      Uri.parse(url),
      headers: <String, String>{
        'Accept': 'application/json',
        'Authorization': 'bearer $token'
      },
    );
    try {
      if (response.statusCode == 200) {
        return StatusSuccessGet.fromJson(jsonDecode(response.body));
      } else {}
    } catch (e) {}
  }

  Future<Result<UserUpdateModel>> UpdateUser(payload) async {
    final prefs = await SharedPreferences.getInstance();
    final id = prefs.getString('id');
    final token = prefs.getString('token');
    final url =
        "https://datphongkhachsan.herokuapp.com/api/v1/auth/updateUser/$id";
    final http.Client client = http.Client();
    final response = await client.put(Uri.parse(url),
        headers: <String, String>{
          'Accept': 'application/json,',
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'bearer $token'
        },
        body: jsonEncode(payload));
    try {
      if (response.statusCode == 200) {
        return Result.value(
            UserUpdateModel.fromJson(jsonDecode(response.body)));
      } else {
        print('error');
      }
    } catch (e) {}
  }

  Future<Result<UserUpdateModel>> UpdateTokenIdUser(payload) async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');
    final url =
        "https://datphongkhachsan.herokuapp.com/api/v1/auth/updateTokenId";
    final http.Client client = http.Client();
    final response = await client.put(Uri.parse(url),
        headers: <String, String>{
          'Accept': 'application/json,',
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'bearer $token'
        },
        body: jsonEncode(payload));
    try {
      if (response.statusCode == 200) {
        return Result.value(
            UserUpdateModel.fromJson(jsonDecode(response.body)));
      } else {
        print('error');
      }
    } catch (e) {}
  }

  Future<Result<StatusSuccessGet>> resetPassword(payload) async {
    final url =
        "https://datphongkhachsan.herokuapp.com/api/v1/auth/ResetPassWord";
    final http.Client client = http.Client();
    print(payload);
    final response = await client.post(Uri.parse(url),
        // headers: <String, String>{
        //   'Accept': 'application/json,',
        // },
        body: jsonEncode(payload));
    try {
      if (response.statusCode == 200) {
        print('object');
        return Result.value(
            StatusSuccessGet.fromJson(jsonDecode(response.body)));
      } else {
        print(response.body);
      }
    } catch (e) {}
  }


    Future<Employee> getEmployee() async {
    final prefs = await SharedPreferences.getInstance();
    final id = prefs.getString('id');
    final token = prefs.getString('token');
    final url =
        "https://datphongkhachsan.herokuapp.com/api/v1/auth/getEmployees";
    final http.Client client = http.Client();
    final response = await client.get(
      Uri.parse(url),
      headers: <String, String>{
        'Accept': 'application/json',
        'Authorization': 'bearer $token'
      },
    );
    try {
      if (response.statusCode == 200) {
        return Employee.fromJson(jsonDecode(response.body));
      } else {}
    } catch (e) {}
  }
  // Future<void> SignOut() async {
  //   final url = "https://api.ssm.suplo.vn/v1/auth/customer/signout";
  //   final http.Client client = http.Client();
  //   final response = await client.post(
  //     Uri.parse(url),
  //     headers: <String, String>{
  //       'Accept': 'application/json',
  //       'Authorization':
  //           'bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0eXBlIjoiY3VzdG9tZXIiLCJpZCI6IjE2NDMwMzRkLTllN2YtNGMyMS1hZTRjLTJmZjFkY2UwMDY2MSIsImVtYWlsIjoidmlldHRpZW5uZ3V5ZW4yNjdAZ21haWwuY29tIiwicGhvbmVOdW1iZXIiOiIrODQ5NzI2ODMwNTEiLCJzaG9wSWQiOiI4YmU0YTc5OC0yYmIwLTRlZmMtYTFhYi00MjMzMWVkZTRhY2UiLCJpYXQiOjE2MzMwNTM2NDgsImV4cCI6MTY2NDYxMTI0OCwiaXNzIjoiaHR0cHM6Ly9hcGkuc3NtLnN1cGxvLnZuIn0.ZsMTYEj-mAZ1OeeQTKoOW1Lvlnw9wEEu3Vb-mhQzCps'
  //     },
  //   );
  //   if (response.statusCode == 204) {
  //     print(response.body);
  //   } else {
  //     print(response.body);
  //   }
  // }
}
