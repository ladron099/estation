import 'package:estation/components/appVars.dart';
import 'package:estation/components/widgets.dart';
import 'package:estation/utils/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class AdminHomeScreen extends StatelessWidget {
  const AdminHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> _key = GlobalKey();
    return Scaffold(
      key: _key,
      extendBodyBehindAppBar: true,
      drawer: DrawerWidget(),
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            _key.currentState!.openDrawer();
          },
          child: Icon(
            Icons.menu,
            color: Colors.white,
          ),
        ),
        flexibleSpace: Container(
          decoration: BoxDecoration(gradient: gradientColor),
        ),
        title: Image.asset(
          'assets/img/logoWhite.png',
          width: 140.w,
        ),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () => {
                   Get.defaultDialog(
                                  title: 'Logout',
                                  contentPadding: EdgeInsets.all(20.w),
                                  titlePadding: EdgeInsets.only(top: 20.w),
                                  middleText:
                                      "Are you sure you want to logout?",
                                  textConfirm: "Yes",
                                  textCancel: "No",
                                  titleStyle: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20.sp),
                                  onConfirm: () => {logout()})
              },
              icon: const Icon(Icons.logout_rounded, color: Colors.white))
        ],
      ),
    );
  }
}
