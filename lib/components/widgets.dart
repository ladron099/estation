import 'package:easy_localization/easy_localization.dart';
import 'package:estation/components/appVars.dart';
import 'package:estation/screens/pompiste/scan_info.dart'; 
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';

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
            offset: Offset(0, 0), // changes position of shadow
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
          fillColor: Color.fromARGB(255, 243, 243, 243),
          prefixIconColor: Color(0xff14213D),
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
                  primary: primaryColor,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.r))),
              onPressed: () {
                loading == true ? null : onpress();
              },
              child: loading == true
                  ? Container(
                      width: 24,
                      height: 24,
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
                offset: Offset(0, 0), // changes position of shadow
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
                              () => ScanInfoScreen(),
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
