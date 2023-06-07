import 'dart:convert';

import 'package:estation/apiFunctions/user_dao.dart';
import 'package:estation/utils/models/User.dart';
import 'package:estation/utils/models/station.dart';
import 'package:get/get.dart';

import '../../apiFunctions/auth.dart';
import '../../utils/models/releve.dart';

class UserProfileController extends GetxController {
  User user = User();
  Station station = Station();
  bool loading = false;
  Releve releve = Releve();

  @override
  void onInit() {
    loading = true;
    update();
    user = Get.arguments[0];
    station = Get.arguments[1];
    UserDao.getUserDetails(station.id).then((value) {
      switch (value.statusCode) {
        case 200:
          releve = Releve.fromJson(json.decode(value.body));
          update();
          break;
        case 401:
          Auth().refreshToken().then((value) {
            UserDao.getUserDetails(station.id).then((value) {
              switch (value.statusCode) {
                case 200:
                  releve = Releve.fromJson(json.decode(value.body));
                  loading = false;
                  update();
                  break;
                default:
                  releve = Releve();
                  loading = false;
                  update();
              }
            });
          });
          break;
        default:
          break;
      }
      loading = false;
      update();
    });

    super.onInit();
  }
}
