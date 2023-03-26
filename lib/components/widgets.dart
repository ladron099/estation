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
    return Container(
      height: 52.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.r),
        boxShadow: [
          BoxShadow(
            color: Color.fromARGB(255, 187, 186, 186),
            blurRadius: 2.2, // soften the shadow
            spreadRadius: 1.0, //extend the shadow
            offset: Offset(
              1.0, // Move to right 10  horizontally
              0.10, // Move to bottom 10 Vertically
            ),
          )
        ],
      ),
      child: TextFormField(
        controller: controller,
        obscureText: visibility ?? false,
        textAlign: TextAlign.center,
        decoration: InputDecoration(
          contentPadding:
              EdgeInsets.symmetric(horizontal: 20.w, vertical: 15.h),
          filled: true,
          fillColor: Color.fromARGB(255, 241, 240, 240),
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

class ReleveButton extends StatelessWidget {
  String text;
  VoidCallback onpress;

  ReleveButton({required this.text, required this.onpress, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 0.w),
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              primary: primaryColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25.r))),
          onPressed: () {
            onpress();
          },
          child: Text(
            text,
            style: TextStyle(
                color: Colors.white,
                fontSize: 10.sp,
                fontWeight: FontWeight.w300,
                fontFamily: 'inter'),
          ).tr()),
    );
  }
}

class ReleveBox extends StatelessWidget {
  const ReleveBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(0.w),
        child: Container(
          width: MediaQuery.of(context).size.width,
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
          child: Card(
              elevation: 0,
              color: Colors.transparent,
              child: Padding(
                  padding: EdgeInsets.fromLTRB(15.w, 15.w, 15.w, 15.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Pompe ID",
                            style: primaryTitle,
                            textAlign: TextAlign.left,
                          ).tr(),
                          Text(
                            "Relevé non soumis",
                            style: dangerText,
                            textAlign: TextAlign.left,
                          ).tr(),
                        ],
                      ),
                      ReleveButton(
                        text: "Soumettre ->",
                        onpress: () => {},
                      )
                    ],
                  ))),
        ));
  }
}
