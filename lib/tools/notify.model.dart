class NotifyModel{
  String message;
  int result;
  List<Data> data;

 NotifyModel({this.message, this.result, this.data});

 NotifyModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    result = json['result'];
    if (json['data'] != null) {
      data = new List<Data>();
      json['data'].forEach((v) {
        data.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['result'] = this.result;
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
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
  String avatar;
  String tokenId;

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
      this.iV,
      this.avatar,
      this.tokenId});

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
    avatar = json['avatar'];
    tokenId = json['tokenId'];
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
    data['avatar'] = this.avatar;
    data['tokenId'] = this.tokenId;
    return data;
  }
}