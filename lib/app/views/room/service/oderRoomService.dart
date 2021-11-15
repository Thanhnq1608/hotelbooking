import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:hotelbooking/app/views/room/service/orderroom.model.dart';

Future<OrderRoomBooked> postOderRoom({
  String name,
  int phone,
  int totalRoomRate,
  int totalPayment,
}) async {
  final url = 'https://datphongkhachsan.herokuapp.com/orderRoomBooked/create';
  final http.Client client = http.Client();
  final response = await client.post(
    Uri.parse(url),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, dynamic>{
      "fullName": "Nguyenviettien",
      "phone": 0123456789,
      "totalRoomRate": totalRoomRate,
      // 'totalPayment': totalPayment,
      "timeBooking": "30"
    }),
  );

  try {
    if ((response.statusCode - 200) < 100) {
      print(response.body);
      return OrderRoomBooked.fromJson(jsonDecode(response.body));
    }
  } catch (e) {}
}
