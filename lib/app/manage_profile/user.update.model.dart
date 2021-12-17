class UserUpdateModel {
  String message;
  Data data;

  UserUpdateModel({this.message, this.data});

  UserUpdateModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    return data;
  }
}

class Data {
  String sId;
  String role;
  String fullName;
  String phone;
  String email;
  String userName;
  String password;
  String position;
  String dateOfBirth;
  String status;
  String address;
  String createBy;
  String updateBy;
  String createdAt;
  String updatedAt;
  int iV;

  Data(
      {this.sId,
      this.role,
      this.fullName,
      this.phone,
      this.email,
      this.userName,
      this.password,
      this.position,
      this.dateOfBirth,
      this.status,
      this.address,
      this.createBy,
      this.updateBy,
      this.createdAt,
      this.updatedAt,
      this.iV});

  Data.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    role = json['role'];
    fullName = json['fullName'];
    phone = json['phone'];
    email = json['email'];
    userName = json['userName'];
    password = json['password'];
    position = json['position'];
    dateOfBirth = json['DateOfBirth'];
    status = json['status'];
    address = json['address'];
    createBy = json['createBy'];
    updateBy = json['updateBy'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['role'] = this.role;
    data['fullName'] = this.fullName;
    data['phone'] = this.phone;
    data['email'] = this.email;
    data['userName'] = this.userName;
    data['password'] = this.password;
    data['position'] = this.position;
    data['DateOfBirth'] = this.dateOfBirth;
    data['status'] = this.status;
    data['address'] = this.address;
    data['createBy'] = this.createBy;
    data['updateBy'] = this.updateBy;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    return data;
  }
}
