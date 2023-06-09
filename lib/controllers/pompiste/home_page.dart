import 'dart:convert';

import 'package:estation/controllers/pompiste/scan_controller.dart';
import 'package:estation/screens/pompiste/scan_info.dart';
import 'package:estation/utils/models/User.dart';
import 'package:estation/utils/models/pompe_user.dart';
import 'package:estation/utils/services.dart';
import 'package:get/get.dart';

import '../../apiFunctions/auth.dart';
import '../../apiFunctions/user_dao.dart';

class HomePageController extends GetxController {
  User? user;
  String test = "john";
  RxBool loading = false.obs;
  List<Pompeuser> myPompes = [];

  getMyPompes() async {
    myPompes.clear();
    loading.value = true;
    update();
    await UserDao.getPomptes(user!.idUser).then((value) {
      switch (value.statusCode) {
        case 200:
          for (var element in json.decode(value.body)) {
            myPompes.add(Pompeuser.fromJson(element));
            update();
          }
          loading.toggle();
          update();
          break;
        case 404:
          loading.toggle();
          update();

          break;

        case 400:
          Auth().refreshToken().then((value) {
            if (value.statusCode == 200) {
              UserDao.getPomptes(user!.idUser).then((value) {
                switch (value.statusCode) {
                  case 200:
                    for (var element in json.decode(value.body)) {
                      myPompes.add(Pompeuser.fromJson(element));
                      update();
                    }
                    loading.toggle();
                    update();
                    break;
                  case 404:
                    loading.toggle();
                    update();

                    break;

                  default:
                    loading.toggle();
                    update();
                }
              });
            } else {
              simpleLogout();
              loading.toggle();
              update();
            }
          });
          break;

        default:
          loading.toggle();
          update();
      }
    });

    loading.toggle();
    update();
  }

  @override
  void onInit() async {
    user = User();
    loading.toggle();
    update();
    await getUserFromMemory()!.then((value) async {
      user = value;
      update();
      await getMyPompes();
      loading.toggle();
      update();
    });

    // TODO: implement onInit
    super.onInit();
  }

  void changeData(Pompeuser myPomp) {
    final scanController = Get.put(ScanController());
    scanController.pompeUser = myPomp.idPompeUser!;
    scanController.update();
    Get.to(() => const ScanInfoScreen(),
        transition: Transition.rightToLeftWithFade,
        duration: const Duration(milliseconds: 500));
    Get.delete<HomePageController>();
  }
}
