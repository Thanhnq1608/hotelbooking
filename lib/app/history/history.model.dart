class HistoryModel {
  String sId;
  String fullName;
  String phone;
  String email;
  String timeBookingStart;
  String timeBookingEnd;
  int advanceDeposit;
  String createdAt;
  String updatedAt;
  int bookingStatus;
  int totalRoomRate;
  int iV;

  HistoryModel(
      {this.sId,
      this.fullName,
      this.phone,
      this.email,
      this.timeBookingStart,
      this.timeBookingEnd,
      this.advanceDeposit,
      this.createdAt,
      this.updatedAt,
      this.bookingStatus,
      this.totalRoomRate,
      this.iV});

  HistoryModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    fullName = json['fullName'];
    phone = json['phone'];
    email = json['email'];
    timeBookingStart = json['timeBookingStart'];
    timeBookingEnd = json['timeBookingEnd'];
    advanceDeposit = json['advanceDeposit'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    bookingStatus = json['bookingStatus'];
    totalRoomRate = json['totalRoomRate'];
    iV = json['__v'];
  }
}

class HistoryRoom {
  String sId;
  String idBooking;
  String idRoom;
  String createdAt;
  int iV;

  HistoryRoom({this.sId, this.idBooking, this.idRoom, this.createdAt, this.iV});

  HistoryRoom.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    idBooking = json['idBooking'];
    idRoom = json['idRoom'];
    createdAt = json['createdAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['idBooking'] = this.idBooking;
    data['idRoom'] = this.idRoom;
    data['createdAt'] = this.createdAt;
    data['__v'] = this.iV;
    return data;
  }
}

