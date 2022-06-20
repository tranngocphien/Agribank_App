import 'package:agribank_banking/components/button_border.dart';
import 'package:agribank_banking/components/widget_input.dart';
import 'package:agribank_banking/modules/information_lookup/screens/lookup_address/lookup_address_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../app_theme.dart';
import '../../../../utils/enums.dart';

class LookupAddressPage extends GetWidget<LookupAddressController> {
  const LookupAddressPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xFFF67D10),
          centerTitle: true,
          title: Text(
            'TRA CỨU ĐỊA ĐIỂM',
            style: Styles.baseNotoSansTS.copyWith(
                fontSize: 16, color: white, fontWeight: FontWeight.w600),
          ),
          elevation: 0,
        ),
        body: Obx(
          () => controller.loadStatus.value == AppLoadStatus.loading
              ? const Center(
                  child: CupertinoActivityIndicator(),
                )
              : SingleChildScrollView(
                  child: Container(
                    padding: EdgeInsets.all(width16),
                    child: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.all(width16),
                          decoration: BoxDecoration(
                              color: white,
                              borderRadius: BorderRadius.circular(width16)),
                          width: width,
                          child: Column(
                            children: [
                              WidgetInput(
                                controller: controller.controllerProvince,
                                text: 'Tỉnh/Thành phố',
                                suffixIcon: GestureDetector(
                                    onTap: () {
                                      Get.dialog(
                                          Dialog(
                                            insetPadding: EdgeInsets.zero,
                                            backgroundColor: Colors.transparent,
                                            child: Container(
                                              width: width * 0.9,
                                              height: height * 0.7,
                                              decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          width16)),
                                              child: SingleChildScrollView(
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Container(
                                                      width: width * 0.9,
                                                      height: height60,
                                                      decoration: BoxDecoration(
                                                          color: const Color(
                                                              0xFFF67D10),
                                                          borderRadius: BorderRadius.only(
                                                              topRight: Radius
                                                                  .circular(
                                                                      width16),
                                                              topLeft: Radius
                                                                  .circular(
                                                                      width16))),
                                                      child: Center(
                                                          child: Text(
                                                        "Chọn tỉnh/ thành phố",
                                                        style: Styles
                                                            .baseNotoSansTS
                                                            .copyWith(
                                                                fontSize: 18,
                                                                color: white,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600),
                                                      )),
                                                    ),
                                                    SizedBox(
                                                      height: height8,
                                                    ),
                                                    ...controller.provinces
                                                        .map((e) => InkWell(
                                                              onTap: () {
                                                                controller
                                                                    .province = e;
                                                                controller
                                                                    .controllerProvince
                                                                    .text = e.name;
                                                                Get.back();
                                                              },
                                                              child: Container(
                                                                padding:
                                                                    EdgeInsets.all(
                                                                        width8),
                                                                child: Text(
                                                                  e.name,
                                                                  style: Styles
                                                                      .baseNotoSansTS
                                                                      .copyWith(
                                                                          fontSize:
                                                                              16,
                                                                          fontWeight:
                                                                              FontWeight.w600),
                                                                ),
                                                              ),
                                                            ))
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                          useSafeArea: true);
                                    },
                                    child:
                                        const Icon(Icons.keyboard_arrow_down)),
                              ),
                              WidgetInput(
                                controller: controller.controllerDistrict,
                                text: 'Quận/Huyện',
                                suffixIcon: GestureDetector(
                                    onTap: () {
                                      if (controller.province == null) {
                                        Get.dialog(CupertinoAlertDialog(
                                          title: const Text('Thông báo'),
                                          content: const Text(
                                              'Vui lòng chọn Tỉnh/Thành phố'),
                                          actions: [
                                            CupertinoDialogAction(
                                              onPressed: () {
                                                Get.back();
                                              },
                                              child: const Text('Đồng ý'),
                                            )
                                          ],
                                        ));
                                      } else {
                                        Get.dialog(
                                            Dialog(
                                              insetPadding: EdgeInsets.zero,
                                              backgroundColor:
                                                  Colors.transparent,
                                              child: Container(
                                                width: width * 0.9,
                                                height: height * 0.7,
                                                decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            width16)),
                                                child: SingleChildScrollView(
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Container(
                                                        width: width * 0.9,
                                                        height: height60,
                                                        decoration: BoxDecoration(
                                                            color: const Color(
                                                                0xFFF67D10),
                                                            borderRadius: BorderRadius.only(
                                                                topRight: Radius
                                                                    .circular(
                                                                        width16),
                                                                topLeft: Radius
                                                                    .circular(
                                                                        width16))),
                                                        child: Center(
                                                            child: Text(
                                                          "Chọn tỉnh/ thành phố",
                                                          style: Styles
                                                              .baseNotoSansTS
                                                              .copyWith(
                                                                  fontSize: 18,
                                                                  color: white,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600),
                                                        )),
                                                      ),
                                                      SizedBox(
                                                        height: height8,
                                                      ),
                                                      ...controller
                                                          .province!.districts
                                                          .map((e) => InkWell(
                                                                onTap: () {
                                                                  controller
                                                                      .controllerDistrict
                                                                      .text = e.name;
                                                                  Get.back();
                                                                },
                                                                child:
                                                                    Container(
                                                                  padding:
                                                                      EdgeInsets
                                                                          .all(
                                                                              width8),
                                                                  child: Text(
                                                                    e.name,
                                                                    style: Styles
                                                                        .baseNotoSansTS
                                                                        .copyWith(
                                                                            fontSize:
                                                                                16,
                                                                            fontWeight:
                                                                                FontWeight.w600),
                                                                  ),
                                                                ),
                                                              ))
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                            useSafeArea: true);
                                      }
                                    },
                                    child:
                                        const Icon(Icons.keyboard_arrow_down)),
                              ),
                              WidgetInput(
                                controller: controller.controllerType,
                                text: 'Điểm dịch vụ',
                                suffixIcon: GestureDetector(
                                    onTap: () {
                                      Get.dialog(
                                          Dialog(
                                            insetPadding: EdgeInsets.zero,
                                            backgroundColor: Colors.transparent,
                                            child: Container(
                                              width: width * 0.9,
                                              height: height * 0.3,
                                              decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          width16)),
                                              child: SingleChildScrollView(
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Container(
                                                      width: width * 0.9,
                                                      height: height60,
                                                      decoration: BoxDecoration(
                                                          color: const Color(
                                                              0xFFF67D10),
                                                          borderRadius: BorderRadius.only(
                                                              topRight: Radius
                                                                  .circular(
                                                                      width16),
                                                              topLeft: Radius
                                                                  .circular(
                                                                      width16))),
                                                      child: Center(
                                                          child: Text(
                                                        "Điểm dịch vụ",
                                                        style: Styles
                                                            .baseNotoSansTS
                                                            .copyWith(
                                                                fontSize: 18,
                                                                color: white,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600),
                                                      )),
                                                    ),
                                                    SizedBox(
                                                      height: height8,
                                                    ),
                                                    ...controller.types
                                                        .map((e) => InkWell(
                                                              onTap: () {
                                                                controller
                                                                    .controllerType
                                                                    .text = e.title;
                                                                controller
                                                                        .indexTypes
                                                                        .value =
                                                                    controller
                                                                        .types
                                                                        .indexOf(
                                                                            e);
                                                                Get.back();
                                                              },
                                                              child: Container(
                                                                padding:
                                                                    EdgeInsets.all(
                                                                        width8),
                                                                child: Text(
                                                                  e.title,
                                                                  style: Styles
                                                                      .baseNotoSansTS
                                                                      .copyWith(
                                                                          fontSize:
                                                                              16,
                                                                          fontWeight:
                                                                              FontWeight.w600),
                                                                ),
                                                              ),
                                                            ))
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                          useSafeArea: true);
                                    },
                                    child:
                                        const Icon(Icons.keyboard_arrow_down)),
                              ),
                              SizedBox(height: height8,),
                              ButtonPrimaryText(
                                  onTab: () async {
                                    await controller.getListAddress();
                                  },
                                  margin: EdgeInsets.all(width16),
                                  padding: EdgeInsets.all(width16),
                                  radius: width30,
                                  fontWeightText: FontWeight.w500,
                                  sizeText: 16,
                                  colorBackground: const Color(0xFFF67D10),
                                  colorText: white,
                                  textPrimary: 'Tìm kiếm')

                            ],
                          ),
                        ),
                        SizedBox(
                          height: height16,
                        ),
                        Obx(() => Container(
                          width: width,
                          padding: EdgeInsets.all(width16),
                          decoration: BoxDecoration(
                              color: white,
                              borderRadius: BorderRadius.circular(width16)),
                          child: Column(
                            children: [
                              Text(
                                'Danh sách địa điểm Agribank',
                                style: Styles.baseNotoSansTS.copyWith(
                                    fontSize: 14, fontWeight: FontWeight.w600),
                              ),
                              SizedBox(
                                height: height8,
                              ),
                              const Divider(
                                height: 1,
                              ),
                              SizedBox(
                                height: height8,
                              ),
                              ...controller.addresses.map((element) => Column(
                                children: [
                                  SizedBox(
                                    width: width,
                                    height: height60,
                                    child: Row(
                                      children: [
                                        const Icon(
                                          Icons.location_on_rounded,
                                          color: Color(0xFFF67D10),
                                        ),
                                        SizedBox(
                                          width: width8,
                                        ),
                                        SizedBox(
                                          width: width - width150,
                                          child: Text(
                                              '${element.ward},${element.district},${element.province}', style: Styles.baseNotoSansTS.copyWith(
                                            fontSize: 13
                                          ),),
                                        )
                                      ],
                                    ),
                                  ),
                                  const Divider(
                                    height: 1,
                                  )
                                ],
                              ))
                            ],
                          ),
                        ))
                      ],
                    ),
                  ),
                ),
        ));
  }
}
