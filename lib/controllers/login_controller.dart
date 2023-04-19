import 'dart:async';
import 'dart:convert';

import 'package:easy_localization/easy_localization.dart';
import 'package:estation/apiFunctions/auth.dart';
import 'package:estation/components/appVars.dart';
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
        Timer(Duration(seconds: 1), () {
          auth
              .login(emailController.text.trim(), passwordController.text)
              .then((value) {
            print(value.body);
            if (value.statusCode == 200) {
              SessionManager().set("loggedin", true);
              SessionManager().set("token", jsonDecode(value.body)['token']);
              User user = User.fromJson(jsonDecode(value.body)['user']);
              SessionManager().set("user", user);
              print(user.nom);
              if (user.profile!.nom == "ADMIN") {
                Get.offAll(() => const HomePageScreen());
              } else {
                Get.snackbar('Error', 'You are not an admin',
                    colorText: Colors.white, backgroundColor: dangerColor);
              }
            } else {
              Get.snackbar('Error', tr(json.decode(value.body)['msg']),
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
