import 'package:estation/utils/models/product.dart';
import 'package:get/get.dart';

class ProductController extends GetxController {
  bool loading = false;
  Product product = Product();
  String stationName = '';

  @override
  void onInit() {
    loading = true;
    update();
    product = Get.arguments[0] ?? Product();
    stationName = Get.arguments[1] ?? '';
    loading = false;
    update();
    // TODO: implement onInit
    super.onInit();
  }
}
