import 'package:estation/utils/models/User.dart';
import 'package:estation/utils/services.dart';
import 'package:get/get.dart';

class HomePageController extends GetxController {
  User? user;
  String test = "john";
  RxBool loading = false.obs;

  @override
  void onInit() async {
    loading.toggle();
    update();
    await getUserFromMemory()!.then((value) {
      user = value;
      update();
    });
    loading.toggle();
    update();
    // TODO: implement onInit
    super.onInit();
  }
}
