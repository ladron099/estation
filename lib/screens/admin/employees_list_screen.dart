import 'package:easy_localization/easy_localization.dart';
import 'package:estation/components/appVars.dart';
import 'package:estation/components/widgets.dart';
import 'package:estation/controllers/admin/employees_list_controller.dart';
import 'package:estation/screens/admin/user_profile_screen.dart';
import 'package:estation/utils/services.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';

class EmployeesListScreen extends StatelessWidget {
  const EmployeesListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> key = GlobalKey();
    return Scaffold(
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
              icon: const Icon(Icons.logout_rounded, color: Colors.white))
        ],
      ),
      body: Stack(
        children: <Widget>[
          Container(
            width: double.infinity,
            height: 300.h,
            decoration: const BoxDecoration(
              color: blueColor,
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 110.h),
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
              child: GetBuilder<EmployeesListController>(
                  init: EmployeesListController(),
                  builder: (controller) {
                    return controller.loading.value
                        ? Padding(
                            padding: EdgeInsets.only(top: 700.h / 2),
                            child: LodingWidget(),
                          )
                        : Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              20.verticalSpace,
                              Padding(
                                padding:
                                    EdgeInsets.symmetric(horizontal: 20.0.w),
                                child: DropDownMenu(
                                  items: controller.dropdownItems,
                                  listItem: controller.selectedStation,
                                  function: (value) {
                                    controller.dropDownMenuChange(value);
                                    controller.update();
                                  },
                                ),
                              ),
                              25.verticalSpace,
                              Padding(
                                padding:
                                    EdgeInsets.symmetric(horizontal: 20.0.w),
                                child: Text(
                                  'manager',
                                  style: TextStyle(
                                      color: darkColor,
                                      fontSize: 19.5.sp,
                                      fontWeight: FontWeight.w700,
                                      fontFamily: 'inter'),
                                ).tr(),
                              ),
                              20.verticalSpace,
                              Container(
                                constraints: BoxConstraints(minHeight: 140.h),
                                height: 145.h,
                                child: ListView.separated(
                                  shrinkWrap: true,
                                  scrollDirection: Axis.horizontal,
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 20.w),
                                  itemBuilder:
                                      (BuildContext context, int index) =>
                                          InkWell(
                                    onTap: () {
                                      Get.to(
                                        () => const UserProfileScreen(),
                                        transition:
                                            Transition.rightToLeftWithFade,
                                        duration:
                                            const Duration(milliseconds: 500),
                                      );
                                    },
                                    child: Container(
                                        width: 150.w,
                                        decoration: BoxDecoration(
                                          gradient: const LinearGradient(
                                            end: Alignment.topCenter,
                                            begin: Alignment.bottomCenter,
                                            colors: [
                                              Color(0xFF0661AB),
                                              Color(0xFF48A7F5),
                                            ],
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(20.r),
                                        ),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            const Icon(
                                              CupertinoIcons.person_alt_circle,
                                              color: Colors.white,
                                              size: 37,
                                            ),
                                            10.verticalSpace,
                                            Center(
                                              child: SizedBox(
                                                width: 100.w,
                                                child: Text(
                                                  "${controller.selectedStation!.users![index].user!.prenom} ${controller.selectedStation!.users![index].user!.nom}",
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 13.sp,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ).tr(),
                                              ),
                                            ),
                                            Center(
                                              child: SizedBox(
                                                width: 100.w,
                                                child: Text(
                                                  "${controller.selectedStation!.users![index].user!.email} ",
                                                  textAlign: TextAlign.center,
                                                  maxLines: 2,
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 13.sp,
                                                  ),
                                                ).tr(),
                                              ),
                                            ),
                                            12.verticalSpace,
                                            Text(
                                              "moredetails",
                                              style: TextStyle(
                                                color: Colors.white
                                                    .withOpacity(0.5),
                                                fontSize: 12.sp,
                                              ),
                                            ).tr(),
                                          ],
                                        )),
                                  ),
                                  itemCount: controller.selectedStation!.users!
                                      .where((element) =>
                                          element.user!.profile!.nom ==
                                          "MANAGER")
                                      .toList()
                                      .length,
                                  separatorBuilder:
                                      (BuildContext context, int index) =>
                                          10.horizontalSpace,
                                ),
                              ),
                              15.verticalSpace,
                              Padding(
                                padding:
                                    EdgeInsets.symmetric(horizontal: 20.0.w),
                                child: Text(
                                  'Pompistes',
                                  style: TextStyle(
                                      color: darkColor,
                                      fontSize: 19.5.sp,
                                      fontWeight: FontWeight.w700,
                                      fontFamily: 'inter'),
                                ).tr(),
                              ),
                              10.verticalSpace,
                              Container(
                                width: MediaQuery.of(context).size.width,
                                margin:
                                    EdgeInsets.only(left: 30.h, right: 30.h),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20.r)),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.25),
                                      spreadRadius: -1,
                                      blurRadius: 7,
                                      offset: const Offset(
                                          0, 0), // changes position of shadow
                                    ),
                                  ],
                                ),
                                child: Padding(
                                  padding:
                                      EdgeInsets.fromLTRB(7.w, 20.h, 7.w, 0.h),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(top: 25.h),
                                        child: Container(
                                          constraints:
                                              BoxConstraints(minHeight: 230.h),
                                          height: 230.h,
                                          child: ListView.separated(
                                            shrinkWrap: true,
                                            scrollDirection: Axis.vertical,
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 20.w),
                                            itemBuilder: (BuildContext context,
                                                    int index) =>
                                                Column(
                                              children: [
                                                InkWell(
                                                  onTap: () {
                                                    Get.to(
                                                      () =>
                                                          const UserProfileScreen(),
                                                      transition: Transition
                                                          .rightToLeftWithFade,
                                                      duration: const Duration(
                                                          milliseconds: 500),
                                                    );
                                                  },
                                                  child: Container(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 20.w,
                                                            vertical: 20.h),
                                                    width:
                                                        MediaQuery.of(context)
                                                            .size
                                                            .width,
                                                    decoration: BoxDecoration(
                                                      color: Colors.white,
                                                      borderRadius:
                                                          const BorderRadius
                                                                  .all(
                                                              Radius.circular(
                                                                  15)),
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
                                                    child: Column(
                                                      children: [
                                                        Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Column(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .center,
                                                              children: [
                                                                Text(
                                                                  "${controller.selectedStation!.users![index].user!.prenom} ${controller.selectedStation!.users![index].user!.nom}",
                                                                  style: TextStyle(
                                                                      color:
                                                                          darkColor,
                                                                      fontSize:
                                                                          15.sp,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold),
                                                                  textAlign:
                                                                      TextAlign
                                                                          .left,
                                                                ),
                                                                SizedBox(
                                                                  width: 150.w,
                                                                  child: Text(
                                                                    "${controller.selectedStation!.users![index].user!.email} ",
                                                                    maxLines: 1,
                                                                    overflow:
                                                                        TextOverflow
                                                                            .ellipsis,
                                                                    style:
                                                                        TextStyle(
                                                                      color:
                                                                          darkColor,
                                                                      fontSize:
                                                                          15.sp,
                                                                    ),
                                                                    textAlign:
                                                                        TextAlign
                                                                            .left,
                                                                  ).tr(),
                                                                )
                                                              ],
                                                            ),
                                                            Column(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .center,
                                                              children: [
                                                                Center(
                                                                    child:
                                                                        Container(
                                                                  height: 32.h,
                                                                  width: 32.h,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    gradient:
                                                                        cardGradient,
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            500.r),
                                                                  ),
                                                                  child: Icon(
                                                                    IconlyLight
                                                                        .arrow_right,
                                                                    size: 13.sp,
                                                                    color: Colors
                                                                        .white,
                                                                  ),
                                                                )),
                                                              ],
                                                            ),
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            itemCount: controller
                                                .selectedStation!.users!
                                                .where((element) =>
                                                    element
                                                        .user!.profile!.nom ==
                                                    "USER")
                                                .toList()
                                                .length,
                                            separatorBuilder:
                                                (BuildContext context,
                                                        int index) =>
                                                    10.verticalSpace,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          );
                  }),
            ),
          ),
        ],
      ),
    );
  }
}
