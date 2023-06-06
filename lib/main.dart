import 'package:connectivity_wrapper/connectivity_wrapper.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:estation/components/appVars.dart';
import 'package:estation/utils/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  await GetStorage.init();
  Widget? main;
  String? lang;
  await getLang().then((value) {
    lang = value;
  });
  await initWidget().then(
    (value) {
      main = value;
    },
  );
  runApp(
    ConnectivityAppWrapper(
      app: EasyLocalization(
        supportedLocales: supportedLocales,
        path: 'assets/translations',
        fallbackLocale: const Locale('en'),
        startLocale: Locale(lang ?? 'en'),
        child: ScreenUtilInit(
          designSize: const Size(390, 844),
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
      ),
    ),
  );
}
