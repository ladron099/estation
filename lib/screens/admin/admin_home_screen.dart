import 'package:easy_localization/easy_localization.dart';
import 'package:estation/components/appVars.dart';
import 'package:estation/components/widgets.dart';
import 'package:estation/controllers/admin/admin_home_controller.dart';
import 'package:estation/screens/admin/charts_screen.dart';
import 'package:estation/utils/connectivity_wrapper.dart';
import 'package:estation/utils/services.dart';
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
                // extendBodyBehindAppBar: true,
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
                    height: 140.h,
                  ),
                  centerTitle: true,
                  actions: [
                    IconButton(
                        onPressed: () => {logout()},
                        icon: const Icon(Icons.logout_rounded,
                            color: Colors.white))
                  ],
                ),
                body: controller.loading.value
                    ? LodingWidget()
                    : SingleChildScrollView(
                        child: ConstrainedBox(
                          constraints: BoxConstraints(
                            minHeight: Get.height,
                            minWidth: Get.width,
                          ),
                          child: IntrinsicHeight(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                14.verticalSpace,
                                !controller.loading.value
                                    ? Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 50.0.w),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              plural('welcomeuser', 0, args: [
                                                controller.user!.nom!
                                              ]),
                                              style: whiteTitle,
                                              textAlign: TextAlign.left,
                                            ).tr(),
                                            InkWell(
                                              onTap: () {
                                                controller.onInit();
                                              },
                                              child: const Icon(Icons.refresh,
                                                  color: Colors.white),
                                            )
                                          ],
                                        ),
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
                                7.verticalSpace,
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
                                Expanded(
                                  child: Container(
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                        color: backgroundColor,
                                        borderRadius: BorderRadius.only(
                                            topRight: Radius.circular(20.r),
                                            topLeft: Radius.circular(20.r))),
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 24.w),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          24.verticalSpace,
                                          DropDownMenu(
                                            items: controller.dropdownItems,
                                            listItem:
                                                controller.selectedStation,
                                            function: (value) {
                                              controller
                                                  .dropDownMenuChange(value);
                                              controller.update();
                                            },
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              TextButton(
                                                onPressed: () {
                                                  Get.to(
                                                    () => ChartScreen(),
                                                  );
                                                },
                                                child: const Text(
                                                  'seeall',
                                                ).tr(),
                                              ),
                                            ],
                                          ),
                                          for (int i = 0;
                                              i <
                                                  controller.homeData.carburant!
                                                      .length;
                                              i++)
                                            Column(
                                              children: [
                                                Container(
                                                    width:
                                                        MediaQuery.of(context)
                                                            .size
                                                            .width,
                                                    constraints: BoxConstraints(
                                                      minHeight: 70.h,
                                                    ),
                                                    decoration: BoxDecoration(
                                                      color: Colors.white,
                                                      borderRadius:
                                                          const BorderRadius
                                                                  .all(
                                                              Radius.circular(
                                                                  20)),
                                                      boxShadow: [
                                                        BoxShadow(
                                                          color: Colors.grey
                                                              .withOpacity(
                                                                  0.25),
                                                          spreadRadius: -1,
                                                          blurRadius: 7,
                                                          offset: const Offset(
                                                              0,
                                                              0), // changes position of shadow
                                                        ),
                                                      ],
                                                    ),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                              horizontal: 20.w),
                                                      child: Column(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .start,
                                                        children: [
                                                          13.verticalSpace,
                                                          Row(
                                                            children: [
                                                              Image.asset(
                                                                'assets/img/dollar.png',
                                                                width: 15.w,
                                                                height: 15.w,
                                                              ),
                                                              7.horizontalSpace,
                                                              Text(
                                                                controller
                                                                    .homeData
                                                                    .carburant![
                                                                        i]
                                                                    .nomCarburant!,
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .black,
                                                                    fontSize:
                                                                        12.sp),
                                                              ).tr(),
                                                            ],
                                                          ),
                                                          7.verticalSpace,
                                                          Row(
                                                            children: [
                                                              Text(
                                                                controller
                                                                    .homeData
                                                                    .carburant![
                                                                        i]
                                                                    .prixCarburant!
                                                                    .toString(),
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .black,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                    fontSize:
                                                                        20.sp),
                                                              ),
                                                              const Spacer(),
                                                              Text(
                                                                controller
                                                                            .homeData
                                                                            .carburant![
                                                                                i]
                                                                            .percentChange!
                                                                            .toString() ==
                                                                        "0"
                                                                    ? "0%"
                                                                    : controller
                                                                        .homeData
                                                                        .carburant![
                                                                            i]
                                                                        .percentChange!
                                                                        .toString(),
                                                                style: TextStyle(
                                                                    color: controller.homeData.carburant![i].percentChange == "0"
                                                                        ? yellowColor
                                                                        : controller.homeData.carburant![i].increase!
                                                                            ? successColor
                                                                            : dangerColor,
                                                                    fontWeight: FontWeight.bold,
                                                                    fontSize: 20.sp),
                                                              ),
                                                              7.horizontalSpace,
                                                              controller
                                                                          .homeData
                                                                          .carburant![
                                                                              i]
                                                                          .percentChange ==
                                                                      "0"
                                                                  ? Image.asset(
                                                                      'assets/img/pause.png',
                                                                      width:
                                                                          26.w,
                                                                      height:
                                                                          26.w,
                                                                    )
                                                                  : controller
                                                                          .homeData
                                                                          .carburant![
                                                                              i]
                                                                          .increase!
                                                                      ? Image
                                                                          .asset(
                                                                          'assets/img/up.png',
                                                                          width:
                                                                              26.w,
                                                                          height:
                                                                              26.w,
                                                                        )
                                                                      : Image
                                                                          .asset(
                                                                          'assets/img/down.png',
                                                                          width:
                                                                              26.w,
                                                                          height:
                                                                              26.w,
                                                                        ),
                                                            ],
                                                          ),
                                                          6.verticalSpace,
                                                          Row(
                                                            children: [
                                                              Text(
                                                                "MAD",
                                                                style: TextStyle(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                    color: Colors
                                                                        .black,
                                                                    fontSize:
                                                                        19.sp),
                                                              ).tr(),
                                                            ],
                                                          ),
                                                          18.verticalSpace,
                                                        ],
                                                      ),
                                                    )),
                                                20.verticalSpace,
                                              ],
                                            ),
                                          Container(
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width,
                                              constraints: BoxConstraints(
                                                minHeight: 70.h,
                                              ),
                                              decoration: BoxDecoration(
                                                gradient: lightGradientColor,
                                                borderRadius:
                                                    const BorderRadius.all(
                                                        Radius.circular(20)),
                                                boxShadow: [
                                                  BoxShadow(
                                                    color: Colors.grey
                                                        .withOpacity(0.25),
                                                    spreadRadius: -1,
                                                    blurRadius: 7,
                                                    offset: const Offset(0,
                                                        0), // changes position of shadow
                                                  ),
                                                ],
                                              ),
                                              child: Padding(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 20.w),
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    13.verticalSpace,
                                                    Row(
                                                      children: [
                                                        Image.asset(
                                                          'assets/img/Chart.png',
                                                          width: 15.w,
                                                          height: 15.w,
                                                        ),
                                                        7.horizontalSpace,
                                                        Text(
                                                          "todaynumber",
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.white,
                                                              fontSize: 12.sp),
                                                        ).tr(),
                                                      ],
                                                    ),
                                                    7.verticalSpace,
                                                    Row(
                                                      children: [
                                                        Text(
                                                          controller.homeData
                                                              .chiffreToday!
                                                              .toString(),
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.white,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              fontSize: 20.sp),
                                                        ),
                                                      ],
                                                    ),
                                                    6.verticalSpace,
                                                    Row(
                                                      children: [
                                                        Text(
                                                          "MAD",
                                                          style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              color:
                                                                  Colors.white,
                                                              fontSize: 19.sp),
                                                        ).tr(),
                                                      ],
                                                    ),
                                                    18.verticalSpace,
                                                  ],
                                                ),
                                              )),
                                          19.verticalSpace,
                                          Container(
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            // margin: EdgeInsets.only(
                                            //     left: 30.h, right: 30.h),
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(20.r)),
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Colors.grey
                                                      .withOpacity(0.25),
                                                  spreadRadius: -1,
                                                  blurRadius: 7,
                                                  offset: const Offset(0,
                                                      0), // changes position of shadow
                                                ),
                                              ],
                                            ),
                                            child: Padding(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 25.w),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  17.verticalSpace,
                                                  Padding(
                                                    padding: EdgeInsets.only(
                                                        bottom: 26.0.h),
                                                    child: Row(
                                                      children: [
                                                        Image.asset(
                                                          'assets/img/Drop.png',
                                                          width: 18.w,
                                                          height: 19.w,
                                                        ),
                                                        10.horizontalSpace,
                                                        Text(
                                                          "jauguage",
                                                          style: TextStyle(
                                                              color: const Color(
                                                                  0xff14213D),
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              fontSize: 14.sp),
                                                        ).tr(),
                                                      ],
                                                    ),
                                                  ),
                                                  Container(
                                                    constraints: BoxConstraints(
                                                        minHeight: 200.h),
                                                    height: 200.h,
                                                    child: ListView.separated(
                                                      physics:
                                                          const NeverScrollableScrollPhysics(),
                                                      shrinkWrap: true,
                                                      itemBuilder:
                                                          (BuildContext context,
                                                                  int index) =>
                                                              Container(
                                                        width: double.infinity,
                                                        constraints:
                                                            BoxConstraints(
                                                          minHeight: 60.h,
                                                        ),
                                                        decoration: BoxDecoration(
                                                            color: Colors.white,
                                                            borderRadius:
                                                                BorderRadius.all(
                                                                    Radius.circular(
                                                                        13.r)),
                                                            boxShadow: [
                                                              BoxShadow(
                                                                color: Colors
                                                                    .grey
                                                                    .withOpacity(
                                                                        0.50),
                                                                spreadRadius:
                                                                    -1,
                                                                blurRadius: 7,
                                                                offset: const Offset(
                                                                    0,
                                                                    0), // changes position of shadow
                                                              ),
                                                            ]),
                                                        child: Padding(
                                                          padding: EdgeInsets
                                                              .symmetric(
                                                                  horizontal:
                                                                      15.0.w),
                                                          child: Column(
                                                            children: [
                                                              17.verticalSpace,
                                                              Row(
                                                                children: [
                                                                  Text(
                                                                    controller
                                                                        .homeData
                                                                        .citerneJaugage![
                                                                            index]
                                                                        .nomCiterne!,
                                                                    style: TextStyle(
                                                                        color: const Color(
                                                                            0xff14213D),
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .bold,
                                                                        fontSize:
                                                                            14.sp),
                                                                  ).tr(),
                                                                  12.horizontalSpace,
                                                                  Text(
                                                                    controller
                                                                        .homeData
                                                                        .citerneJaugage![
                                                                            index]
                                                                        .nomProduit!,
                                                                    style: TextStyle(
                                                                        color: const Color(
                                                                            0xff14213D),
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .normal,
                                                                        fontSize:
                                                                            12.sp),
                                                                  ).tr(),
                                                                  const Spacer(),
                                                                  Text(
                                                                    "Jaugage",
                                                                    style: TextStyle(
                                                                        color: const Color(
                                                                            0xff14213D),
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .bold,
                                                                        fontSize:
                                                                            14.sp),
                                                                  ).tr(),
                                                                ],
                                                              ),
                                                              10.verticalSpace,
                                                              Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceBetween,
                                                                children: [
                                                                  ClipRRect(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            10.r),
                                                                    child:
                                                                        SizedBox(
                                                                      height:
                                                                          10.h,
                                                                      width:
                                                                          143.w,
                                                                      child:
                                                                          LinearProgressIndicator(
                                                                        value: double.parse(controller.homeData.citerneJaugage![index].percentageLevel!) /
                                                                            100,
                                                                        backgroundColor:
                                                                            const Color(0xffD9D9D9),
                                                                        valueColor:
                                                                            const AlwaysStoppedAnimation<Color>(
                                                                          Color(
                                                                              0xff6366F1),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Text(
                                                                    controller
                                                                        .homeData
                                                                        .citerneJaugage![
                                                                            index]
                                                                        .jaugage
                                                                        .toString(),
                                                                    style: TextStyle(
                                                                        color: const Color(
                                                                            0xff14213D),
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .w500,
                                                                        fontSize:
                                                                            14.sp),
                                                                  ).tr(),
                                                                ],
                                                              ),
                                                              17.verticalSpace,
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                      itemCount: controller
                                                          .homeData
                                                          .citerneJaugage!
                                                          .length,
                                                      separatorBuilder:
                                                          (BuildContext context,
                                                                  int index) =>
                                                              10.verticalSpace,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          19.verticalSpace,
                                        ],
                                      ),
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
