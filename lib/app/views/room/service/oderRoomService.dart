import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:hotelbooking/app/views/room/service/orderroom.model.dart';
import 'package:dio/dio.dart';
import 'package:async/async.dart';

Future<Result<OrderRoomBooked>> postOderRoom(
  payload, {
  String timeBookingStart,
  String timeBookingEnd,
  int totalRoomRate,
  String advanceDeposit,
}) async {
  try {
    final url = 'https://datphongkhachsan.herokuapp.com/orderRoomBooked/create';
    print(payload);
    final response = await http.post(Uri.parse(url),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(payload));
    if (response.statusCode == 200) {
      var data =
          response.body is Map ? response.body : json.decode(response.body);
      print('object ${response.body}');
      return Result.value(OrderRoomBooked.fromJson(data));
    } else if (response.statusCode == 400) {
      return Result.error('Lỗi không xác định. Vui lòng thử lại!');
    }
  } on DioError catch (e) {
    print('11111');
    return Result.error('Lỗi không xác định. Vui lòng thử lại!');
  }
}

Future<Result<bool>> updateRoomStatus(payload, {String idRoom}) async {
  try {
    final url =
        'https://datphongkhachsan.herokuapp.com/roomDetail/update/$idRoom';
    final response = await Dio().put(url, data: payload);
    print(payload);
    print(url);
    if (response.statusCode - 200 < 100) {
      return Result.value(true);
    } else if (response.statusCode - 200 > 100) {
      return Result.error('Lỗi không xác định. Vui lòng thử lại!');
    }
  } on DioError catch (e) {
    return Result.error('Lỗi không xác định. Vui lòng thử lại!');
  }
}

Future<Result<bool>> updateOderRoom(payload,{String id}) async {
  try {
    final url = 'https://datphongkhachsan.herokuapp.com/orderRoomBooked/update/$id';
    print(payload);
    print(id);
    final response = await http.post(Uri.parse(url),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(payload));
    if (response.statusCode == 200) {
      print('object ${response.body}');
      return Result.value(true);
    } else if (response.statusCode == 400) {
      return Result.error('Lỗi không xác định. Vui lòng thử lại!');
    }
  } on DioError catch (e) {
    print('11111');
    return Result.error('Lỗi không xác định. Vui lòng thử lại!');
  }
}
