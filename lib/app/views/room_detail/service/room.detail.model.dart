class RoomDetailModel {
  final String id;
  final String roomName;
  final int maximumNumberOfPeople;
  final int roomStatus;
  final int roomPrice;
  final String createdAt;
  final String updateAt;

  RoomDetailModel(
      {this.id,
      this.roomName,
      this.maximumNumberOfPeople,
      this.roomStatus,
      this.roomPrice,
      this.createdAt,
      this.updateAt});

  factory RoomDetailModel.fromJson(Map<String, dynamic> json) {
    return RoomDetailModel(
        id: json['_id'],
        roomName: json['roomName'],
        maximumNumberOfPeople: json['maximumNumberOfPeople'],
        roomStatus: json['roomStatus'],
        roomPrice: json['roomPrice'],
        createdAt: json['created_at'],
        updateAt: json['updatedAt']);
  }
}
