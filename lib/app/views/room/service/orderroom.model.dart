class OrderRoomBooked {
  final String id;
  final String name;
  final String phone;
  final int bookingStatus;
  final int totalRoomRate;
  final int totalPayment;
  final int advanceDeposit;
  final String timeBookingStart;
  final String timeBookingEnd;

  OrderRoomBooked({
    this.id,
    this.name,
    this.phone,
    this.bookingStatus,
    this.totalRoomRate,
    this.totalPayment,
    this.advanceDeposit,
    this.timeBookingStart,
    this.timeBookingEnd,
  });
  factory OrderRoomBooked.fromJson(Map<String, dynamic> json) {
    return OrderRoomBooked(
        id: json['id'],
        name: json['fullName'],
        phone: json['phone'],
        bookingStatus: json['bookingStatus'],
        totalPayment: json['totalPayment'],
        totalRoomRate: json['totalRoomRate'],
        advanceDeposit: json['advanceDeposit'],
        timeBookingStart: json['timeBookingStart'],
        timeBookingEnd: json['timeBookingEnd']);
  }
}
