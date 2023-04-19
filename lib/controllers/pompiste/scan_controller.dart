import 'dart:io';

import 'package:estation/screens/pompiste/home_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';
import 'package:image_picker/image_picker.dart';

class ScanController extends GetxController {
  XFile? image;
  RxBool loadingImage = false.obs;
  RxBool loading = false.obs;
  File? ImageFile;
  TextEditingController number = TextEditingController();
  selectImage() async {
    loadingImage.toggle();
    update();
    try {
      image = await ImagePicker().pickImage(source: ImageSource.camera);
      if (image != null) {
        ImageFile = File(image!.path);

        final textRecognizer = TextRecognizer();
        final inputImage = InputImage.fromFilePath(image!.path);
        final recognizedText = await textRecognizer.processImage(inputImage);
        number.text = recognizedText.text;
        var aStr = number.text.replaceAll(new RegExp(r'[^0-9]'), '');
        number.text = aStr;
      
      }
    } catch (e) {
      print(e);
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
    verify().then((value) {
      if (value) {
        Get.snackbar('Success', 'Scan successful',
            colorText: Colors.white, backgroundColor: Colors.green);
        Get.to(() => HomePageScreen());
      }
    });
  }
}
