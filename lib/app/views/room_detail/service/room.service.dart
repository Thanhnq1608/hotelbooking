import 'dart:convert';

import 'package:hotelbooking/app/views/room_detail/service/room.detail.model.dart';
import 'package:http/http.dart' as http;

Future<RoomDetailModel> getRoomDetail(String id) async {
  final url = "https://datphongkhachsan.herokuapp.com/roomDetail/$id";
  final http.Client client = http.Client();
  final response = await client.get(Uri.parse(url));
  try {
    if ((response.statusCode - 200) < 100) {
      return RoomDetailModel.fromJson(jsonDecode(response.body));
    }
  } catch (e) {}
}
