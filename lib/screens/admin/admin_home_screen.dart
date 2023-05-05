import 'package:carousel_slider/carousel_slider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:estation/components/appVars.dart';
import 'package:estation/components/widgets.dart';
import 'package:estation/controllers/admin/admin_home_controller.dart';
import 'package:estation/utils/connectivity_wrapper.dart';
import 'package:estation/utils/services.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class AdminHomeScreen extends StatelessWidget {
  const AdminHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> key = GlobalKey();
    return GetBuilder<AdminHomeController>(
        init: AdminHomeController(),
        builder: (controller) {
          return connectivityWrapper(
            Scaffold(
                backgroundColor: blueColor,
                key: key,
                extendBodyBehindAppBar: true,
                drawer: const DrawerWidget(),
                appBar: AppBar(
                  leading: InkWell(
                    onTap: () {
                      key.currentState!.openDrawer();
                    },
                    child: const Icon(
                      Icons.menu,
                      color: Colors.white,
                    ),
                  ),
                  backgroundColor: blueColor,
                  elevation: 0,
                  title: Image.asset(
                    'assets/img/logoWhite.png',
                    width: 140.w,
                  ),
                  centerTitle: true,
                  actions: [
                    IconButton(
                        onPressed: () => {logout()},
                        icon: const Icon(Icons.logout_rounded,
                            color: Colors.white))
                  ],
                ),
                body: SingleChildScrollView(
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      minHeight: Get.height,
                      minWidth: Get.width,
                    ),
                    child: IntrinsicHeight(
                      child: Column(
                        children: [
                          Container(
                            color: blueColor,
                          ),
                          Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                98.verticalSpace,
                                !controller.loading.value
                                    ? Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 50.0.w),
                                        child: Text(
                                          plural('welcomeuser', 0,
                                              args: [controller.user!.nom!]),
                                          style: whiteTitle,
                                          textAlign: TextAlign.left,
                                        ).tr(),
                                      )
                                    : Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 50.0.w),
                                        child: Text(
                                          'welcome',
                                          style: whiteTitle,
                                          textAlign: TextAlign.left,
                                        ).tr(),
                                      ),
                                10.verticalSpace,
                                Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 50.0.w),
                                  child: Text(
                                    'overview',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16.sp,
                                    ),
                                  ).tr(),
                                ),
                                40.verticalSpace,
                                Column(
                                  children: [
                                    CarouselSlider(
                                      carouselController:
                                          controller.carouselController,
                                      options: CarouselOptions(
                                        enlargeFactor: 0.12,
                                        onPageChanged: (index, reason) {
                                          controller.changeIndex(index, reason);
                                        },
                                        height: 229.h,
                                        autoPlayInterval:
                                            const Duration(seconds: 3),
                                        autoPlayAnimationDuration:
                                            const Duration(milliseconds: 800),
                                        autoPlayCurve: Curves.fastOutSlowIn,
                                        enlargeCenterPage: true,
                                        scrollDirection: Axis.horizontal,
                                      ),
                                      items: [1, 2, 3].map((i) {
                                        return Builder(
                                          builder: (BuildContext context) {
                                            return Container(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 16.w),
                                                width: MediaQuery.of(context)
                                                    .size
                                                    .width,
                                                margin: EdgeInsets.symmetric(
                                                    horizontal: 5.0.w),
                                                decoration: BoxDecoration(
                                                    gradient: cardGradient,
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                20.r))),
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      'Station $i',
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 18.sp,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                    4.verticalSpace,
                                                    Text(
                                                      'Adresse 12, Numero 5, Rue 10',
                                                      style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 14.sp,
                                                      ),
                                                    ),
                                                    9.verticalSpace,
                                                    Container(
                                                      height: 2.h,
                                                      width: 150.w,
                                                      decoration: BoxDecoration(
                                                          color: Colors.white
                                                              .withOpacity(0.5),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      20.r)),
                                                    ),
                                                    9.verticalSpace,
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Text(
                                                              'receipt',
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .white,
                                                                  fontSize:
                                                                      14.sp,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold),
                                                            ).tr(),
                                                            4.verticalSpace,
                                                            Text(
                                                              'notsubmitted',
                                                              style: TextStyle(
                                                                color: Colors
                                                                    .white,
                                                                fontSize: 13.sp,
                                                              ),
                                                            ).tr(),
                                                            4.verticalSpace,
                                                            Text(
                                                              'today_number',
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .white,
                                                                  fontSize:
                                                                      14.sp,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold),
                                                            ).tr(),
                                                            4.verticalSpace,
                                                            Text(
                                                              '3005',
                                                              style: TextStyle(
                                                                color: Colors
                                                                    .white,
                                                                fontSize: 13.sp,
                                                              ),
                                                            ).tr(),
                                                            4.verticalSpace,
                                                            Text(
                                                              'today_number',
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .white,
                                                                  fontSize:
                                                                      15.sp,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold),
                                                            ).tr(),
                                                            4.verticalSpace,
                                                            Text(
                                                              '8995',
                                                              style: TextStyle(
                                                                color: Colors
                                                                    .white,
                                                                fontSize: 13.sp,
                                                              ),
                                                            ).tr(),
                                                          ],
                                                        ),
                                                        InkWell(
                                                          onTap: () {
                                                            context.locale ==
                                                                    const Locale(
                                                                        'fr')
                                                                ? context
                                                                        .locale =
                                                                    const Locale(
                                                                        'en')
                                                                : context
                                                                        .locale =
                                                                    const Locale(
                                                                        'fr');
                                                            Get.updateLocale(
                                                                const Locale(
                                                                    'fr'));
                                                            controller.update();
                                                          },
                                                          child: Container(
                                                            width: 110.w,
                                                            height: 120.h,
                                                            decoration: BoxDecoration(
                                                                color: Colors
                                                                    .white
                                                                    .withOpacity(
                                                                        0.5),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            20.r)),
                                                          ),
                                                        ),
                                                      ],
                                                    )
                                                  ],
                                                ));
                                          },
                                        );
                                      }).toList(),
                                    ),
                                    10.verticalSpace,
                                    Container(
                                      alignment: Alignment.bottomCenter,
                                      padding: EdgeInsets.only(bottom: 13.h),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: List.generate(
                                            3,
                                            (index) => Container(
                                                  height: 10.h,
                                                  width: 10.w,
                                                  margin: const EdgeInsets.only(
                                                      right: 5),
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20.r),
                                                    color: controller
                                                                .currentIndex ==
                                                            index
                                                        ? Colors.white
                                                        : Colors.grey[500],
                                                  ),
                                                )),
                                      ),
                                    ),
                                    3.verticalSpace,
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Container(
                              width: double.infinity,
                              padding: EdgeInsets.symmetric(horizontal: 40.w),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20.r)),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 20.w, vertical: 20.h),
                                    width: MediaQuery.of(context).size.width,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(20)),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey.withOpacity(0.25),
                                          spreadRadius: -1,
                                          blurRadius: 7,
                                          offset: const Offset(0,
                                              0), // changes position of shadow
                                        ),
                                      ],
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              "10",
                                              style: TextStyle(
                                                  color: primaryColor,
                                                  fontSize: 20.sp,
                                                  fontWeight: FontWeight.bold),
                                              textAlign: TextAlign.left,
                                            ),
                                            const Text(
                                              "Pompistes",
                                              textAlign: TextAlign.left,
                                            ).tr()
                                          ],
                                        ),
                                        Center(
                                          child: Icon(
                                            CupertinoIcons.person_alt_circle,
                                            color: primaryColor,
                                            size: 35.sp,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  10.verticalSpace,
                                  Container(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 20.w, vertical: 20.h),
                                    width: MediaQuery.of(context).size.width,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(20)),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey.withOpacity(0.25),
                                          spreadRadius: -1,
                                          blurRadius: 7,
                                          offset: const Offset(0,
                                              0), // changes position of shadow
                                        ),
                                      ],
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              "5",
                                              style: TextStyle(
                                                  color: primaryColor,
                                                  fontSize: 20.sp,
                                                  fontWeight: FontWeight.bold),
                                              textAlign: TextAlign.left,
                                            ),
                                            const Text(
                                              "Citernes",
                                              textAlign: TextAlign.left,
                                            ).tr()
                                          ],
                                        ),
                                        Center(
                                          child: Icon(
                                            CupertinoIcons.drop,
                                            color: successColor,
                                            size: 35.sp,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  10.verticalSpace,
                                  Container(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 20.w, vertical: 20.h),
                                    width: MediaQuery.of(context).size.width,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(20)),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey.withOpacity(0.25),
                                          spreadRadius: -1,
                                          blurRadius: 7,
                                          offset: const Offset(0,
                                              0), // changes position of shadow
                                        ),
                                      ],
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              "8",
                                              style: TextStyle(
                                                  color: primaryColor,
                                                  fontSize: 20.sp,
                                                  fontWeight: FontWeight.bold),
                                              textAlign: TextAlign.left,
                                            ),
                                            const Text(
                                              "Pompes",
                                              textAlign: TextAlign.left,
                                            ).tr()
                                          ],
                                        ),
                                        Center(
                                          child: Icon(
                                            CupertinoIcons.gear_solid,
                                            color: const Color(0xff48A7F5),
                                            size: 35.sp,
                                          ),
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                )),
          );
        });
  }
}
