import 'package:estation/utils/models/User.dart';
import 'package:estation/utils/models/product.dart';
import 'package:get/get.dart';
import 'dart:convert';

import 'package:estation/apiFunctions/auth.dart';
import 'package:estation/utils/models/station.dart';
import 'package:estation/utils/services.dart';
import 'package:flutter/material.dart';

import '../../apiFunctions/station_dao.dart';

class ProductListController extends GetxController {
  User? user;
  List<User> users = [];
  List<Station> stations = [];
  List<DropdownMenuItem<Station>>? dropdownItems;
  Station? selectedStation;
  RxBool loading = false.obs;
  List<Product> products = [];

  dropDownMenuChange(value) {
    users.clear();
    products.clear();
    selectedStation = value;
    loading.value = true;
    update();

    StationDao.productByStation(value.id).then((value) {
      switch (value.statusCode) {
        case 200:
          for (int i = 0; i < json.decode(value.body).length; i++) {
            products.add(Product.fromJson(json.decode(value.body)[i]));
          }

          loading.value = false;
          update();

          break;
        case 401:
          Auth().refreshToken().then((value) {
            StationDao.getUsersStation(value).then((value) {
              switch (value.statusCode) {
                case 200:
                  for (int i = 0; i < json.decode(value.body).length; i++) {
                    products.add(Product.fromJson(json.decode(value.body)[i]));
                  }
                  loading.value = false;
                  update();
                  break;
                default:
                  products = [];
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
    getUserFromMemory()!.then((value) {
      user = value;
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

            break;
          case 400:
            Auth().refreshToken().then((value) {
              if (value.statusCode == 200) {
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
                      loading.toggle();
                      update();
                      break;

                    default:
                  }
                });
              } else {
                simpleLogout();
              }
            });
            break;

          case 404:
            stations.clear();
            loading.toggle();
            update();
            break;
          default:
            stations.clear();
            loading.toggle();
            update();
        }
      });
    });

    super.onInit();
  }
}
