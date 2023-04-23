import 'package:estation/screens/admin/admin_home_screen.dart';
import 'package:estation/screens/pompiste/home_page.dart';
import 'package:estation/utils/models/ListItem.dart';
import 'package:estation/utils/models/User.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_session_manager/flutter_session_manager.dart';
import 'package:get/get.dart';

import '../screens/login_screen.dart';

Future<Widget> initWidget() async {
  Widget mainPage = const LoginScreen();
  bool? loggedIn = await SessionManager().get("loggedin");
  if (loggedIn != null && loggedIn) {
    await getUserFromMemory()!.then((value) {
      if (value.profile!.nom == "ADMIN") {
        mainPage = const AdminHomeScreen();
      } else if (value.profile!.nom == "USER") {
        mainPage = const HomePageScreen();
      } else {
        mainPage = const LoginScreen();
      }
    });
  } else {
    mainPage = const LoginScreen();
  }

  return mainPage;
}

Future<User>? getUserFromMemory() async {
  return User.fromJson(await SessionManager().get("user"));
}

logout() async {
  Get.defaultDialog(
      title: 'Logout',
      contentPadding: EdgeInsets.all(20.w),
      titlePadding: EdgeInsets.only(top: 20.w),
      middleText: "Are you sure you want to logout?",
      textConfirm: "Yes",
      textCancel: "No",
      titleStyle: TextStyle(
          color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20.sp),
      onConfirm: () async {
        await SessionManager().set("loggedin", false);
        await SessionManager().set("token", "");
        await SessionManager().set("user", "");
        Get.offAll(() => const LoginScreen());
      });
}

List<DropdownMenuItem<ListItem>>? buildDropDownMenuItems(List listItems) {
  List<DropdownMenuItem<ListItem>>? items = [];
  for (ListItem listItem in listItems) {
    items.add(
      DropdownMenuItem(
        value: listItem,
        child: Text(listItem.name),
      ),
    );
  }
  return items;
}
