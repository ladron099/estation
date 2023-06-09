import 'dart:async';
import 'dart:convert';

import 'package:easy_localization/easy_localization.dart';
import 'package:estation/apiFunctions/auth.dart';
import 'package:estation/components/appVars.dart';
import 'package:estation/screens/admin/admin_home_screen.dart';
import 'package:estation/screens/pompiste/home_page.dart';
import 'package:estation/utils/models/User.dart';
import 'package:flutter/material.dart';
import 'package:flutter_session_manager/flutter_session_manager.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  RxBool loading = false.obs;
  Auth auth = Auth();
  var backgroundColor = Colors.transparent;

  var colors = [
    primaryColor,
    primaryColor.withOpacity(0.8),
  ];

  var durations = [
    5000,
    4000,
  ];

  var heightPercentages = [
    0.29,
    0.22,
  ];

  Future<bool> validate() async {
    if (emailController.text.isEmpty) {
      Get.snackbar('Error', 'Email is required',
          colorText: Colors.white, backgroundColor: dangerColor);
      return false;
    }
    if (passwordController.text.isEmpty) {
      Get.snackbar('Error', 'Password is required',
          colorText: Colors.white, backgroundColor: dangerColor);
      return false;
    }
    if (!GetUtils.isEmail(emailController.text.trim())) {
      Get.snackbar('Error', 'Invalid email',
          colorText: Colors.white, backgroundColor: dangerColor);

      return false;
    }
    return true;
  }

  submit() {
    validate().then((value) {
      if (value) {
        loading.toggle();
        update();
        Timer(const Duration(seconds: 1), () {
          auth
              .login(emailController.text.trim().toLowerCase(), passwordController.text)
              .then((value) {
            if (value.statusCode == 200) {
              SessionManager().set("loggedin", true);
              SessionManager().set("token", jsonDecode(value.body)['token']);
              SessionManager()
                  .set("refreshToken", jsonDecode(value.body)['refreshToken']);
              User user = User.fromJson(jsonDecode(value.body)['user']);
              SessionManager().set("user", user);
              if (user.profile!.nom == "ADMIN") {
                loading.toggle();
                update();
                Get.offAll(() => const AdminHomeScreen());
              } else {
                loading.toggle();
                update();
                Get.offAll(() => const HomePageScreen());
              }
            } else {
              Get.snackbar('Error', tr(json.decode(value.body)['msg']),
                  colorText: Colors.white, backgroundColor: dangerColor);
              loading.toggle();
              update();
            }
          });
        });
      }
    });
  }

  @override
  void onInit() {
    emailController.text = "admin@gmail.com";
    passwordController.text = "Yasser123+";
    // TODO: implement onInit
    super.onInit();
  }
}
