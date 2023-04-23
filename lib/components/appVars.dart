import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

final supportedLocales = [
  const Locale('en'),
  const Locale('fr'),
];

const primaryColor = Color(0xff4F46E5);
const darkColor = Color(0xff1E293B);
const dangerColor = Color(0xffEF233C);
const successColor = Color(0xff3ECB98);
const secondaryColor = Color(0xff342BC5);
const blueColor = Color(0xff231F63);
const darkBlueColor = Color(0xff13103C);
const gradientColor = LinearGradient(
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
  colors: [
    blueColor,
    Color(0xff13103C),
  ],
);
final cardGradient = LinearGradient(
  begin: Alignment.centerRight,
  end: Alignment.centerLeft,
 colors: [
    primaryColor,
    primaryColor.withOpacity(0.6)
  ]);
const lightGradientColor = LinearGradient(
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

String apiUrl = "https://estation-api.herokuapp.com/api";
