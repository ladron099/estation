import 'dart:ui';

import 'package:easy_localization/easy_localization.dart';
import 'package:estation/components/appVars.dart';
import 'package:estation/screens/admin/admin_home_screen.dart';
import 'package:estation/screens/admin/employees_list_screen.dart';
import 'package:estation/screens/pompiste/scan_info.dart';
import 'package:estation/utils/models/ListItem.dart';
import 'package:estation/utils/services.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class PrimaryTextField extends StatelessWidget {
  String hintText;
  TextEditingController? controller;
  Icon? prefixIcon;
  bool? visibility;
  bool? centered;
  PrimaryTextField({
    required this.hintText,
    this.controller,
    this.prefixIcon,
    this.visibility = false,
    this.centered = true,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 52.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14.r),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.50),
            spreadRadius: -1,
            blurRadius: 7,
            offset: const Offset(0, 0), // changes position of shadow
          ),
        ],
      ),
      child: TextFormField(
        controller: controller,
        obscureText: visibility ?? false,
        textAlign: centered == true ? TextAlign.center : TextAlign.start,
        decoration: InputDecoration(
          contentPadding:
              EdgeInsets.symmetric(horizontal: 20.w, vertical: 15.h),
          filled: true,
          fillColor: const Color.fromARGB(255, 243, 243, 243),
          prefixIconColor: const Color(0xff14213D),
          hintText: tr(hintText),
          hintStyle: hintStyle,
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(10.r),
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(10.r),
          ),
          prefixIcon: prefixIcon,
        ),
      ),
    );
  }
}

class PrimaryButton extends StatelessWidget {
  String text;
  VoidCallback onpress;
  bool? loading;

  PrimaryButton(
      {required this.text, required this.onpress, this.loading, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.w),
      child: Center(
        child: SizedBox(
          width: double.infinity,
          height: 49.h,
          child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: primaryColor,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.r))),
              onPressed: () {
                loading == true ? null : onpress();
              },
              child: loading == true
                  ? Container(
                      width: 24.w,
                      height: 24.h,
                      padding: const EdgeInsets.all(2.0),
                      child: const CircularProgressIndicator(
                        color: Colors.white,
                        strokeWidth: 3,
                      ),
                    )
                  : Text(
                      text,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w300,
                          fontFamily: 'inter'),
                    ).tr()),
        ),
      ),
    );
  }
}

class ReleveButton extends StatelessWidget {
  Icon icon;
  VoidCallback onpress;

  ReleveButton({required this.icon, required this.onpress, super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onpress();
      },
      child: Container(
        alignment: Alignment.center,
        width: 45.w,
        height: 45.h,
        decoration: BoxDecoration(
          color: primaryColor,
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: Center(child: icon),
      ),
    );
  }
}

class LodingWidget extends StatelessWidget {
  bool hasHeight;
  bool isFullPage;
  LodingWidget({
    super.key,
    this.hasHeight = false,
    this.isFullPage = false,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: hasHeight
            ? isFullPage
                ? 812.h
                : 630.h
            : 40.h,
        child: LoadingAnimationWidget.inkDrop(
          color: primaryColor,
          size: 40.h,
        ),
      ),
    );
  }
}

class ReleveBox extends StatelessWidget {
  bool verified;
  ReleveBox({required this.verified, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(0.w),
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: 78.h,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: const BorderRadius.all(Radius.circular(20)),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.25),
                spreadRadius: -1,
                blurRadius: 7,
                offset: const Offset(0, 0), // changes position of shadow
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Pompe ID",
                      style: primaryTitle,
                      textAlign: TextAlign.left,
                    ).tr(),
                    !verified
                        ? Text(
                            "notsubmitted",
                            style: dangerText,
                            textAlign: TextAlign.left,
                          ).tr()
                        : Text(
                            "receiptsubmitted",
                            style: successText,
                            textAlign: TextAlign.left,
                          ).tr(),
                  ],
                ),
              ),
              verified
                  ? Image.asset(
                      'assets/img/verified.png',
                      width: 110.w,
                    )
                  : Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15.w),
                      child: Center(
                        child: ReleveButton(
                          icon: Icon(
                            IconlyLight.camera,
                            color: Colors.white,
                            size: 20.sp,
                          ),
                          onpress: () => {
                            Get.to(
                              () => const ScanInfoScreen(),
                            )
                          },
                        ),
                      ),
                    )
            ],
          ),
        ));
  }
}

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 260.w,
      child: Drawer(
          elevation: 0,
          backgroundColor: blueColor,
          child: BackdropFilter(
              filter: ImageFilter.blur(
                sigmaX: 8,
                sigmaY: 8,
              ),
              child: Expanded(
                child: Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: blueColor,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        40.verticalSpace,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Image.asset(
                              'assets/img/logoWhite.png',
                              width: 120.w,
                            ),
                            InkWell(
                              onTap: () {
                                Get.back();
                              },
                              child: Icon(
                                IconlyLight.arrow_left_circle,
                                color: Colors.white,
                                size: 26.sp,
                              ),
                            )
                          ],
                        ),
                        80.verticalSpace,
                        InkWell(
                          onTap: () {
                            Get.back();
                            Get.to(() => const AdminHomeScreen());
                          },
                          child: Row(
                            children: [
                              Icon(
                                CupertinoIcons.home,
                                color: Colors.white,
                                size: 26.sp,
                              ),
                              20.horizontalSpace,
                              Text("home",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 16.05.sp,
                                          fontFamily: 'inter'))
                                  .tr()
                            ],
                          ),
                        ),
                        38.verticalSpace,
                        InkWell(
                          onTap: () {
                            Get.back();
                            Get.to(() => const EmployeesListScreen());
                          },
                          child: Row(
                            children: [
                              Icon(
                                IconlyBold.user_3,
                                color: Colors.white,
                                size: 26.sp,
                              ),
                              20.horizontalSpace,
                              Text("employees",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 16.05.sp,
                                          fontFamily: 'inter'))
                                  .tr()
                            ],
                          ),
                        ),
                        38.verticalSpace,
                        InkWell(
                          onTap: () {
                            Get.back();
                          },
                          child: Row(
                            children: [
                              Icon(
                                CupertinoIcons.drop_fill,
                                color: Colors.white,
                                size: 26.sp,
                              ),
                              20.horizontalSpace,
                              Text("citernes",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 16.05.sp,
                                          fontFamily: 'inter'))
                                  .tr()
                            ],
                          ),
                        ),
                        38.verticalSpace,
                        InkWell(
                          onTap: () {
                            Get.back();
                          },
                          child: Row(
                            children: [
                              Icon(
                                IconlyLight.more_square,
                                color: Colors.white,
                                size: 26.sp,
                              ),
                              20.horizontalSpace,
                              Text("products",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 16.05.sp,
                                          fontFamily: 'inter'))
                                  .tr()
                            ],
                          ),
                        ),
                        const Spacer(),
                        InkWell(
                          onTap: () {
                            Get.back();
                            logout();
                          },
                          child: Row(
                            children: [
                              Icon(
                                Icons.logout_rounded,
                                color: Colors.white,
                                size: 26.sp,
                              ),
                              20.horizontalSpace,
                              Text("logout",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 16.05.sp,
                                          fontFamily: 'inter'))
                                  .tr()
                            ],
                          ),
                        ),
                        40.verticalSpace
                      ],
                    ),
                  ),
                ),
              ))),
    );
  }
}

class DropDownMenu extends StatefulWidget {
  List<DropdownMenuItem<ListItem>>? items;
  ListItem? listItem;
  final Function(ListItem?)? function;

  DropDownMenu(
      {required this.items,
      required this.listItem,
      required this.function,
      Key? key})
      : super(key: key);

  @override
  State<DropDownMenu> createState() => _DropDownMenuState();
}

class _DropDownMenuState extends State<DropDownMenu> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Container(
        height: 60.h,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(25.r),
          border: Border.all(color: const Color(0xffAAAAAA), width: 1),
        ),
        child: Row(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: SizedBox(
                height: 65.h,
                width: 300.w,
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<ListItem>(
                    value: widget.listItem,
                    items: widget.items,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                    ),
                    iconSize: 20,
                    icon: const Icon(
                      CupertinoIcons.chevron_down,
                      color: Colors.black,
                    ),
                    iconEnabledColor: Colors.grey[800],
                    isExpanded: true,
                    onChanged: widget.function,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
