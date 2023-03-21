import 'package:easy_localization/easy_localization.dart';
import 'package:estation/components/appVars.dart';
import 'package:estation/components/widgets.dart';
import 'package:estation/controllers/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:iconly/iconly.dart';
import 'package:wave/config.dart';
import 'package:wave/wave.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: LoginController(),
        builder: (controller) {
          return Scaffold(
              bottomNavigationBar: BottomAppBar(
                padding: EdgeInsets.symmetric(horizontal: 0.w),
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
                elevation: 0,
              ),
              body: Container(
                width: 390.w,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 36.w),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Container(
                              width: 29.51.w,
                              height: 29.51.h,
                              decoration: BoxDecoration(
                                color: primaryColor,
                                borderRadius: BorderRadius.circular(100.r),
                              ),
                            ),
                            13.9.horizontalSpace,
                            Text(
                              'E-Station',
                              style: primaryStyle,
                            ),
                          ],
                        ),
                        57.verticalSpace,
                        Text(
                          "welcome",
                          style: primaryStyle,
                        ).tr(),
                        SizedBox(
                            width: 212.w,
                            child: Text("connect", style: secondaryStyle).tr()),
                        46.33.verticalSpace,
                        PrimaryTextField(
                          controller: controller.emailController,
                          hintText: "enteremail",
                          prefixIcon: Icon(
                            IconlyLight.message,
                            color: Color(0xff14213D),
                          ),
                        ),
                        22.verticalSpace,
                        PrimaryTextField(
                          controller: controller.passwordController,
                          visibility: true,
                          hintText: "enterpassword",
                          prefixIcon: Icon(
                            IconlyLight.lock,
                            color: Color(0xff14213D),
                          ),
                        ),
                        55.verticalSpace,
                        PrimaryButton(
                          text: "login",
                          onpress: () {
                            controller.submit();
                          },
                        ),
                      ]),
                ),
              ));
        });
  }
}
