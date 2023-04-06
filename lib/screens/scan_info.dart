import 'dart:ffi';

import 'package:easy_localization/easy_localization.dart';
import 'package:estation/components/appVars.dart';
import 'package:estation/controllers/home_page.dart';
import 'package:estation/screens/scan_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';

import '../components/widgets.dart';

class ScanInfoScreen extends StatelessWidget {
  const ScanInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomePageController>(
        init: HomePageController(),
        builder: (controller) {
          return Scaffold(
            extendBodyBehindAppBar: true,
            appBar: AppBar(
              automaticallyImplyLeading: false,
              backgroundColor: Colors.transparent,
              title: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.w),
                  child: Image.asset(
                    "assets/img/logoWhite.png",
                    width: 140.w,
                  )),
              actions: [
                Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.w),
                    child: IconButton(
                        onPressed: () => {},
                        icon: const Icon(Icons.logout_rounded,
                            color: Colors.white)))
              ],
            ),
            body: Stack(
              children: [
                Stack(
                  children: <Widget>[
                    Container(
                      width: double.infinity,
                      height: 300.h,
                      decoration: const BoxDecoration(
                        gradient: gradientColor,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 170.h),
                      width: double.infinity,
                      height: double.infinity,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30),
                        ),
                      ),
                      child: SingleChildScrollView(
                        physics: const BouncingScrollPhysics(),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 32.w, vertical: 37.h),
                                  child: InkWell(
                                    onTap: () {
                                      Get.back();
                                    },
                                    child: Icon(
                                      IconlyLight.arrow_left_circle,
                                      color: Color(0xff14213D),
                                    ),
                                  ),
                                ),
                                80.horizontalSpace,
                                Text(
                                  "receipt",
                                  style: TextStyle(
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.w700,
                                    color: Color(0xff14213D),
                                  ),
                                ).tr(),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.all(0),
                              child: Center(
                                child: Text(
                                  "Pompe ID",
                                  style: TextStyle(
                                    fontSize: 18.sp,
                                    fontFamily: '',
                                    fontWeight: FontWeight.w400,
                                    color: Color(0xff14213D),
                                  ),
                                ),
                              ),
                            ),
                            55.verticalSpace,
                            Center(
                              child: Image(
                                height: 200.h,
                                image: AssetImage("assets/img/scaninfo.png"),
                              ),
                            ),
                            30.verticalSpace,
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 55.w),
                              child: Text(
                                'tosubmitinfo',
                                style: secondaryStyle,
                                textAlign: TextAlign.center,
                              ).tr(),
                            ),
                            35.verticalSpace,
                            Center(
                              child: Container(
                                  width: 150.w,
                                  child: PrimaryButton(
                                      text: 'scan',
                                      onpress: () {
                                        Get.to(
                                          () => ScanScreen(),
                                          transition: Transition.rightToLeft,
                                        );
                                      })),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          );
        });
  }
}
