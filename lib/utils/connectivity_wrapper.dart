import 'package:connectivity_wrapper/connectivity_wrapper.dart';
import 'package:estation/components/appVars.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

connectivityWrapper(Widget child) {
  return Material(
    color: Colors.white,
    child: ConnectivityWidgetWrapper(
      alignment: Alignment.center,
      stacked: false,
      offlineWidget: Column(
        children: [
          80.verticalSpace,
          Image.asset(
            'assets/img/logoBlack.png',
            height: 50.h,
          ),
          80.verticalSpace,
          Image.asset(
            'assets/img/no_connection.jpg',
            height: 260.h,
          ),
          10.verticalSpace,
          Text(
            'Whoopsie!',
            style: TextStyle(
                fontFamily: 'LatoBold', fontSize: 36.sp, color: primaryColor),
          ),
          20.verticalSpace,
          Text(
            "Please verify your internet connection!",
            style: TextStyle(
                fontFamily: 'LatoSemiBold',
                fontSize: 14.sp,
                color: primaryColor),
          ),
          80.verticalSpace,
        ],
      ),
      disableInteraction: true,
      child: child,
    ),
  );
}
