import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:async/async.dart';
import 'package:http/http.dart' as http;

Future<bool> postNotify(payload) async {
  try {
    final url = 'https://datphongkhachsan.herokuapp.com/orderRoomBooked/create';
    print(payload);
    var headers = {
      'Authorization':
          'key=AAAABHkXnhQ:APA91bF-GoTXyLgDY7m2OS8Wc_BkYOh3MNF-WqpRzDaMEyXk0lliEgICd47_JvsRKQSVsBHgZ_MMQQM6KyyOt0oie09-1k7mg_2-6ZyT90WG8W0UQIcLCjB0u4rjBWCRChdMvSaLFqhw',
      'Content-Type': 'application/json'
    };
    final response = await http.post(Uri.parse(url),
        headers: headers,
        body: jsonEncode(payload));
    if (response.statusCode == 200) {
      print('object ${response.body}');
      return (true);
    } else if (response.statusCode == 400) {
      print('err');
      return false;
    }
  } on DioError catch (e) {
    print('11111');
    return false;
  }
}
