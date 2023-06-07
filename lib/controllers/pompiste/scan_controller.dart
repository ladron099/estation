import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';
import 'package:image_picker/image_picker.dart';

import '../../apiFunctions/auth.dart';
import '../../apiFunctions/user_dao.dart';
import '../../screens/pompiste/home_page.dart';
import '../../utils/services.dart';

class ScanController extends GetxController {
  XFile? image;
  RxBool loadingImage = false.obs;
  int pompeUser = 0;
  RxBool loading = false.obs;
  File? imageFile;
  TextEditingController number = TextEditingController();
  selectImage() async {
    loadingImage.toggle();
    update();
    try {
      image = await ImagePicker().pickImage(source: ImageSource.camera);
      if (image != null) {
        imageFile = File(image!.path);

        final textRecognizer = TextRecognizer();
        final inputImage = InputImage.fromFilePath(image!.path);
        final recognizedText = await textRecognizer.processImage(inputImage);
        number.text = recognizedText.text;
        var aStr = number.text.replaceAll(RegExp(r'[^0-9]'), '').length > 10
            ? number.text.replaceAll(RegExp(r'[^0-9]'), '').substring(1, 10)
            : number.text.replaceAll(RegExp(r'[^0-9]'), '');
      number.text = aStr;
        if (number.text.isEmpty) {
          Get.snackbar('Error', 'The Image does not contain a number',
              colorText: Colors.white, backgroundColor: Colors.red);
        }
      update();
      }
    } catch (e) {
      rethrow;
    }
    loadingImage.toggle();
    update();
  }

  Future<bool> verify() async {
    if (number.text.isEmpty) {
      Get.snackbar('Error', 'The field is empty',
          colorText: Colors.white, backgroundColor: Colors.red);
      return false;
    } else if (!GetUtils.isNumericOnly(number.text)) {
      Get.snackbar('Error', 'The number is not a number',
          colorText: Colors.white, backgroundColor: Colors.red);
      return false;
    } else if (image == null) {
      Get.snackbar('Error', 'There is no image',
          colorText: Colors.white, backgroundColor: Colors.red);
      return false;
    }

    return true;
  }

  submit() async {
    verify().then((value) async {
      if (value) {
        await addReleve();
      }
    });
  }

  addReleve() async {
    loading.toggle();
    update();
    await UserDao.addReleve(number.text.trim(), pompeUser).then((value) {
      switch (value.statusCode) {
        case 201:
          Get.snackbar('Success', 'Releve added',
              colorText: Colors.white, backgroundColor: Colors.green);
          Get.offAll(() => const HomePageScreen());
          loading.toggle();
          update();
          Get.delete<ScanController>();
          break;
        case 400:
          Auth().refreshToken().then((value) {
            if (value.statusCode == 200) {
              UserDao.addReleve(number.text.trim(), pompeUser).then((value) {
                switch (value.statusCode) {
                  case 201:
                    Get.snackbar('Success', 'Releve added',
                        colorText: Colors.white, backgroundColor: Colors.green);
                    Get.offAll(() => const HomePageScreen());

                    loading.toggle();
                    update();
                    Get.delete<ScanController>();
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
    loading.toggle();
    update();
  }
}
