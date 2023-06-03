import 'dart:convert';

import 'package:estation/apiFunctions/auth.dart';
import 'package:estation/utils/models/User.dart';
import 'package:estation/utils/models/station.dart';
import 'package:estation/utils/services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../apiFunctions/station_dao.dart';

class EmployeesListController extends GetxController {
  List<DropdownMenuItem<Station>>? dropdownItems;
  Station? selectedStation;
  List<Station> stations = [];
  RxBool loading = false.obs;
  List<User> users = [];
  dropDownMenuChange(value) {
    users.clear();
    selectedStation = value;
    loading.value = true;
    update();
    StationDao.getUsersStation(value.id).then((value) { 
      switch (value.statusCode) {
        case 200:
          for (var element in json.decode(value.body)) {
            users.add(User.fromJson(element));
            update();
          }
          loading.value = false;
          update();
          // loading.toggle();
          // update();
          break;
        case 401:
          Auth().refreshToken().then((value) {
            StationDao.getUsersStation(value).then((value) {
              switch (value.statusCode) {
                case 200:
                  for (var element in json.decode(value.body)) {
                    users.add(User.fromJson(element));
                    update();
                  }
                  loading.value = false;
                  update();
                  break;
                default:
                  loading.value = false;
                  update();
              }
            });
          });
          break;
        default:
          loading.value = false;
          update();
      }
    });
    update();
  }

  @override
  void onInit() {
    loading.value = true;
    update();

    StationDao.getStations().then((value) { 
      switch (value.statusCode) {
        case 200:
          for (var element in json.decode(value.body)) {
            stations.add(Station.fromJson(element));
            update();
          }
          dropdownItems = buildDropDownMenuItems(stations);
          selectedStation = dropdownItems![0].value;
          dropDownMenuChange(selectedStation);
          loading.value = false;
          update();
          break;
        case 404:
          loading.value = false;
          update();
          break;
        case 401:
          Auth().refreshToken().then((value) {
            StationDao.getStations().then((value) {
              switch (value.statusCode) {
                case 200:
                  for (var element in json.decode(value.body)) {
                    stations.add(Station.fromJson(element));

                    dropdownItems = buildDropDownMenuItems(stations);
                    selectedStation = dropdownItems![0].value;
                    dropDownMenuChange(selectedStation);
                    update();
                  }
                  loading.value = false;
                  update();
                  break;
                default:
              }
            });
          });
          break;
        default:
      }
    });

    super.onInit();
  }
}
