import 'package:agribank_banking/modules/online_saving_money/screens/online_deposit_settlement/online_deposit_settlement_controller.dart';
import 'package:agribank_banking/utils/convert.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../app_theme.dart';
import '../../../../components/button_border.dart';
import '../../../../components/widget_input.dart';
import '../../../../routes/app_routes.dart';
import 'package:get/get.dart';

class OnlineDepositSettlementPage
    extends GetWidget<OnlineDepositSettlementController> {
  const OnlineDepositSettlementPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFF67D10),
        centerTitle: true,
        title: Text(
          'TẤT TOÁN TIỀN GỬI TRỰC TUYẾN',
          style: Styles.baseNotoSansTS.copyWith(
              fontSize: 16, color: white, fontWeight: FontWeight.w600),
        ),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(width16),
          child: Column(
            children: [
              Container(
                // height: height160,
                padding: EdgeInsets.all(width8),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(width16), color: white),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Icon(
                          Icons.credit_card,
                          color: Colors.deepOrangeAccent,
                        ),
                        SizedBox(
                          width: width16,
                        ),
                        Text(
                          'Tài khoản tiền gửi trực tuyến',
                          style: Styles.baseNotoSansTS.copyWith(
                              fontSize: 15, fontWeight: FontWeight.w500),
                        )
                      ],
                    ),
                    SizedBox(
                      height: height16,
                    ),
                    WidgetInput(
                      text: 'Chọn tài khoản tiền gửi',
                      controller: controller.controllerSourceAccount,
                      suffixIcon: InkWell(
                        child: const Icon(Icons.keyboard_arrow_down),
                        onTap: () {
                          if(controller.savingAccounts.isEmpty){
                            Get.dialog(CupertinoAlertDialog(
                              title: const Text('Thông báo'),
                              content: const Text('Quý khách chưa có tài khoản'),
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
                          else {
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
                                        BorderRadius.circular(width16)),
                                    child: SingleChildScrollView(
                                      child: Column(
                                        children: [
                                          Container(
                                            width: width * 0.9,
                                            height: height60,
                                            decoration: BoxDecoration(
                                                color: const Color(0xFFF67D10),
                                                borderRadius: BorderRadius.only(
                                                    topRight:
                                                    Radius.circular(width16),
                                                    topLeft:
                                                    Radius.circular(width16))),
                                            child: Center(
                                                child: Text(
                                                  "Chọn tài khoản tiền gửi",
                                                  style: Styles.baseNotoSansTS.copyWith(
                                                      fontSize: 18,
                                                      color: white,
                                                      fontWeight: FontWeight.w600),
                                                )),
                                          ),
                                          SizedBox(
                                            height: height8,
                                          ),
                                          ...controller.savingAccounts.map((e) =>
                                              InkWell(
                                                onTap: () {
                                                  controller.indexSavingAccount
                                                      .value =
                                                      controller.savingAccounts
                                                          .indexOf(e);
                                                  controller.controllerSourceAccount
                                                      .text = e.accountNumber;
                                                  Get.back();
                                                },
                                                child: Container(
                                                  padding: EdgeInsets.all(width8),
                                                  child: Column(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      Text(
                                                        e.accountNumber,
                                                        style: Styles.baseNotoSansTS
                                                            .copyWith(
                                                            fontSize: 16,
                                                            fontWeight:
                                                            FontWeight.w600),
                                                      ),
                                                      Text(MoneyFormat.formatMoneyInteger(e.money) + ' VNĐ'),
                                                      const Divider(thickness: 1,),
                                                    ],
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
                      ),
                    ),
                    const Divider(
                      thickness: 1,
                    ),
                    Row(
                      children: [
                        const Icon(
                          Icons.credit_card,
                          color: Colors.deepOrangeAccent,
                        ),
                        SizedBox(
                          width: width16,
                        ),
                        Text(
                          'Tài khoản nhận',
                          style: Styles.baseNotoSansTS.copyWith(
                              fontSize: 15, fontWeight: FontWeight.w500),
                        )
                      ],
                    ),
                    SizedBox(
                      height: height16,
                    ),
                    WidgetInput(
                      controller: controller.controllerReceiveAcc,
                      text: 'Chọn tài khoản nhận',
                      suffixIcon: InkWell(
                        child: const Icon(Icons.keyboard_arrow_down),
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
                                          BorderRadius.circular(width16)),
                                  child: SingleChildScrollView(
                                    child: Column(
                                      children: [
                                        Container(
                                          width: width * 0.9,
                                          height: height60,
                                          decoration: BoxDecoration(
                                              color: const Color(0xFFF67D10),
                                              borderRadius: BorderRadius.only(
                                                  topRight:
                                                      Radius.circular(width16),
                                                  topLeft:
                                                      Radius.circular(width16))),
                                          child: Center(
                                              child: Text(
                                            "Chọn tài khoản nhận",
                                            style: Styles.baseNotoSansTS.copyWith(
                                                fontSize: 18,
                                                color: white,
                                                fontWeight: FontWeight.w600),
                                          )),
                                        ),
                                        SizedBox(
                                          height: height8,
                                        ),
                                        ...controller.bankAccounts.map((e) =>
                                            InkWell(
                                              onTap: () {
                                                controller.indexAccount.value =
                                                    controller.bankAccounts
                                                        .indexOf(e);
                                                controller.controllerSourceAccount
                                                    .text = e.accountNumber;
                                                Get.back();
                                              },
                                              child: Container(
                                                padding: EdgeInsets.all(width8),
                                                child: Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      e.accountNumber,
                                                      style: Styles.baseNotoSansTS
                                                          .copyWith(
                                                              fontSize: 15,
                                                              fontWeight:
                                                                  FontWeight.w600),
                                                    ),
                                                    Text(MoneyFormat.formatMoneyInteger(e.money) + 'VND', style: Styles.baseNotoSansTS.copyWith(
                                                      fontSize: 14,
                                                      color: black500
                                                    ),),
                                                    const Divider(thickness: 1,)
                                                  ],
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
                      ),
                    ),
                    const Divider(
                      thickness: 1,
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
                      onTab: () async {
                        Get.toNamed(AppRoutes.finishSavingAccount, arguments:  [controller.savingAccounts[controller.indexSavingAccount.value], controller.bankAccounts[controller.indexAccount.value]]);
                        // await controller.finishSavingAccount();
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
    );
  }
}
