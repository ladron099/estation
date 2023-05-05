import 'dart:convert';

import 'package:carousel_slider/carousel_controller.dart';
import 'package:estation/apiFunctions/auth.dart';
import 'package:estation/apiFunctions/station_dao.dart';
import 'package:estation/apiFunctions/user_dao.dart';
import 'package:estation/utils/models/User.dart';
import 'package:estation/utils/services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../components/appVars.dart';

class AdminHomeController extends GetxController {
  int currentIndex = 0;
  CarouselController carouselController = CarouselController();
  User? user;
  List<User> users = [];
  RxBool loading = false.obs;
  changeIndex(index, reason) {
    currentIndex = index;
    carouselController.animateToPage(index);
    update(); 
  }

  @override
  void onInit() {
    loading.toggle();
    update();
    // TODO: implement onInit
    getUserFromMemory()!.then((value) {
      user = value;
      UserDao.getUsers().then((value) {
        if (value.statusCode == 200) {
          for (var element in jsonDecode(value.body)) {
            users.add(User.fromJson(element));
          }
        } else if (value.statusCode == 401) {
          Auth().refreshToken().then((value) {
            UserDao.getUsers().then((value) {
              if (value.statusCode == 200) {
                for (var element in jsonDecode(value.body)) {
                  users.add(User.fromJson(element));
                }
              } else {
                simpleLogout();
              }
            });
          });
        } else {
          Get.snackbar('Error', 'Error while fetching users',
              colorText: Colors.white, backgroundColor: dangerColor);
        }

        loading.toggle();
        update();
      });
    });

    super.onInit();
  }
}
