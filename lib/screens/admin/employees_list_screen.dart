import 'package:easy_localization/easy_localization.dart';
import 'package:estation/components/appVars.dart';
import 'package:estation/components/widgets.dart';
import 'package:estation/controllers/admin/employees_list_controller.dart';
import 'package:estation/utils/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class EmployeesListScreen extends StatelessWidget {
  const EmployeesListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> key = GlobalKey();
    return Scaffold(
      backgroundColor: blueColor,
      key: key,
      extendBodyBehindAppBar: true,
      drawer: const DrawerWidget(),
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            key.currentState!.openDrawer();
          },
          child: const Icon(
            Icons.menu,
            color: Colors.white,
          ),
        ),
        backgroundColor: blueColor,
        elevation: 0,
        title: Image.asset(
          'assets/img/logoWhite.png',
          width: 140.w,
        ),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () => {logout()},
              icon: const Icon(Icons.logout_rounded, color: Colors.white))
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
                  color: blueColor,
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 110.h),
                width: double.infinity,
                height: double.infinity,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: GetBuilder<EmployeesListController>(
                      init: EmployeesListController(),
                      builder: (controller) {
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            20.verticalSpace,
                            DropDownMenu(
                              items: controller.dropdownSexeItems,
                              listItem: controller.sexe,
                              function: (value) {
                                controller.dropDownMenuChange(value);
                                controller.update();
                              },
                            ),
                            25.verticalSpace,
                            // Padding(
                            //   padding: EdgeInsets.symmetric(horizontal: 20.w),
                            //   child: Row(
                            //     mainAxisAlignment:
                            //         MainAxisAlignment.spaceBetween,
                            //     children: [
                            //       Text(
                            //         'employees',
                            //         style: TextStyle(
                            //           color: blueColor,
                            //           fontSize: 20.sp,
                            //           fontWeight: FontWeight.w600,
                            //         ),
                            //       ).tr(),
                            //       InkWell(
                            //         onTap: () {
                            //           Get.to(() => ScanScreen());
                            //         },
                            //         child: Container(
                            //           padding: EdgeInsets.symmetric(
                            //               horizontal: 20.w, vertical: 10.h),
                            //           decoration: BoxDecoration(
                            //             color: blueColor,
                            //             borderRadius: BorderRadius.circular(10),
                            //           ),
                            //           child: Row(
                            //             children: [
                            //               Icon(
                            //                 IconlyBold.plus,
                            //                 color: Colors.white,
                            //                 size: 20.sp,
                            //               ),
                            //               10.horizontalSpace,
                            //               Text(
                            //                 'add',
                            //                 style: TextStyle(
                            //                   color: Colors.white,
                            //                   fontSize: 16.sp,
                            //                   fontWeight: FontWeight.w600,
                            //                 ),
                            //               ),
                            //             ],
                            //           ),
                            //         ),
                            //       ),
                            //     ],
                            //   ),
                            // ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 20.0.w),
                              child: Text(
                                'manager',
                                style: primaryStyle,
                              ).tr(),
                            ),
                            20.verticalSpace,
                            // ListView.builder(
                            //   scrollDirection: Axis.horizontal,
                            //   itemCount: 10,
                            //   shrinkWrap: true,
                            //   itemBuilder: (BuildContext context, int index) {
                            //     return Container(
                            //       width: 150.w,
                            //       height: 150.w,
                            //       decoration: BoxDecoration(
                            //           gradient: lightGradientColor),
                            //     );
                            //   },
                            // )
                          ],
                        );
                      }),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
