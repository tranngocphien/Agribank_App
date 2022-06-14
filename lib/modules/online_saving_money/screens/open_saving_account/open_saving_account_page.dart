import 'package:agribank_banking/modules/online_saving_money/screens/open_saving_account/open_saving_account_controller.dart';
import 'package:agribank_banking/utils/enums.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../app_theme.dart';
import '../../../../components/account_information.dart';
import '../../../../components/button_border.dart';
import '../../../../components/widget_input.dart';
import '../../../../routes/app_routes.dart';
import '../../../../utils/convert.dart';

class OpenSavingAccountPage extends GetWidget<OpenSavingAccountController> {
  const OpenSavingAccountPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xFFF67D10),
          centerTitle: true,
          title: Text(
            'MỞ TÀI KHOẢN TIỀN GỬI TRỰC TUYẾN',
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
                        Obx(() => AccountInformationWidget(
                              accounts: controller.accounts,
                              indexSelected: controller.indexAccount.value,
                              onPress: (value) {
                                controller.indexAccount.value == value;
                              },
                            )),
                        SizedBox(
                          height: height16,
                        ),
                        Container(
                          padding: EdgeInsets.all(width8),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(width16),
                              color: white),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  const Icon(
                                    Icons.vaping_rooms,
                                    color: Colors.deepOrangeAccent,
                                  ),
                                  SizedBox(
                                    width: width16,
                                  ),
                                  Text(
                                    'Thông tin tiền gửi trực tuyến',
                                    style: Styles.baseNotoSansTS.copyWith(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500),
                                  )
                                ],
                              ),
                              WidgetInput(
                                controller: controller.controllerType,
                                text: 'Loại tiền gửi',
                                onPress: () {},
                                suffixIcon:
                                    const Icon(Icons.keyboard_arrow_down),
                                enable: false,
                              ),
                              WidgetInput(
                                text: 'Chọn kỳ hạn',
                                onPress: () {},
                                controller: controller.controllerCycle,
                                suffixIcon: GestureDetector(
                                    onTap: () {
                                      Get.dialog(
                                          Dialog(
                                            insetPadding: EdgeInsets.zero,
                                            backgroundColor: Colors.transparent,
                                            child: Container(
                                              width: width * 0.9,
                                              height: height * 0.45,
                                              decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          width16)),
                                              child: Column(
                                                children: [
                                                  Container(
                                                    width: width * 0.9,
                                                    height: height60,
                                                    decoration: BoxDecoration(
                                                        color: const Color(
                                                            0xFFF67D10),
                                                        borderRadius:
                                                            BorderRadius.only(
                                                                topRight: Radius
                                                                    .circular(
                                                                        width16),
                                                                topLeft: Radius
                                                                    .circular(
                                                                        width16))),
                                                    child: Center(
                                                        child: Text(
                                                      "Chọn kỳ hạn",
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
                                                  ...controller.cycles
                                                      .map((e) => InkWell(
                                                            onTap: () {
                                                              controller
                                                                      .indexCycles
                                                                      .value =
                                                                  controller
                                                                      .cycles
                                                                      .indexOf(
                                                                          e);
                                                              controller
                                                                      .controllerCycle
                                                                      .text =
                                                                  controller
                                                                      .cycles[controller
                                                                          .indexCycles
                                                                          .value]
                                                                      .title;
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
                                                                              18,
                                                                          fontWeight:
                                                                              FontWeight.w600),
                                                                )),
                                                          ))
                                                ],
                                              ),
                                            ),
                                          ),
                                          useSafeArea: true);
                                    },
                                    child:
                                        const Icon(Icons.keyboard_arrow_down)),
                              ),
                              WidgetInput(
                                  controller: controller.controllerMoney,
                                  text: 'Số tiền',
                                  onPress: () {},
                                  inputFormatters: [
                                    ThousandsSeparatorInputFormatter()
                                  ],
                                  keyboardType: TextInputType.number,
                                  suffixIcon: Text(
                                    'VND',
                                    style: Styles.baseNotoSansTS.copyWith(
                                        fontSize: 16, color: Colors.grey),
                                  )),
                              SizedBox(
                                height: height8,
                              ),
                              WidgetInput(
                                text: 'Hình thức gia hạn',
                                onPress: () {},
                                controller: controller.controllerTypeRenew,
                                suffixIcon: GestureDetector(
                                    onTap: () {
                                      Get.dialog(
                                          Dialog(
                                            insetPadding: EdgeInsets.zero,
                                            backgroundColor: Colors.transparent,
                                            child: Container(
                                              width: width * 0.9,
                                              height: height * 0.45,
                                              decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          width16)),
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
                                                        borderRadius:
                                                            BorderRadius.only(
                                                                topRight: Radius
                                                                    .circular(
                                                                        width16),
                                                                topLeft: Radius
                                                                    .circular(
                                                                        width16))),
                                                    child: Center(
                                                        child: Text(
                                                      "Hình thức gia hạn",
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
                                                  ...controller.typeRenews
                                                      .map((e) => InkWell(
                                                            onTap: () {
                                                              controller
                                                                      .indexTypeRenews
                                                                      .value =
                                                                  controller
                                                                      .typeRenews
                                                                      .indexOf(
                                                                          e);
                                                              controller
                                                                      .controllerTypeRenew
                                                                      .text =
                                                                  controller
                                                                      .typeRenews[controller
                                                                          .indexTypeRenews
                                                                          .value]
                                                                      .title;
                                                              Get.back();
                                                            },
                                                            child: Container(
                                                                padding:
                                                                    EdgeInsets.all(
                                                                        width8),
                                                                child: Text(
                                                                  e.title,
                                                                  textAlign:
                                                                      TextAlign
                                                                          .left,
                                                                  style: Styles
                                                                      .baseNotoSansTS
                                                                      .copyWith(
                                                                          fontSize:
                                                                              18,
                                                                          fontWeight:
                                                                              FontWeight.w600),
                                                                )),
                                                          ))
                                                ],
                                              ),
                                            ),
                                          ),
                                          useSafeArea: true);
                                    },
                                    child:
                                        const Icon(Icons.keyboard_arrow_down)),
                              ),
                              SizedBox(
                                height: height8,
                              ),
                              Obx(
                                () => controller.indexCycles.value != -1
                                    ? Text(
                                        'Lãi suất ${controller.cycles[controller.indexCycles.value].interestRate}%',
                                        style: Styles.baseNotoSansTS.copyWith(
                                            fontSize: 15, color: black500),
                                      )
                                    : Container(),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: height16,
                        ),
                        Row(
                          children: [
                            Obx(() => Checkbox(value: controller.isAcceptPolicy.value, onChanged: (value) {
                              controller.isAcceptPolicy.value = value!;
                            }),),
                            SizedBox(
                              width: width16,
                            ),
                            SizedBox(
                              width: width * 0.7,
                              child: Text(
                                'Tôi xác nhận đã đọc, hiểu rõ Điều kiện và Điều khoản mở tài khoản tiết kiệm trực tuyến',
                                style: Styles.baseNotoSansTS.copyWith(
                                  fontSize: 14,
                                ),
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: height16,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: width * 0.4,
                              height: height48,
                              child: ButtonPrimaryText(
                                onTab: () {},
                                margin: EdgeInsets.zero,
                                padding: EdgeInsets.all(width8),
                                radius: width30,
                                fontWeightText: FontWeight.w500,
                                sizeText: 16,
                                colorBackground: white,
                                colorText: Colors.deepOrangeAccent,
                                textPrimary: 'Hủy',
                                colorBorder: Colors.deepOrangeAccent,
                              ),
                            ),
                            SizedBox(
                              width: width * 0.4,
                              height: height48,
                              child: ButtonPrimaryText(
                                onTab: () {
                                  if(controller.isAcceptPolicy.value){
                                    Get.toNamed(AppRoutes.openSavingAccountDetail,
                                        arguments: {
                                          'sourceAccount': controller
                                              .accounts[
                                          controller.indexAccount.value]
                                              .accountNumber,
                                          'type': controller.controllerType.text,
                                          'money':
                                          controller.controllerMoney.text,
                                          'cycle': controller.cycles[
                                          controller.indexCycles.value],
                                          'typeRenew': controller
                                              .typeRenews[controller
                                              .indexTypeRenews.value]
                                              .title
                                        });

                                  }
                                  else {
                                    Get.dialog(CupertinoAlertDialog(
                                      title: const Text('Thông báo'),
                                      content: const Text('Quý khách vui lòng đồng ý với điều khoản mở tiền gửi'),
                                      actions: [
                                        CupertinoDialogAction(
                                          onPressed: () {
                                            Get.back();
                                          },
                                          child: const Text('Đồng ý'),
                                        )
                                      ],
                                    ));
                                  }
                                },
                                margin: EdgeInsets.zero,
                                padding: EdgeInsets.all(width8),
                                radius: width30,
                                fontWeightText: FontWeight.w500,
                                sizeText: 16,
                                colorBackground: Colors.deepOrangeAccent,
                                colorText: white,
                                textPrimary: 'Tiếp tục',
                                colorBorder: Colors.deepOrangeAccent,
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
        ));
  }
}
