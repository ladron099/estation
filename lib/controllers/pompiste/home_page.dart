import 'package:estation/screens/login_screen.dart';
import 'package:estation/utils/models/User.dart';
import 'package:estation/utils/services.dart';
import 'package:flutter_session_manager/flutter_session_manager.dart';
import 'package:get/get.dart';

class HomePageController extends GetxController {
  User? user;
  String test = "john";
  RxBool loading = false.obs;
  logout() async {
    await SessionManager().set("loggedin", false);
    await SessionManager().set("token", "");
    await SessionManager().set("user", "");
    Get.offAll(() => const LoginScreen());
  }

  @override
  void onInit() async {
    loading.toggle();
    update();
    await getUserFromMemory()!.then((value) {
      user = value;
      print(user);
      update();
    });
    loading.toggle();
    update();
    // TODO: implement onInit
    super.onInit();
  }
}
