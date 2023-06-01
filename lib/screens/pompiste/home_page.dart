import 'package:easy_localization/easy_localization.dart';
import 'package:estation/components/appVars.dart';
import 'package:estation/components/widgets.dart';
import 'package:estation/controllers/pompiste/home_page.dart';
import 'package:estation/utils/services.dart';
import 'package:flutter/material.dart';
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
                      decoration: const BoxDecoration(
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
                      child: SingleChildScrollView(
                        physics: const BouncingScrollPhysics(),
                        child: Column(
                          children: [
                            40.verticalSpace,
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 30.w),
                              child: Container(
                                width: double.infinity,
                                height: 100.h,
                                decoration: BoxDecoration(
                                  gradient: lightGradientColor,
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
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 19),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      !controller.loading.value
                                          ? Text(
                                              plural('welcomeuser', 0, args: [
                                                controller.user!.nom!
                                              ]),
                                              style: whiteTitle,
                                              textAlign: TextAlign.left,
                                            ).tr()
                                          : Text(
                                              'welcome',
                                              style: whiteTitle,
                                              textAlign: TextAlign.left,
                                            ).tr(),
                                      5.verticalSpace,
                                      SizedBox(
                                        width: 221.w,
                                        child: Text(
                                          "welcomemsg",
                                          style: whiteText,
                                          textAlign: TextAlign.left,
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 2,
                                        ).tr(),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            44.verticalSpace,
                              Container(
                                width: MediaQuery.of(context).size.width,
                                margin: EdgeInsets.only(left: 30.h, right: 30.h),
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
                                  padding: EdgeInsets.symmetric(horizontal: 30.w),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      20.verticalSpace,
                                      Text(
                                        "releve",
                                        style: primaryStyle,
                                        textAlign: TextAlign.left,
                                      ).tr(),
                                      5.verticalSpace,
                                      controller.myPompes.isEmpty
                                          ? Column(
                                              children: [
                                                100.verticalSpace,
                                                Center(
                                                  child: Text(
                                                    "no_pompes_assigned_to_user",
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                      fontSize: 18.sp,
                                                      fontWeight: FontWeight.w500,
                                                      color: Colors.grey,
                                                    ),
                                                  ).tr(),
                                                ),
                                                100.verticalSpace,
                                              ],
                                            )
                                          : Text(
                                              "There are summaries",
                                              style: primaryText,
                                              textAlign: TextAlign.left,
                                            ).tr(),
                                      40.verticalSpace,
                                      ListView.separated(
                                        padding:
                                            EdgeInsets.symmetric(horizontal: 0.w),
                                        shrinkWrap: true,
                                        scrollDirection: Axis.vertical,
                                        itemCount: controller.myPompes.length,
                                        itemBuilder:
                                            (BuildContext context, int index) {
                                          return ReleveBox(
                                              press: () {
                                                controller.changeData(
                                                    controller.myPompes[index]);
                                              },
                                              pompeId:
                                                  "${controller.myPompes[index].pompe!.nomPompe} :  ${controller.myPompes[index].pompe!.idPompe}",
                                              verified: controller
                                                  .myPompes[index].releve!);
                                        },
                                        separatorBuilder:
                                            (BuildContext context, int index) {
                                          return 21.verticalSpace;
                                        },
                                      ),
                                      30.verticalSpace,
                                    ],
                                  ),
                                ),
                              ),
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
