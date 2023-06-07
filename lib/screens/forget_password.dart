import 'package:easy_localization/easy_localization.dart';
import 'package:estation/components/appVars.dart';
import 'package:estation/components/widgets.dart';
import 'package:estation/controllers/forget_password.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconly/iconly.dart';
import 'package:wave/config.dart';
import 'package:wave/wave.dart';

import 'package:get/get.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ForgetPasswordController>(
        init: ForgetPasswordController(),
        builder: (controller) {
          return Scaffold(
            extendBodyBehindAppBar: true,
            bottomNavigationBar: BottomAppBar(
              padding: EdgeInsets.symmetric(horizontal: 0.w),
              elevation: 0,
              child: WaveWidget(
                config: CustomConfig(
                  colors: controller.colors,
                  durations: controller.durations,
                  heightPercentages: controller.heightPercentages,
                ),
                backgroundColor: controller.backgroundColor,
                size: const Size(double.infinity, double.infinity),
                waveAmplitude: 0,
              ),
            ),
            appBar: AppBar(
              automaticallyImplyLeading: false,
              toolbarHeight: 184.h,
              backgroundColor: Colors.transparent,
              title: Padding(
                padding: EdgeInsets.symmetric(vertical: 91.h),
                child: Image.asset(
                  "assets/img/logoWhite.png",
                  width: 140.w,
                ),
              ),
              centerTitle: true,
            ),
            body: Stack(
              children: [
                Stack(
                  children: <Widget>[
                    Container(
                      width: double.infinity,
                      height: 300.h,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/img/station-service.jpg"),
                          scale: 0.01,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      height: 300.h,
                      decoration: BoxDecoration(
                        color: const Color(0xff231F63).withOpacity(0.9),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 200.h),
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
                          child: Column(children: [
                            Padding(
                                padding: EdgeInsets.all(0.w),
                                child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      23.verticalSpace,
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          InkWell(
                                            onTap: () {
                                              Get.back();
                                            },
                                            child: const Icon(
                                              IconlyLight.arrow_left_circle,
                                              color: Color(0xff14213D),
                                            ),
                                          ),
                                          80.horizontalSpace,
                                          Text(
                                            "resetpassword",
                                            style: TextStyle(
                                              fontSize: 18.sp,
                                              fontWeight: FontWeight.w700,
                                              color: const Color(0xff14213D),
                                            ),
                                          ).tr(),
                                        ],
                                      ),
                                      80.verticalSpace,
                                      Center(
                                        child: Image(
                                          height: 105.h,
                                          image: const AssetImage(
                                              "assets/img/forgetpassword.png"),
                                        ),
                                      ),
                                      50.verticalSpace,
                                      PrimaryTextField(
                                        controller: controller.emailController,
                                        hintText: "enteremail",
                                        prefixIcon: const Icon(
                                          IconlyLight.message,
                                          color: Color(0xff14213D),
                                        ),
                                      ),
                                      30.verticalSpace,
                                      Center(
                                        child: SizedBox(
                                          width: 170.w,
                                          height: 40.h,
                                          child: PrimaryButton(
                                            text: "reset",
                                            onpress: () {
                                              controller.submit();
                                            },
                                          ),
                                        ),
                                      ),
                                    ]))
                          ]),
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
