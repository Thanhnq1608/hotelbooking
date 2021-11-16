import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:hotelbooking/model/user.dart';

class ManageProfileController extends GetxController {
  ManageProfileController({User user}) : user = Rx<User>(user);
  Rx<User> user;

  var fullnameController,
      phoneNumberController,
      emailController,
      dateOfBirthController,
      addressController;

  @override
  void onInit() {
    fullnameController = TextEditingController(text: user.value.fullname);
    phoneNumberController = TextEditingController(text: user.value.phone);
    emailController = TextEditingController(text: user.value.email);
    dateOfBirthController =
        TextEditingController(text: user.value.dateOfBirth.toString());
    addressController = TextEditingController(text: user.value.address);
    super.onInit();
  }
}
