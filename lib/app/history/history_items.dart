import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotelbooking/tools/format.dart';
import 'history.model.dart';

class HistoryItems extends StatelessWidget {
  final HistoryModel historyModel;

  HistoryItems({this.historyModel});
  Widget _buildInfor() {
    return Container(
      margin: EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            child: Text(
              historyModel.bookingStatus == 0
                  ? 'Đang xác nhận'
                  : historyModel.bookingStatus == 1
                      ? 'Đã xác nhận'
                      : historyModel.bookingStatus == 2
                          ? 'Đã nhận phòng'
                          : 'Đã trả phòng',
              style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.w500,
                  color: historyModel.bookingStatus == 0
                      ? Colors.black
                      : Colors.white),
            ),
          ),
          Container(
            child: Icon(Icons.info_outline),
          ),
        ],
      ),
    );
  }

  Widget _buildTimeBooking() {
    return Container(
      margin: EdgeInsets.only(left: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(Icons.alarm,
              color: historyModel.bookingStatus == 0
                  ? Colors.black
                  : Colors.white),
          Container(
              child: Text('${historyModel.timeBookingStart}',
                  style: TextStyle(
                      fontSize: 13,
                      color: historyModel.bookingStatus == 0
                          ? Colors.black
                          : Colors.white))),
          Icon(Icons.arrow_forward),
          Container(
              child: Text('${historyModel.timeBookingEnd}',
                  style: TextStyle(
                      fontSize: 13,
                      color: historyModel.bookingStatus == 0
                          ? Colors.black
                          : Colors.white))),
        ],
      ),
    );
  }

  Widget _buildPrice() {
    return Container(
      margin: EdgeInsets.all(16),
      child: Text('${MoneyUtility.formatCurrency(historyModel.totalRoomRate)}',
          style: TextStyle(
            fontSize: 25,
            color:
                historyModel.bookingStatus == 0 ? Colors.black : Colors.white,
            fontWeight: FontWeight.w700,
          )),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: historyModel.bookingStatus == 0
            ? Colors.white
            : historyModel.bookingStatus == 1
                ? Colors.greenAccent
                : historyModel.bookingStatus == 2
                    ? Color(0xFFFF6666)
                    : Colors.red,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          _buildInfor(),
          _buildTimeBooking(),
          _buildPrice(),
        ],
      ),
    );
  }
}
