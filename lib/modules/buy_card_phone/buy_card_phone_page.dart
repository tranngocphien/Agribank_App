import 'package:agribank_banking/components/account_information.dart';
import 'package:agribank_banking/components/widget_input.dart';
import 'package:agribank_banking/data/storage/store_global.dart';
import 'package:agribank_banking/modules/buy_card_phone/buy_card_phone_controller.dart';
import 'package:agribank_banking/utils/enums.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../app_theme.dart';
import '../../components/button_border.dart';
import '../../routes/app_routes.dart';

class BuyCardPhonePage extends GetWidget<BuyCardPhoneController> {
  const BuyCardPhonePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFF67D10),
        centerTitle: true,
        title: Text(
          'MUA MÃ THẺ TRẢ TRƯỚC',
          style: Styles.baseNotoSansTS.copyWith(
              fontSize: 16, color: white, fontWeight: FontWeight.w600),
        ),
        elevation: 0,
      ),
      body: Obx(() => controller.loadStatus.value == AppLoadStatus.loading
          ? const Center(
              child: CupertinoActivityIndicator(),
            )
          : SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.all(width16),
                child: Column(
                  children: [
                    AccountInformationWidget(
                      accounts: controller.accounts,
                      indexSelected: controller.indexAccount.value,
                      onPress: (value) {
                        controller.indexAccount.value = value;
                      },
                    ),
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
                                Icons.account_circle_outlined,
                                color: Colors.deepOrangeAccent,
                              ),
                              SizedBox(
                                width: width16,
                              ),
                              Text(
                                'Thông tin mã thẻ',
                                style: Styles.baseNotoSansTS.copyWith(
                                    fontSize: 16, fontWeight: FontWeight.w500),
                              )
                            ],
                          ),
                          WidgetInput(
                            controller: controller.controllerHomeNetword,
                            text: 'Nhà cung cấp',
                            onPress: () {},
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
                                          child: Column(
                                            children: [
                                              Container(
                                                width: width * 0.9,
                                                height: height60,
                                                decoration: BoxDecoration(
                                                    color:
                                                        const Color(0xFFF67D10),
                                                    borderRadius: BorderRadius
                                                        .only(
                                                            topRight: Radius
                                                                .circular(
                                                                    width16),
                                                            topLeft:
                                                                Radius.circular(
                                                                    width16))),
                                                child: Center(
                                                    child: Text(
                                                  "Nhà cung cấp",
                                                  style: Styles.baseNotoSansTS
                                                      .copyWith(
                                                          fontSize: 18,
                                                          color: white,
                                                          fontWeight:
                                                              FontWeight.w600),
                                                )),
                                              ),
                                              SizedBox(
                                                height: height8,
                                              ),
                                              ...controller.homeNetworks
                                                  .map((e) => InkWell(
                                                        onTap: () {
                                                          controller
                                                                  .indexHomeNetword
                                                                  .value =
                                                              controller
                                                                  .homeNetworks
                                                                  .indexOf(e);
                                                          controller
                                                                  .controllerHomeNetword
                                                                  .text =
                                                              controller
                                                                  .homeNetworks[
                                                                      controller
                                                                          .indexHomeNetword
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
                                                                          FontWeight
                                                                              .w600),
                                                            )),
                                                      ))
                                            ],
                                          ),
                                        ),
                                      ),
                                      useSafeArea: true);
                                },
                                child: const Icon(Icons.keyboard_arrow_down)),
                          ),
                          const Divider(
                            thickness: 1,
                            height: 0,
                          ),
                          WidgetInput(
                            text: 'Mệnh giá',
                            controller: controller.controllerMoney,
                            onPress: () {},
                            suffixIcon: GestureDetector(
                              onTap: (){
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
                                                  color:
                                                  const Color(0xFFF67D10),
                                                  borderRadius: BorderRadius
                                                      .only(
                                                      topRight: Radius
                                                          .circular(
                                                          width16),
                                                      topLeft:
                                                      Radius.circular(
                                                          width16))),
                                              child: Center(
                                                  child: Text(
                                                    "Mệnh giá",
                                                    style: Styles.baseNotoSansTS
                                                        .copyWith(
                                                        fontSize: 18,
                                                        color: white,
                                                        fontWeight:
                                                        FontWeight.w600),
                                                  )),
                                            ),
                                            SizedBox(
                                              height: height8,
                                            ),
                                            ...controller.moneys
                                                .map((e) => InkWell(
                                              onTap: () {
                                                controller
                                                    .indexMoney
                                                    .value =
                                                    controller
                                                        .moneys
                                                        .indexOf(e);
                                                controller
                                                    .controllerMoney
                                                    .text =
                                                    controller
                                                        .moneys[
                                                    controller
                                                        .indexMoney
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
                                                        FontWeight
                                                            .w600),
                                                  )),
                                            ))
                                          ],
                                        ),
                                      ),
                                    ),
                                    useSafeArea: true);

                              },
                                child: const Icon(Icons.keyboard_arrow_down)),
                          ),
                          const Divider(
                            thickness: 1,
                            height: 0,
                          ),
                        ],
                      ),
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
                              if(StoreGlobal.user.value!.softOtp){
                                Get.toNamed(AppRoutes.confirmTransaction, arguments: TransactionType.buyCodePhone);
                              }
                              else {
                                Get.toNamed(AppRoutes.confirmTransactionPassword, arguments: TransactionType.buyCodePhone);
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
            )),
    );
  }
}
