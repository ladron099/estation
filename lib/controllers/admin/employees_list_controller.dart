import 'dart:convert';

import 'package:estation/apiFunctions/auth.dart';
import 'package:estation/apiFunctions/user_dao.dart';
import 'package:estation/utils/models/ListItem.dart';
import 'package:estation/utils/models/User.dart';
import 'package:estation/utils/services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../components/appVars.dart';

class EmployeesListController extends GetxController {
  List<DropdownMenuItem<ListItem>>? dropdownSexeItems;
  ListItem? sexe;
  List<User> users = [];
  RxBool loading = false.obs;
  final List<ListItem> sexeItems = [
    ListItem("0", "Station x"),
    ListItem("1", "Station y"),
  ];

  dropDownMenuChange(value) {
    sexe = value;
  }

  @override
  void onInit() {
    loading.toggle();
    update();
    dropdownSexeItems = buildDropDownMenuItems(sexeItems);
    sexe = dropdownSexeItems![0].value;
    update();
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

    super.onInit();
  }
}
