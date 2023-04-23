import 'package:estation/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../components/appVars.dart';

class ForgetPasswordController extends GetxController{
  
  TextEditingController emailController = TextEditingController(); 

  var backgroundColor = Colors.transparent;

  var colors = [
    primaryColor,
    primaryColor.withOpacity(0.6),
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
        Get.snackbar('Success', 'Verification succeeded');
        Get.to(() => const LoginScreen(),
            transition: Transition.fadeIn,
            duration: const Duration(milliseconds: 500));
      }
    });
  }
}