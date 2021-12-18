class RoomDetailModel {
  String id;
  String idRoom;
  String roomName;
  int maximumNumberOfPeople;
  int roomStatus;
  int idKindOfRoom;
  int roomPrice;
  String createdAt;
  String updatedAt;
  int iV;
  String idBooking;

  RoomDetailModel(
      {this.id,
      this.idRoom,
      this.roomName,
      this.maximumNumberOfPeople,
      this.roomStatus,
      this.idKindOfRoom,
      this.roomPrice,
      this.createdAt,
      this.updatedAt,
      this.iV,
      this.idBooking});

  RoomDetailModel.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    idRoom = json['idRoom'];
    roomName = json['roomName'];
    maximumNumberOfPeople = json['maximumNumberOfPeople'];
    roomStatus = json['roomStatus'];
    idKindOfRoom = json['idKindOfRoom'];
    roomPrice = json['roomPrice'];
    createdAt = json['created_at'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
    idBooking = json['idBooking'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.id;
    data['idRoom'] = this.idRoom;
    data['roomName'] = this.roomName;
    data['maximumNumberOfPeople'] = this.maximumNumberOfPeople;
    data['roomStatus'] = this.roomStatus;
    data['idKindOfRoom'] = this.idKindOfRoom;
    data['roomPrice'] = this.roomPrice;
    data['created_at'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    data['idBooking'] = this.idBooking;
    return data;
  }
}
