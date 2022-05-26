import 'package:agribank_banking/components/account_information.dart';
import 'package:agribank_banking/modules/recharge_phone/recharge_phone_controller.dart';
import 'package:agribank_banking/modules/recharge_phone/widget/list_amount_money.dart';
import 'package:agribank_banking/routes/app_routes.dart';
import 'package:agribank_banking/utils/enums.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../app_theme.dart';
import '../../components/button_border.dart';

class RechargePhonePage extends GetWidget<RechargePhoneController> {
  const RechargePhonePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() => controller.loadStatus.value == AppLoadStatus.loading
        ? const Center(
            child: CupertinoActivityIndicator(),
          )
        : Scaffold(
            appBar: AppBar(
              backgroundColor: const Color(0xFFF67D10),
              centerTitle: true,
              title: Text(
                'NẠP TIỀN ĐIỆN THOẠI',
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
                                Icons.account_circle_outlined,
                                color: Colors.deepOrangeAccent,
                              ),
                              SizedBox(
                                width: width16,
                              ),
                              Text(
                                'Chọn số điện thoạis',
                                style: Styles.baseNotoSansTS.copyWith(
                                    fontSize: 16, fontWeight: FontWeight.w500),
                              )
                            ],
                          ),
                          TextField(
                            controller: controller.controllerPhone,
                            decoration: const InputDecoration(
                              suffixIcon: Icon(
                                Icons.phone_android,
                                color: Color(0xFFF67D10),
                              ),
                              label: Text('Nhập số điện thoại'),
                              focusColor: black700,
                              hoverColor: black700,
                              fillColor: black700,
                              border: InputBorder.none,
                            ),
                            style: Styles.baseNotoSansTS.copyWith(fontSize: 18),
                          ),
                          const Divider(
                            thickness: 1,
                          ),
                          Text(
                            'Không cần nhập nếu nạp tiền cho số của Quý khách',
                            style: Styles.baseNotoSansTS.copyWith(
                                fontSize: 13,
                                color: Colors.grey,
                                fontStyle: FontStyle.italic),
                          )
                        ],
                      ),
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
                                Icons.monetization_on,
                                color: Colors.deepOrangeAccent,
                              ),
                              SizedBox(
                                width: width16,
                              ),
                              Text(
                                'Chọn mệnh giá nạp',
                                style: Styles.baseNotoSansTS.copyWith(
                                    fontSize: 16, fontWeight: FontWeight.w500),
                              )
                            ],
                          ),
                          SizedBox(
                            height: height8,
                          ),
                          const Divider(
                            thickness: 1,
                          ),
                          Obx(() => ListAmountMoney(
                              values: controller.values,
                              indexSelected: controller.indexSelected.value,
                              onPress: (value) {
                                controller.indexSelected.value = value;
                              })),
                          SizedBox(
                            height: height8,
                          )
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
                            onTab: () {
                              Get.back();
                            },
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
                              Get.toNamed(AppRoutes.confirmTransaction,
                                  arguments: TransactionType.rechargePhone);
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
