import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'history.model.dart';

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
