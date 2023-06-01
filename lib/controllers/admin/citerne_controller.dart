import 'package:get/get.dart';
import 'dart:convert';

import 'package:estation/apiFunctions/auth.dart';
import 'package:estation/utils/models/station.dart';
import 'package:estation/utils/services.dart';
import 'package:flutter/material.dart';

import '../../apiFunctions/station_dao.dart';

class CiterneController extends GetxController {
  List<DropdownMenuItem<Station>>? dropdownItems;
  Station? selectedStation;
  List<Station> stations = [];
  RxBool loading = false.obs;

  dropDownMenuChange(value) {
    selectedStation = value;
  }

  @override
  void onInit() {
    loading.toggle();
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
          update();
          loading.toggle();
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
                    update();
                  }
                  loading.toggle();
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
