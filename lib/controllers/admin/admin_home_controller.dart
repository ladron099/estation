import 'dart:convert';

import 'package:carousel_slider/carousel_controller.dart';
import 'package:estation/apiFunctions/auth.dart';
import 'package:estation/apiFunctions/station_dao.dart';
import 'package:estation/utils/models/User.dart';
import 'package:estation/utils/models/station.dart';
import 'package:estation/utils/services.dart';
import 'package:get/get.dart';

class AdminHomeController extends GetxController {
  int currentIndex = 0;
  CarouselController carouselController = CarouselController();
  User? user;
  List<User> users = [];
  List<Station> stations = [];
  RxBool loading = false.obs;
  changeIndex(index, reason) {
    currentIndex = index;
    update();
    carouselController.animateToPage(index);
    update();
  }

  @override
  void onInit() {
    loading.toggle();
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
            loading.toggle();
            update();
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
          default:
        }
      });
    });

    super.onInit();
  }
}
