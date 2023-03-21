import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

final supportedLocales = [
  Locale('en'),
  Locale('fr'),
];

final primaryColor = Color(0xff6366F1);
final darkColor = Color(0xff1E293B);
final dangerColor = Color(0xffEF233C);
final secondaryColor = Color(0xff342BC5);
final primaryStyle = TextStyle(
    color: darkColor,
    fontSize: 23.5.sp,
    fontWeight: FontWeight.w700,
    fontFamily: 'inter');
final secondaryStyle = TextStyle(
    color: darkColor,
    fontSize: 19.05.sp,
    fontWeight: FontWeight.w300,
    fontFamily: 'inter');

final hintStyle = TextStyle(
    color: Colors.black.withOpacity(0.5),
    fontSize: 12.sp,
    fontWeight: FontWeight.w500,
    fontFamily: 'inter');
