import 'package:easy_localization/easy_localization.dart';
import 'package:estation/components/appVars.dart';
import 'package:estation/components/widgets.dart';
import 'package:estation/controllers/pompiste/scan_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';

class ScanScreen extends StatelessWidget {
  const ScanScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ScanController>(
        init: ScanController(),
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
                        onPressed: () => {},
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
                        color: backgroundColor,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30),
                        ),
                      ),
                      child: SingleChildScrollView(
                        physics: const BouncingScrollPhysics(),
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 32.w, vertical: 37.h),
                                    child: InkWell(
                                      onTap: () {
                                        Get.back();
                                      },
                                      child: const Icon(
                                        IconlyLight.arrow_left_circle,
                                        color: Color(0xff14213D),
                                      ),
                                    ),
                                  ),
                                  80.horizontalSpace,
                                  Text(
                                    "receipt",
                                    style: TextStyle(
                                      fontSize: 18.sp,
                                      fontWeight: FontWeight.w700,
                                      color: const Color(0xff14213D),
                                    ),
                                  ).tr(),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.all(0),
                                child: Center(
                                  child: Text(
                                    "Pompe ID",
                                    style: TextStyle(
                                      fontSize: 18.sp,
                                      fontFamily: '',
                                      fontWeight: FontWeight.w400,
                                      color: const Color(0xff14213D),
                                    ),
                                  ),
                                ),
                              ),
                              55.verticalSpace,
                              InkWell(
                                  onTap: () {
                                    if (controller.loadingImage.value ==
                                            false &&
                                        controller.loading.value == false) {
                                      controller.selectImage();
                                    }
                                  },
                                  child: controller.image == null
                                      ? SizedBox(
                                          width: 300.w,
                                          height: 200.h,
                                          child: controller.loadingImage.value
                                              ? Container(
                                                  width: 24,
                                                  height: 24,
                                                  padding:
                                                      const EdgeInsets.all(2.0),
                                                  child: const Center(
                                                    child:
                                                        CircularProgressIndicator(
                                                      color: Color(0xff342BC5),
                                                      strokeWidth: 3,
                                                    ),
                                                  ),
                                                )
                                              : Image(
                                                  height: 200.h,
                                                  image: const AssetImage(
                                                      "assets/img/card.png"),
                                                ),
                                        )
                                      : SizedBox(
                                          width: 300.w,
                                          height: 200.h,
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(12),
                                            child: controller.loadingImage.value
                                                ? Container(
                                                    width: 24,
                                                    height: 24,
                                                    padding:
                                                        const EdgeInsets.all(
                                                            2.0),
                                                    child: const Center(
                                                      child:
                                                          CircularProgressIndicator(
                                                        color:
                                                            Color(0xff342BC5),
                                                        strokeWidth: 3,
                                                      ),
                                                    ),
                                                  )
                                                : Image.file(
                                                    controller.imageFile!,
                                                    fit: BoxFit.cover,
                                                  ),
                                          ),
                                        )),
                              4.verticalSpace,
                              Center(
                                  child: InkWell(
                                onTap: () {
                                  if (controller.loadingImage.value == false &&
                                      controller.loading.value == false) {
                                    controller.selectImage();
                                  }
                                },
                                child: Text(
                                  "taphere",
                                  style: TextStyle(
                                      color: primaryColor.withOpacity(0.8)),
                                ).tr(),
                              )),
                              30.verticalSpace,
                              Text(
                                'verifynumber',
                                style: secondaryStyle,
                                textAlign: TextAlign.center,
                              ).tr(),
                              17.verticalSpace,
                              Padding(
                                padding:
                                    EdgeInsets.symmetric(horizontal: 102.w),
                                child: PrimaryTextField(
                                  controller: controller.number,
                                  centered: false,
                                  hintText: '1979',
                                ),
                              ),
                              35.verticalSpace,
                              SizedBox(
                                  width: 150.w,
                                  child: PrimaryButton(
                                      loading: controller.loading.value,
                                      text: 'submit',
                                      onpress: () {
                                        controller.submit();
                                      }))
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
