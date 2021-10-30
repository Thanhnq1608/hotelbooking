import 'package:get/state_manager.dart';

class RoomDetailController extends GetxController {
  var isCheckFavorite = false.obs;

  var colorOfButtonFavorite = 'assets/icon/icon_heart_border.png'.obs;

  void onClickOnFavoriteButton() {
    colorOfButtonFavorite.value = 'assets/icon/icon_heart_full.png';
  }
}
