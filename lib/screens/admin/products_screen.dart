import 'package:easy_localization/easy_localization.dart';
import 'package:estation/components/appVars.dart';
import 'package:estation/components/widgets.dart';
import 'package:estation/utils/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({super.key});

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
              color: backgroundColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
            ),
            child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30.w),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      25.verticalSpace,
                      InkWell(
                        onTap: () {
                          Get.back();
                        },
                        child: const Icon(
                          IconlyLight.arrow_left_circle,
                          color: Color(0xff14213D),
                        ),
                      ),
                      8.verticalSpace,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Row(
                            children: [
                              Text(
                                'Type :',
                                style: TextStyle(
                                  color: const Color(0xff14213D),
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              Text(
                                'type',
                                style: TextStyle(
                                  color: const Color(0xff14213D),
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                'Service :',
                                style: TextStyle(
                                  color: const Color(0xff14213D),
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              Text(
                                'service',
                                style: TextStyle(
                                  color: const Color(0xff14213D),
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      10.verticalSpace,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Row(
                            children: [
                              Text(
                                'price',
                                style: TextStyle(
                                  color: const Color(0xff14213D),
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              Text(
                                'price',
                                style: TextStyle(
                                  color: const Color(0xff14213D),
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                'Station :',
                                style: TextStyle(
                                  color: const Color(0xff14213D),
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              Text(
                                'station',
                                style: TextStyle(
                                  color: const Color(0xff14213D),
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      50.verticalSpace,
                      Container(
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(20.r)),
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
                          padding: EdgeInsets.symmetric(horizontal: 30.w),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              20.verticalSpace,
                              const Text(
                                "history",
                                style: TextStyle(
                                  color: Color(0xff14213D),
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700,
                                ),
                                textAlign: TextAlign.left,
                              ).tr(),
                              39.verticalSpace,
                              SizedBox(
                                height: 300.h,
                                width: double.infinity,
                                child: ListView.separated(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 0.w),
                                  shrinkWrap: true,
                                  scrollDirection: Axis.vertical,
                                  itemCount: 34,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 8.0),
                                      child: Container(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 32.w, vertical: 20.h),
                                        width:
                                            MediaQuery.of(context).size.width,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(15)),
                                          boxShadow: [
                                            BoxShadow(
                                              color:
                                                  Colors.grey.withOpacity(0.25),
                                              spreadRadius: -1,
                                              blurRadius: 7,
                                              offset: const Offset(0,
                                                  0), // changes position of shadow
                                            ),
                                          ],
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                SizedBox(
                                                  width: 100.w,
                                                  child: Text(
                                                    "Action",
                                                    maxLines: 2,
                                                    style: TextStyle(
                                                        color: darkColor,
                                                        fontSize: 15.sp,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                    textAlign: TextAlign.left,
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 100.w,
                                                  child: Text(
                                                    "12/10/23",
                                                    maxLines: 2,
                                                    style: TextStyle(
                                                      color: darkColor,
                                                      fontSize: 15.sp,
                                                    ),
                                                    textAlign: TextAlign.left,
                                                  ).tr(),
                                                )
                                              ],
                                            ),
                                            const Spacer(),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  "qty",
                                                  maxLines: 2,
                                                  style: TextStyle(
                                                      color: darkColor,
                                                      fontSize: 15.sp,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                  textAlign: TextAlign.left,
                                                ).tr(),
                                                Text(
                                                  "100",
                                                  maxLines: 2,
                                                  style: TextStyle(
                                                    color: darkColor,
                                                    fontSize: 15.sp,
                                                  ),
                                                  textAlign: TextAlign.left,
                                                ).tr()
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                  separatorBuilder:
                                      (BuildContext context, int index) {
                                    return 21.verticalSpace;
                                  },
                                ),
                              ),
                              30.verticalSpace,
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                )),
          ),
        ],
      ),
    );
  }
}
