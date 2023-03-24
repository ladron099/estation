import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

final supportedLocales = [
  Locale('en'),
  Locale('fr'),
];

final primaryColor = Color(0xff6366F1);
final darkColor = Color(0xff1E293B);
final dangerColor = Color(0xffEF233C);
final successColor = Color(0xff3ECB98);
final secondaryColor = Color(0xff342BC5);
final blueColor = Color(0xff231F63);
final darkBlueColor = Color(0xff13103C);
const gradientColor =  LinearGradient(
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
  colors: [
    Color(0xff231F63),
    Color(0xff13103C),
  ],
);
const lightGradientColor =  LinearGradient(
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
  colors: [
    Color(0xff6366F1),
    Color(0xff342BC5),
  ],
);
final primaryStyle = TextStyle(
    color: darkColor,
    fontSize: 23.5.sp,
    fontWeight: FontWeight.w700,
    fontFamily: 'inter');
final primaryText = TextStyle(
    color: darkColor,
    fontSize: 13.sp,
    fontWeight: FontWeight.w300,
    fontFamily: 'inter');
final primaryTitle = TextStyle(
    color: darkColor,
    fontSize: 13.sp,
    fontWeight: FontWeight.bold,
    fontFamily: 'inter');
final dangerText = TextStyle(
    color: dangerColor,
    fontSize: 13.sp,
    fontWeight: FontWeight.w300,
    fontFamily: 'inter');
final successText = TextStyle(
    color: successColor,
    fontSize: 13.sp,
    fontWeight: FontWeight.w300,
    fontFamily: 'inter');
final secondaryStyle = TextStyle(
    color: darkColor,
    fontSize: 19.05.sp,
    fontWeight: FontWeight.w300,
    fontFamily: 'inter');
final whiteText = TextStyle(
    color: Colors.white,
    fontSize: 12.sp,
    fontWeight: FontWeight.w300,
    fontFamily: 'inter');
final whiteTitle = TextStyle(
    color: Colors.white,
    fontSize: 18.05.sp,
    fontWeight: FontWeight.bold,
    fontFamily: 'inter');
final hintStyle = TextStyle(
    color: Colors.black.withOpacity(0.5),
    fontSize: 13.sp,
    fontWeight: FontWeight.w500,
    fontFamily: 'inter');
