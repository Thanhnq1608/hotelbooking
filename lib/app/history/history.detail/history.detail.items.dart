import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hotelbooking/tools/format.dart';
import 'package:url_launcher/url_launcher.dart';

class HistoryDetailItems extends StatelessWidget {
  HistoryDetailItems({Key key});

  @override
  Widget build(BuildContext context) {
    var roomName;
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin:
                      EdgeInsets.only(left: 16, bottom: 10, top: 20, right: 8),
                  child: Text(
                    '$roomName',
                    style: TextStyle(
                      fontSize: 22,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 3,
                    overflow: TextOverflow.visible,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 25),
                          child: Text(
                            'Loại Phòng:',
                            style: TextStyle(
                              color: Colors.black87,
                              fontSize: 20,
                            ),
                          ),
                        ),
                        Container(
                          width: 10,
                        ),
                        Text(
                          'Vip1',
                          style: TextStyle(
                            color: Colors.black87,
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                    FutureBuilder<DocumentSnapshot>(
                        future: FirebaseFirestore.instance
                            .collection('configs')
                            .doc('contacts')
                            .get(),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.done) {
                            Map<String, dynamic> data =
                                snapshot.data.data() as Map<String, dynamic>;
                            return Row(
                              children: [
                                data['hotLine'] == null || data['hotLine'] == ''
                                    ? Container()
                                    : Container(
                                        margin: EdgeInsets.only(right: 20),
                                        width: 50,
                                        height: 50,
                                        child: RawMaterialButton(
                                            shape: CircleBorder(),
                                            elevation: 5.0,
                                            fillColor: Color(0xFFFF6666),
                                            child: Icon(
                                              Icons.phone,
                                              color: Colors.white,
                                            ),
                                            onPressed: () async {
                                              String link =
                                                  "tel:${data['hotLine']}";
                                              if (link != null &&
                                                  await canLaunch(link
                                                      .replaceAll(' ', ''))) {
                                                launch('$link');
                                              }
                                            }),
                                      ),
                                data['linkMessenger'] == null ||
                                        data['linkMessenger'] == ''
                                    ? Container()
                                    : Container(
                                        margin: EdgeInsets.only(right: 20),
                                        width: 50,
                                        height: 50,
                                        child: RawMaterialButton(
                                            shape: CircleBorder(),
                                            elevation: 5.0,
                                            fillColor: Color(0xFFFF6666),
                                            child: Image.asset(
                                                'assets/images/messenger.png'),
                                            onPressed: () async {
                                              String link =
                                                  "${data['linkMessenger']}";
                                              if (link != null &&
                                                  await canLaunch(link
                                                      .replaceAll(' ', ''))) {
                                                launch('$link');
                                              }
                                            }),
                                      ),
                              ],
                            );
                          }
                          return Container();
                        })
                  ],
                )
              ],
            ),
          ],
        ),
        Container(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  margin: EdgeInsets.only(left: 24),
                  child: Text(
                    '${MoneyUtility.formatCurrency(600000)}',
                    style: TextStyle(
                        color: Color(0xFFFF6666),
                        fontSize: 25,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  child: Text(
                    '/Đêm',
                    style: TextStyle(
                      color: Colors.black87,
                      fontSize: 25,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
