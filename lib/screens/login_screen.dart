import 'package:easy_localization/easy_localization.dart';
import 'package:estation/components/appVars.dart';
import 'package:estation/components/widgets.dart';
import 'package:estation/controllers/login_controller.dart';
import 'package:estation/screens/forget_password.dart';
import 'package:estation/utils/connectivity_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconly/iconly.dart';
import 'package:wave/config.dart';
import 'package:wave/wave.dart';

import 'package:get/get.dart';


class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(
        init: LoginController(),
        builder: (controller) {
          return connectivityWrapper(
            Scaffold(
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
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30),
                            topRight: Radius.circular(30),
                          ),
                        ),
                        child: Center(
                          child: SingleChildScrollView(
                            physics: const BouncingScrollPhysics(),
                            child: Column(children: [
                              Padding(
                                  padding: EdgeInsets.all(0.w),
                                  child: Container(
                                      width: MediaQuery.of(context).size.width,
                                      margin: const EdgeInsets.only(
                                          left: 30, right: 30),
                                      child: SizedBox(
                                        width: 390.w,
                                        child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              MediaQuery.of(context)
                                                          .viewInsets.bottom ==
                                                      0
                                                  ? Text(
                                                      "welcome",
                                                      style: primaryStyle,
                                                    ).tr()
                                                  : Container(),
                                              SizedBox(
                                                  width: 212.w,
                                                  child: Center(
                                                    child: Text("connect",
                                                            textAlign: TextAlign
                                                                .center,
                                                            style:
                                                                secondaryStyle)
                                                        .tr(),
                                                  )),
                                              46.33.verticalSpace,
                                              PrimaryTextField(
                                                controller:
                                                    controller.emailController,
                                                hintText: "enteremail",
                                                prefixIcon: const Icon(
                                                  IconlyLight.message,
                                                  color: Color(0xff14213D),
                                                ),
                                              ),
                                              22.verticalSpace,
                                              PrimaryTextField(
                                                controller: controller
                                                    .passwordController,
                                                visibility: true,
                                                hintText: "enterpassword",
                                                prefixIcon: const Icon(
                                                  IconlyLight.lock,
                                                  color: Color(0xff14213D),
                                                ),
                                              ),
                                              30.verticalSpace,
                                              PrimaryButton(
                                                loading:
                                                    controller.loading.value,
                                                text: "login",
                                                onpress: () {
                                                  controller.submit();
                                                },
                                              ),
                                              Center(
                                                child: TextButton(
                                                    onPressed: () {
                                                      Get.to(
                                                          () =>
                                                              const ForgetPasswordScreen(),
                                                          transition: Transition
                                                              .rightToLeft);
                                                    },
                                                    child: Text(
                                                      "forgotpassword",
                                                      style: TextStyle(
                                                        color: primaryColor,
                                                        fontSize: 12.sp,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                      ),
                                                      textAlign:
                                                          TextAlign.center,
                                                    ).tr()),
                                              )
                                            ]),
                                      )))
                            ]),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          );
        });
  }
}
