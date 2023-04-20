import 'package:carousel_slider/carousel_controller.dart';
import 'package:estation/utils/models/User.dart';
import 'package:estation/utils/services.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class AdminHomeController extends GetxController {
  int currentIndex = 0;
  CarouselController carouselController = CarouselController();
  User? user;
  RxBool loading = false.obs;
  changeIndex(index, reason) {
    currentIndex = index;
    carouselController.animateToPage(index);
    update();
    print(reason);
  }

  @override
  void onInit() {
    loading.toggle();
    update();
    // TODO: implement onInit
    getUserFromMemory()!.then((value) {
      user = value;
      loading.toggle();
      update();
    });

    super.onInit();                                                                                                                                                                
  }
}
