import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotelbooking/app/list_room_empty/list_room_controller.dart';
import 'package:hotelbooking/app/list_room_empty/list_room_service.dart';
import 'package:hotelbooking/app/list_room_empty/picture.model.dart';
import 'package:hotelbooking/app/views/room_detail/bindings/room_detail_binding.dart';
import 'package:hotelbooking/app/views/room_detail/service/room.detail.model.dart';
import 'package:hotelbooking/app/views/room_detail/views/room_detail_view.dart';
import 'package:hotelbooking/tools/format.dart';
import 'bottomBook.dart';

class ListRoomView extends StatefulWidget {
  final String type;

  ListRoomView({this.type});

  @override
  _ListRoomViewState createState() => _ListRoomViewState();
}

class _ListRoomViewState extends State<ListRoomView> {
  var controller = Get.put(ListRoomController());
  List<RoomDetailModel> listRoomEmptys;
  var color = Colors.white;
  var seclectRoom = false;
  var listsRoomId = <dynamic>[];
  final listsRoomPrice = <dynamic>[];
  var listsImage = <dynamic>[];
  Widget _appBar(BuildContext context) {
    return AppBar(
      backgroundColor: Theme.of(context).primaryColor,
      title: const Text(
        'Danh sách phòng',
        style: TextStyle(color: Colors.white),
      ),
      actions: [
        IconButton(
          icon: Icon(Icons.filter_list),
          onPressed: () => _showBottomDialog(context),
        ),
      ],
    );
  }

  void _showBottomDialog(BuildContext context) {
    Get.bottomSheet(Container(
      height: 100,
      padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.1,
          vertical: MediaQuery.of(context).size.height * 0.02),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20))),
      child: Obx(
        () => Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              child: Row(
                children: [
                  Icon(
                    controller
                        .changeIconWhileClick(controller.isSortByPrice.value),
                    size: 20,
                  ),
                  Padding(padding: EdgeInsets.all(10)),
                  Text(
                    'Sắp xếp theo giá phòng',
                    style: TextStyle(fontSize: 20),
                  )
                ],
              ),
              onTap: () {
                controller.isSortByPrice.value = true;
                controller.isSortByNumber.value = false;
                controller.isSortByKindOfRoom.value = false;
                controller.onClicktoSort(listRoomEmptys);
              },
            ),
            InkWell(
              child: Row(
                children: [
                  Icon(
                    controller
                        .changeIconWhileClick(controller.isSortByNumber.value),
                    size: 20,
                  ),
                  Padding(padding: EdgeInsets.all(10)),
                  Text(
                    'Săp xếp theo số lượng người',
                    style: TextStyle(fontSize: 20),
                  )
                ],
              ),
              onTap: () {
                controller.isSortByPrice.value = false;
                controller.isSortByKindOfRoom.value = false;
                controller.isSortByNumber.value = true;
                controller.onClicktoSort(listRoomEmptys);
              },
            ),
          ],
        ),
      ),
    ));
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    setState(() {
      // ignore: unnecessary_statements
      listRoomEmptys;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(context),
      body: Column(
        children: [
          Expanded(
            child: Container(
              margin: EdgeInsets.only(top: 10),
              alignment: Alignment.topCenter,
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                children: [
                  Expanded(
                      child: RefreshIndicator(
                    onRefresh: () {
                      return Future.delayed(Duration(seconds: 1), () {
                        setState(() {
                          ListRoomView();
                        });
                      });
                    },
                    child: FutureBuilder<List<RoomDetailModel>>(
                        future: getListRoom(),
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            listRoomEmptys = snapshot.data
                                .where((element) => element.roomStatus == 0)
                                .toList()
                                .obs;
                            return Obx(() => ListView.builder(
                                itemCount: listRoomEmptys.length,
                                itemBuilder: (context, index) {
                                  final alreadySaved = listsRoomId
                                      .contains(listRoomEmptys[index].id);
                                  return Container(
                                    height: 300,
                                    padding: EdgeInsets.zero,
                                    margin: EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                      boxShadow: [
                                        BoxShadow(
                                            color: Colors.black45,
                                            blurRadius: 5,
                                            offset: Offset(2, 2),
                                            spreadRadius: 2)
                                      ],
                                      color: listsRoomId.contains(
                                              listRoomEmptys[index].id)
                                          ? Colors.grey
                                          : Colors.white,
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(20)),
                                    ),
                                    child: InkWell(
                                      child: Column(
                                        children: [
                                          Expanded(
                                            child: FutureBuilder<Picture>(
                                              future: getPictureRoom(
                                                  listRoomEmptys[index]
                                                      .roomPrice),
                                              builder: (context, snapshot1) {
                                                if (snapshot1.connectionState !=
                                                    ConnectionState.done) {
                                                  return Container(
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius.only(
                                                                topLeft:
                                                                    Radius
                                                                        .circular(
                                                                            20),
                                                                topRight: Radius
                                                                    .circular(
                                                                        20)),
                                                        image:
                                                            DecorationImage(
                                                                image: controller
                                                                    .imageRoom
                                                                    .value,
                                                                fit: BoxFit
                                                                    .fill)),
                                                  );
                                                } else {
                                                  if (snapshot1.hasError) {
                                                    return Text('error');
                                                  } else {
                                                    if (snapshot1.hasData) {
                                                      listsImage = snapshot1
                                                          .data.data.picture;
                                                      return Container(
                                                        decoration: BoxDecoration(
                                                            borderRadius: BorderRadius.only(
                                                                topLeft: Radius
                                                                    .circular(
                                                                        20),
                                                                topRight: Radius
                                                                    .circular(
                                                                        20)),
                                                            image: DecorationImage(
                                                                image: NetworkImage(snapshot1
                                                                    .data
                                                                    .data
                                                                    .picture[0]
                                                                    .toString()),
                                                                fit: BoxFit
                                                                    .cover)),
                                                      );
                                                    } else {
                                                      return Text("No DAta");
                                                    }
                                                  }
                                                }
                                              },
                                            ),
                                          ),
                                          Container(
                                            height: 100,
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 10, vertical: 10),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      '${listRoomEmptys[index].roomName}',
                                                      style: TextStyle(
                                                          fontSize: 20,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                    Container(
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .end,
                                                        children: [
                                                          Icon(Icons.person),
                                                          Text(
                                                              ' ${listRoomEmptys[index].maximumNumberOfPeople} người/phòng'),
                                                          Container(
                                                            margin:
                                                                EdgeInsets.only(
                                                                    left: 100),
                                                            alignment: Alignment
                                                                .centerRight,
                                                            child: Text(
                                                              '${MoneyUtility.formatCurrency(listRoomEmptys[index].roomPrice)}',
                                                              style: TextStyle(
                                                                  fontSize: 25,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Row(
                                                      children: [
                                                        Icon(Icons
                                                            .airline_seat_flat_sharp),
                                                        Text(' 1 giường cỡ lớn')
                                                      ],
                                                    )
                                                  ],
                                                ),
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                      onTap: () {
                                        if (widget.type ==
                                            'book multiple rooms') {
                                          print(index);
                                          setState(() {
                                            if (alreadySaved) {
                                              listsRoomId.remove(
                                                  listRoomEmptys[index].id);
                                              listsRoomPrice.remove(
                                                  listRoomEmptys[index]
                                                      .roomPrice
                                                      .toString());
                                            } else {
                                              listsRoomId.add(
                                                listRoomEmptys[index].id,
                                              );
                                              listsRoomPrice.add(
                                                  listRoomEmptys[index]
                                                      .roomPrice
                                                      .toString());
                                            }
                                          });
                                        } else {
                                          Get.to(
                                              () => RoomDetailView(
                                                    imageList: listsImage,
                                                    idRoom:
                                                        listRoomEmptys[index]
                                                            .id,
                                                    nameRoom:
                                                        listRoomEmptys[index]
                                                            .roomName,
                                                  ),
                                              binding: RoomDetailBinding());
                                        }
                                      },
                                    ),
                                  );
                                }));
                          }
                          return Container(
                              child: Center(
                                  child: Image.asset(
                                      'assets/images/loading.gif')));
                        }),
                  )),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: widget.type == 'book multiple rooms' &&
              listsRoomPrice.isNotEmpty &&
              listsRoomId.isNotEmpty
          ? BottomRoomBook(
              listsRoom: listsRoomPrice,
              listsIdRoom: listsRoomId,
            )
          : null,
    );
  }
}
