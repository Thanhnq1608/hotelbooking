import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:hotelbooking/app/views/list_room_empty/controller/list_room_controller.dart';

class ListRoomView extends GetView<ListRoomController> {
  var _textEditingController = TextEditingController();
  Widget _appBar(BuildContext context) {
    return AppBar(
      backgroundColor: Theme.of(context).primaryColor,
      leading: IconButton(
        icon: Icon(
          Icons.arrow_back,
          color: Colors.white,
        ),
        onPressed: () => Get.back(),
      ),
      title: const Text(
        'Room',
        style: TextStyle(color: Colors.white),
      ),
    );
  }

  void _showBottomDialog(BuildContext context) {
    Get.bottomSheet(Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.25,
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
                    'Sort by price',
                    style: TextStyle(fontSize: 20),
                  )
                ],
              ),
              onTap: () {
                controller.isSortByPrice.value = true;
                controller.onClicktoSort();
              },
            ),
            InkWell(
              child: Row(
                children: [
                  Icon(
                    controller.changeIconWhileClick(
                        controller.isSortByKindOfRoom.value),
                    size: 20,
                  ),
                  Padding(padding: EdgeInsets.all(10)),
                  Text(
                    'Sort by kind of room',
                    style: TextStyle(fontSize: 20),
                  )
                ],
              ),
              onTap: () {
                controller.isSortByKindOfRoom.value = true;
                controller.onClicktoSort();
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
                    'Sort by number of people',
                    style: TextStyle(fontSize: 20),
                  )
                ],
              ),
              onTap: () {
                controller.isSortByNumber.value = true;
                controller.onClicktoSort();
              },
            ),
          ],
        ),
      ),
    ));
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: _appBar(context),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        alignment: Alignment.topCenter,
        padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.05),
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 10),
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.05,
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black54,
                                blurRadius: 10,
                                spreadRadius: 2,
                                offset: Offset(2, 2))
                          ]),
                      child: Row(
                        children: [
                          IconButton(
                              padding: EdgeInsets.zero,
                              icon: Icon(
                                Icons.youtube_searched_for_outlined,
                                size: 20,
                              ),
                              onPressed: () {}),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.55,
                            height: double.infinity,
                            alignment: Alignment.topLeft,
                            child: TextField(
                              textAlignVertical: TextAlignVertical.top,
                              textAlign: TextAlign.start,
                              style: TextStyle(fontSize: 20),
                              controller: _textEditingController,
                              onChanged: ((val) {}),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Padding(padding: EdgeInsets.all(5)),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.1,
                    height: double.infinity,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black54,
                              spreadRadius: 1,
                              offset: Offset(2, 2),
                              blurRadius: 4)
                        ]),
                    child: IconButton(
                        icon: Icon(Icons.format_line_spacing_rounded),
                        onPressed: () {
                          _showBottomDialog(context);
                        }),
                  )
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: ListView.builder(
                  itemCount: 4,
                  itemBuilder: (context, index) {
                    return Container(
                      padding: EdgeInsets.zero,
                      margin: EdgeInsets.only(top: 20),
                      width: MediaQuery.of(context).size.width * 0.7,
                      height: MediaQuery.of(context).size.height * 0.4,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(20),
                              bottomLeft: Radius.circular(20)),
                          border: Border.all(
                              width: 1.0,
                              color: Colors.black54,
                              style: BorderStyle.solid)),
                      child: InkWell(
                        child: Column(
                          children: [
                            Obx(
                              () => Expanded(
                                child: Image.network(
                                  controller.linkImageRoom.value,
                                  fit: BoxFit.fill,
                                  width: double.infinity,
                                ),
                              ),
                            ),
                            Container(
                              width: double.infinity,
                              height: MediaQuery.of(context).size.height * 0.1,
                              padding: EdgeInsets.symmetric(horizontal: 5),
                              child: Row(
                                children: [Column(), Container()],
                              ),
                            )
                          ],
                        ),
                        onTap: () {
                          Get.toNamed('/room_detail');
                        },
                      ),
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}
