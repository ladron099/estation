import 'package:estation/components/appVars.dart';
import 'package:estation/screens/home_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

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
        Get.snackbar('Success', 'Login successful',
            colorText: Colors.white, backgroundColor: successColor);
        Get.to(() => HomePageScreen(),
            transition: Transition.fadeIn,
            duration: Duration(milliseconds: 500));
      }
    });
  }
}
