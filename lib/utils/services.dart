import 'package:estation/screens/admin/admin_home_screen.dart';
import 'package:estation/screens/pompiste/home_page.dart';
import 'package:estation/utils/models/User.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_session_manager/flutter_session_manager.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../screens/login_screen.dart';

Future<Widget> initWidget() async {
  Widget mainPage =LoginScreen();
  bool? loggedIn = await SessionManager().get("loggedin");
  if (loggedIn != null && loggedIn) {
    await getUserFromMemory()!.then((value) {
      if(value.profile!.nom == "ADMIN"){
        mainPage = const AdminHomeScreen();
      }else if(value.profile!.nom == "USER"){
        mainPage = const HomePageScreen();
      }else{
        mainPage = const LoginScreen();
      }
    });
  } else
  mainPage = const LoginScreen();

  return mainPage;
}

Future<User>? getUserFromMemory() async { 
  return User.fromJson(await SessionManager().get("user"));
}
 logout() async {
    await SessionManager().set("loggedin", false);
    await SessionManager().set("token", "");
    await SessionManager().set("user", "");
    Get.offAll(() => const LoginScreen());
  }
