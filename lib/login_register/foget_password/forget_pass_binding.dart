import 'package:get/get.dart';
import 'package:hotelbooking/login_register/foget_password/foget_pass_controller.dart';

class ForgetPassBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put(ForgetPassController());
  }
}
