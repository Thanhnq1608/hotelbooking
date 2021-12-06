import 'package:hotelbooking/login_register/model_auth/customer.dart';

class StatusSuccess {
  final String status;
  final Customer data;
  StatusSuccess({
    this.status,
    this.data,
  });

  factory StatusSuccess.fromJson(Map<String, dynamic> json) {
    return StatusSuccess(
      status: json['status'],
      data: Customer.fromJson(json['data'])
    );
  }
}

class StatusSuccessGet {
  final String status;
  final CustomerGet data;
  StatusSuccessGet({
    this.status,
    this.data,
  });

  factory StatusSuccessGet.fromJson(Map<String, dynamic> json) {
    return StatusSuccessGet(
      status: json['status'],
      data: CustomerGet.fromJson(json['data'])
    );
  }
}