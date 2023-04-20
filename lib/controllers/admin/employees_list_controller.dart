import 'package:estation/utils/models/ListItem.dart';
import 'package:estation/utils/services.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class EmployeesListController extends GetxController {
  List<DropdownMenuItem<ListItem>>? dropdownSexeItems;
  ListItem? sexe;
  final List<ListItem> sexeItems = [
    ListItem("0", "Station x"),
    ListItem("1", "Station y"),
  ];

  dropDownMenuChange(value) {
    sexe = value;
  }

  @override
  void onInit() {
    dropdownSexeItems = buildDropDownMenuItems(sexeItems);
    sexe = dropdownSexeItems![0].value;
    update();

    super.onInit();
  }
}
