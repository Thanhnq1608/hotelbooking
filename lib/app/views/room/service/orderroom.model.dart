class OrderRoomBooked {
  final String id;
  final String name;
  final String phone;
  final int totalRoomRate;
  final int totalPayment;

  OrderRoomBooked({
    this.id,
    this.name,
    this.phone,
    this.totalRoomRate,
    this.totalPayment,
  });
  factory OrderRoomBooked.fromJson(Map<String, dynamic> json) {
    return OrderRoomBooked(
        id: json['id'],
        name: json['fullName'],
        phone: json['phone'],
        totalPayment: json['totalPayment'],
        totalRoomRate: json['totalRoomRate']);
  }
}
