import 'package:easy_localization/easy_localization.dart';
import 'package:estation/components/appVars.dart';
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
  PrimaryTextField({
    required this.hintText,
    this.controller,
    this.prefixIcon,
    this.visibility = false,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 52.h,
      child: TextFormField(
        controller: controller,
        obscureText: visibility ?? false,
        textAlign: TextAlign.center,
        decoration: InputDecoration(
          contentPadding:
              EdgeInsets.symmetric(horizontal: 20.w, vertical: 15.h),
          filled: true,
          fillColor: Color(0xff1E293B).withOpacity(0.04),
          prefixIconColor: Color(0xff14213D),
          hintText: tr(hintText),
          hintStyle: hintStyle,
          border: OutlineInputBorder(
            borderSide: BorderSide(
              color: Color(0xff1E293B).withOpacity(0.2),
            ),
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

  PrimaryButton({required this.text, required this.onpress, super.key});

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
                onpress();
              },
              child: Text(
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
