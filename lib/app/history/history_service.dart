import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:hotelbooking/app/views/room_detail/service/room.detail.model.dart';
import 'package:http/http.dart' as http;
import 'history.model.dart';
import 'package:async/async.dart';
Future<List<HistoryModel>> getHistoryRoom(String phone) async {
  final url =
      "https://datphongkhachsan.herokuapp.com/orderRoomBooked/phone/$phone";
  final http.Client client = http.Client();
  final response = await client.get(Uri.parse(url));
  try {
    if ((response.statusCode - 200) < 100) {
      return compute(parsePhotos, response.body);
    }
  } catch (e) {}
}

List<HistoryModel> parsePhotos(String responseBody) {
  final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();

  return parsed.map<HistoryModel>((json) => HistoryModel.fromJson(json)).toList();
}
// 
Future<List<HistoryRoom>> getRoomBooked({String id}) async {
  final url =
      "https://datphongkhachsan.herokuapp.com/oderRoomBookingDetail/$id";
  final http.Client client = http.Client();
  final response = await client.get(Uri.parse(url));
  try {
    if ((response.statusCode - 200) < 100) {
      return compute(parseRoomBooked, response.body);
    }
  } catch (e) {}
}

List<HistoryRoom> parseRoomBooked(String responseBody) {
  final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();

  return parsed.map<HistoryRoom>((json) => HistoryRoom.fromJson(json)).toList();
}

// 
Future<List<RoomDetailModel>> getIDRoomBooking(String id) async {
  final url =
      "https://datphongkhachsan.herokuapp.com/roomDetail/idBooking/$id";
  final http.Client client = http.Client();
  final response = await client.get(Uri.parse(url));
  try {
    if ((response.statusCode - 200) < 100) {
      return compute(parseIdRoomBooking, response.body);
    }
  } catch (e) {}
}

List<RoomDetailModel> parseIdRoomBooking(String responseBody) {
  final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();

  return parsed.map<RoomDetailModel>((json) => RoomDetailModel.fromJson(json)).toList();
}


Future<Result<bool>> deleteOrder({String id}) async {
  final url =
      "https://datphongkhachsan.herokuapp.com/orderRoomBooked/delete/$id";
  final http.Client client = http.Client();
  final response = await client.post(Uri.parse(url));
  try {
    if ((response.statusCode - 200) < 100) {
      return Result.value(true);
    }
  } catch (e) {}
}
