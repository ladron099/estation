import 'package:easy_localization/easy_localization.dart';
import 'package:estation/components/appVars.dart';
import 'package:estation/utils/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';

void main() async {
  await GetStorage.init();
  Widget? main;
  await initWidget().then(
    (value) {
      main = value;
    },
  );
  runApp(EasyLocalization(
    supportedLocales: supportedLocales,
    path: 'assets/translations',
    fallbackLocale: Locale('en'),
    startLocale: Locale("en"),
    child: ScreenUtilInit(
      designSize: Size(390, 844),
      minTextAdapt: true,
      splitScreenMode: false,
      builder: (context, child) {
        return GetMaterialApp(
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: context.locale,
          debugShowCheckedModeBanner: false,
          title: 'EStation',
          theme: ThemeData(
            useMaterial3: true, 
            fontFamily: 'inter',
            primaryColor: primaryColor,
          ),
          home: main,
        );
      },
    ),
  ));
}
