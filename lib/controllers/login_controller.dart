import 'dart:async';

import 'package:estation/apiFunctions/auth.dart';
import 'package:estation/components/appVars.dart';
import 'package:estation/screens/home_page.dart';
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
        Timer(Duration(seconds: 1), () {
        auth
            .login(emailController.text.trim(), passwordController.text)
            .then((value) {
          if (value.statusCode == 200) {
            SessionManager().set("loggedin", true);
            Get.offAll(() => const HomePageScreen());
          } else {
            print(value.statusCode);
            Get.snackbar('Error', 'Invalid email or password',
                colorText: Colors.white, backgroundColor: dangerColor);
          }
        });
        loading.toggle();
        update();
        });
      }
    });
  }
}
