import 'dart:ffi';

import 'package:easy_localization/easy_localization.dart';
import 'package:estation/components/appVars.dart';
import 'package:estation/controllers/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../components/widgets.dart';

class HomePageScreen extends StatelessWidget {
  const HomePageScreen({super.key});

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
                        onPressed: () => {
                              // Get.defaultDialog(
                              //     title: "Logout",
                              //     middleText:
                              //         "Are you sure you want to logout?",
                              //     textConfirm: "Yes",
                              //     textCancel: "No",
                              //     confirmTextColor: Colors.white,
                              //     cancelTextColor: Colors.white,
                              //     buttonColor: primaryColor,
                              //     onConfirm: () => {controller.logout()})
                              controller.logout()
                            },
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
                      child: Center(
                        child: SingleChildScrollView(
                          physics: const BouncingScrollPhysics(),
                          child: Column(
                            children: [
                              Padding(
                                  padding: EdgeInsets.all(0.w),
                                  child: Container(
                                    width: MediaQuery.of(context).size.width,
                                    margin: const EdgeInsets.only(
                                        left: 30, right: 30),
                                    decoration: BoxDecoration(
                                      gradient: lightGradientColor,
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(20)),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey.withOpacity(0.25),
                                          spreadRadius: -1,
                                          blurRadius: 7,
                                          offset: Offset(0,
                                              0), // changes position of shadow
                                        ),
                                      ],
                                    ),
                                    child: Card(
                                        elevation: 0,
                                        color: Colors.transparent,
                                        child: Padding(
                                            padding: EdgeInsets.fromLTRB(
                                                25.w, 20.w, 25.w, 25.w),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "welcomeuser",
                                                  style: whiteTitle,
                                                  textAlign: TextAlign.left,
                                                ).tr(),
                                                SizedBox(
                                                  height: 5.h,
                                                ),
                                                Text(
                                                  "welcomemsg",
                                                  style: whiteText,
                                                  textAlign: TextAlign.left,
                                                ).tr(),
                                              ],
                                            ))),
                                  )),
                              Padding(
                                  padding: EdgeInsets.only(top: 30.h),
                                  child: Container(
                                    width: MediaQuery.of(context).size.width,
                                    margin: const EdgeInsets.only(
                                        left: 30, right: 30),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(20)),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey.withOpacity(0.25),
                                          spreadRadius: -1,
                                          blurRadius: 7,
                                          offset: Offset(0,
                                              0), // changes position of shadow
                                        ),
                                      ],
                                    ),
                                    child: Card(
                                        elevation: 0,
                                        color: Colors.transparent,
                                        child: Padding(
                                            padding: const EdgeInsets.fromLTRB(
                                                20, 20, 20, 30),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      "releve",
                                                      style: primaryStyle,
                                                      textAlign: TextAlign.left,
                                                    ).tr(),
                                                    SizedBox(
                                                      height: 5.h,
                                                    ),
                                                    Text(
                                                      "NoReleve",
                                                      style: primaryText,
                                                      textAlign: TextAlign.left,
                                                    ).tr(),
                                                  ],
                                                ),
                                                Padding(
                                                  padding: EdgeInsets.only(
                                                      top: 40.h),
                                                  child: Column(
                                                    children: [
                                                      ReleveBox(
                                                        verified: false,
                                                      ),
                                                      20.verticalSpace,
                                                      ReleveBox(
                                                        verified: true,
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ))),
                                  )),
                            ],
                          ),
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
