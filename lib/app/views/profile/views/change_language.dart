import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:hotelbooking/app/views/profile/controller/profile_controller.dart';

class ChangeLangage extends GetView<ProfileController> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.3,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20)),
          color: Colors.white),
      child: Obx(
        () => Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              'Language',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            InkWell(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Vietnamese',
                    style: TextStyle(fontSize: 17),
                  ),
                  Icon(controller.isVietnamese().value)
                ],
              ),
              onTap: () {
                controller.language.value = false;
                Get.close(1);
              },
            ),
            InkWell(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'English',
                    style: TextStyle(fontSize: 17),
                  ),
                  Icon(controller.isEnglish().value)
                ],
              ),
              onTap: () {
                controller.language.value = true;
                Get.close(1);
              },
            )
          ],
        ),
      ),
    );
  }
}
