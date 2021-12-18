import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:hotelbooking/app/list_room_empty/picture.model.dart';
import 'package:hotelbooking/app/views/room_detail/service/room.detail.model.dart';
import 'package:http/http.dart' as http;

Future<List<RoomDetailModel>> getListRoom() async {
  final url = "https://datphongkhachsan.herokuapp.com/roomDetail/all";
  final http.Client client = http.Client();
  final response = await client.get(Uri.parse(url));
  try {
    if ((response.statusCode ==200)) {
      return compute(parseListRoom, response.body);
    }else{
      print('object');
    }
  } catch (e) {}
}

List<RoomDetailModel> parseListRoom(String responseBody) {
  final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();

  return parsed
      .map<RoomDetailModel>((json) => RoomDetailModel.fromJson(json))
      .toList();
}

Future<Picture> getPictureRoom(int price) async {
  final url = "https://datphongkhachsan.herokuapp.com/api/v1/pictureOfRoom/getPrice/$price";
  final http.Client client = http.Client();
  final response = await client.get(Uri.parse(url));
  try {
    if ((response.statusCode - 200) < 100) {
      return Picture.fromJson(jsonDecode(response.body));
    }
  } catch (e) {}
}
