import 'dart:convert';
import 'package:hotelbooking/login_register/model_auth/customer.dart';
import 'package:hotelbooking/login_register/model_auth/status_success.dart';
import 'package:http/http.dart' as http;
import 'package:async/async.dart';

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
      print(jsonDecode(response.body)['message']);
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
      print('object');
      return Result.value(true);
    } else {
      print(response.body);
    }
  }

  Stream<StatusSuccessGet> GetInforUser({String id, String token}) async* {
    final url =
        "https://datphongkhachsan.herokuapp.com/api/v1/auth/getUser/$id";
    final http.Client client = http.Client();
    print(id);
    final response = await client.get(
      Uri.parse(url),
      headers: <String, String>{
        'Accept': 'application/json',
        'Authorization': 'bearer $token'
      },
    );

    if (response.statusCode == 200) {
      print('object' + response.body);
      yield StatusSuccessGet.fromJson(jsonDecode(response.body));
    } else {
      print(response.body);
    }
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
