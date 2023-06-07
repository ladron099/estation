import 'package:easy_localization/easy_localization.dart';
import 'package:estation/components/appVars.dart';
import 'package:estation/components/widgets.dart';
import 'package:estation/controllers/admin/product_list_controller.dart';
import 'package:estation/screens/admin/products_screen.dart';
import 'package:estation/utils/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ProductListScreen extends StatelessWidget {
  const ProductListScreen({super.key});

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
              color: backgroundColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
            ),
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: GetBuilder<ProductListController>(
                  init: ProductListController(),
                  builder: (controller) {
                    return controller.loading.value
                        ? Padding(
                            padding: EdgeInsets.only(top: 700.h / 2),
                            child: LodingWidget(),
                          )
                        : Padding(
                            padding: EdgeInsets.symmetric(horizontal: 26.0.w),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                20.verticalSpace,
                                DropDownMenu(
                                  items: controller.dropdownItems,
                                  listItem: controller.selectedStation,
                                  function: (value) {
                                    controller.dropDownMenuChange(value);
                                    controller.update();
                                  },
                                ),
                                25.verticalSpace,
                                Text(
                                  'products',
                                  style: TextStyle(
                                      color: darkColor,
                                      fontSize: 19.5.sp,
                                      fontWeight: FontWeight.w700,
                                      fontFamily: 'inter'),
                                ).tr(),
                                10.verticalSpace,
                                Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20.r)),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.25),
                                        spreadRadius: -1,
                                        blurRadius: 7,
                                        offset: const Offset(
                                            0, 0), // changes position of shadow
                                      ),
                                    ],
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      25.verticalSpace,
                                      controller.products.isEmpty
                                          ? Center(
                                              child: const Text("nodata").tr(),
                                            )
                                          : Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Container(
                                                constraints: BoxConstraints(
                                                    minHeight: 230.h),
                                                height: 447.h,
                                                child: ListView.separated(
                                                  shrinkWrap: true,
                                                  scrollDirection:
                                                      Axis.vertical,
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: 20.w),
                                                  itemBuilder:
                                                      (BuildContext context,
                                                              int index) =>
                                                          Padding(
                                                    padding: const EdgeInsets
                                                            .symmetric(
                                                        horizontal: 8.0),
                                                    child: InkWell(
                                                      onTap: () {
                                                        Get.to(
                                                            () =>
                                                                const ProductsScreen(),
                                                            arguments: [
                                                              controller
                                                                      .products[
                                                                  index],
                                                              controller
                                                                  .selectedStation!
                                                                  .nomStation
                                                            ],
                                                            transition:
                                                                Transition
                                                                    .fadeIn,
                                                            duration:
                                                                const Duration(
                                                                    milliseconds:
                                                                        500));
                                                      },
                                                      child: Container(
                                                        padding: EdgeInsets
                                                            .symmetric(
                                                                horizontal:
                                                                    18.w,
                                                                vertical: 19.h),
                                                        width: MediaQuery.of(
                                                                context)
                                                            .size
                                                            .width,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: Colors.white,
                                                          borderRadius:
                                                              const BorderRadius
                                                                      .all(
                                                                  Radius
                                                                      .circular(
                                                                          15)),
                                                          boxShadow: [
                                                            BoxShadow(
                                                              color: Colors.grey
                                                                  .withOpacity(
                                                                      0.25),
                                                              spreadRadius: -1,
                                                              blurRadius: 7,
                                                              offset: const Offset(
                                                                  0,
                                                                  0), // changes position of shadow
                                                            ),
                                                          ],
                                                        ),
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Column(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .center,
                                                              children: [
                                                                SizedBox(
                                                                  width: 100.w,
                                                                  child: Text(
                                                                    controller
                                                                        .products[
                                                                            index]
                                                                        .nomProduit!,
                                                                    maxLines: 2,
                                                                    style: TextStyle(
                                                                        color:
                                                                            darkColor,
                                                                        fontSize: 15
                                                                            .sp,
                                                                        fontWeight:
                                                                            FontWeight.bold),
                                                                    textAlign:
                                                                        TextAlign
                                                                            .left,
                                                                  ),
                                                                ),
                                                                SizedBox(
                                                                  width: 100.w,
                                                                  child: Text(
                                                                    "${controller.products[index].prixAchat!} MAD",
                                                                    maxLines: 2,
                                                                    style:
                                                                        TextStyle(
                                                                      color:
                                                                          darkColor,
                                                                      fontSize:
                                                                          15.sp,
                                                                    ),
                                                                    textAlign:
                                                                        TextAlign
                                                                            .left,
                                                                  ).tr(),
                                                                )
                                                              ],
                                                            ),
                                                            const Spacer(),
                                                            Column(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .center,
                                                              children: [
                                                                Text(
                                                                  controller
                                                                      .products[
                                                                          index]
                                                                      .service!
                                                                      .nomService!,
                                                                  maxLines: 2,
                                                                  style: TextStyle(
                                                                      color:
                                                                          darkColor,
                                                                      fontSize:
                                                                          13.sp,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold),
                                                                  textAlign:
                                                                      TextAlign
                                                                          .left,
                                                                ).tr(),
                                                                Text(
                                                                  controller
                                                                      .products[
                                                                          index]
                                                                      .type!
                                                                      .nomType!
                                                                      .toString(),
                                                                  maxLines: 2,
                                                                  style:
                                                                      TextStyle(
                                                                    color:
                                                                        darkColor,
                                                                    fontSize:
                                                                        15.sp,
                                                                  ),
                                                                  textAlign:
                                                                      TextAlign
                                                                          .left,
                                                                ).tr()
                                                              ],
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  itemCount: controller
                                                      .products.length,
                                                  separatorBuilder:
                                                      (BuildContext context,
                                                              int index) =>
                                                          10.verticalSpace,
                                                ),
                                              ),
                                            ),
                                      25.verticalSpace,
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          );
                  }),
            ),
          ),
        ],
      ),
    );
  }
}
