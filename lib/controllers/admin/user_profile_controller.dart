import 'package:estation/utils/models/User.dart';
import 'package:get/get.dart';

class UserProfileController extends GetxController {
  User user = User();

  @override
  void onInit() {
    user = Get.arguments;

    super.onInit();
  }
}
