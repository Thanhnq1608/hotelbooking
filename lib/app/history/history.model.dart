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
