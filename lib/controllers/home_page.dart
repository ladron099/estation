import 'package:estation/screens/home_page.dart';
import 'package:estation/screens/login_screen.dart';
import 'package:flutter_session_manager/flutter_session_manager.dart';
import 'package:get/get.dart';

class HomePageController extends GetxController {
  String test = "john";
  logout() async {
    await SessionManager().set("loggedin", false);
    // await SessionManager().set("token", "");
    Get.offAll(() => const LoginScreen());
  }
}
