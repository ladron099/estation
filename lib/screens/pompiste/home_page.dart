import 'dart:ffi';

import 'package:easy_localization/easy_localization.dart';
import 'package:estation/components/appVars.dart';
import 'package:estation/components/widgets.dart';
import 'package:estation/controllers/pompiste/home_page.dart';
import 'package:estation/utils/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

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
                              logout()
                              // controller.logout()
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
                      decoration: BoxDecoration(
                        gradient: gradientColor,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 170.h),
                      width: double.infinity,
                      height: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30.r),
                          topRight: Radius.circular(30.r),
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
                                    margin: EdgeInsets.only(
                                        left: 30.w, right: 30.w),
                                    decoration: BoxDecoration(
                                      gradient: lightGradientColor,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(20.r)),
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
                                                !controller.loading.value
                                                    ? Text(
                                                        plural('welcomeuser', 0,
                                                            args: [
                                                              controller
                                                                  .user!.nom!
                                                            ]),
                                                        style: whiteTitle,
                                                        textAlign:
                                                            TextAlign.left,
                                                      ).tr()
                                                    : Text(
                                                        'welcome',
                                                        style: whiteTitle,
                                                        textAlign:
                                                            TextAlign.left,
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
                                    margin: EdgeInsets.only(
                                        left: 30.h, right: 30.h),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(20.r)),
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
                                                20.w, 20.h, 20.w, 30.h),
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
