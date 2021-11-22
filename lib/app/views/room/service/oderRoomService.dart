import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:hotelbooking/app/views/room/service/orderroom.model.dart';
import 'package:dio/dio.dart';
import 'package:async/async.dart';

Future<Result<OrderRoomBooked>> postOderRoom(payload) async {
  try {
    final url = 'https://datphongkhachsan.herokuapp.com/orderRoomBooked/create';
    // final response = await Dio().post(url, data: payload);
    print(payload);
    // if (response.statusCode - 200 < 100) {
    //   var data =
    //       response.data is Map ? response.data : json.decode(response.data);
    //   return Result.value(OrderRoomBooked.fromJson(data));
    // } else if (response.statusCode == 400) {
    //   return Result.error('Lỗi không xác định. Vui lòng thử lại!');
    // }
  } on DioError catch (e) {
    return Result.error('Lỗi không xác định. Vui lòng thử lại!');
  }
}
