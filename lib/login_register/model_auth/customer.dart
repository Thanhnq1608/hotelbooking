class Customer {
  final Customerdetail customer;
  final String token;
  Customer({
    this.customer,
    this.token,
  });
  factory Customer.fromJson(Map<String, dynamic> json) {
    return Customer(
      customer: Customerdetail.fromJson(json['user']),
      token: json['token'],
    );
  }
}

class CustomerGet {
  final Customerdetail customer;
  final String token;
  CustomerGet({
    this.customer,
    this.token,
  });
  factory CustomerGet.fromJson(Map<String, dynamic> json) {
    return CustomerGet(
      customer: Customerdetail.fromJson(json['user']),
      token: json['token'],
    );
  }
}

class Customerdetail {
  final String id;
  final String createdAt;
  final String updatedAt;
  final String email;
  final String phoneNumber;
  final String name;
  final String avatar;
  final String address;
  final String dateOfBirth;
  final String tokenID;
  Customerdetail(
      {this.id,
      this.createdAt,
      this.updatedAt,
      this.email,
      this.phoneNumber,
      this.name,
      this.address,
      this.avatar,
      this.dateOfBirth,
      this.tokenID});

  factory Customerdetail.fromJson(Map<String, dynamic> json) {
    return Customerdetail(
        id: json['_id'],
        createdAt: json['createdAt'],
        updatedAt: json['updatedAt'],
        email: json['email'],
        phoneNumber: json['phone'],
        name: json['fullName'],
        avatar: json['avatar'],
        address: json['address'],
        dateOfBirth: json['DateOfBirth'],
        tokenID: json['tokenId']);
  }
}
