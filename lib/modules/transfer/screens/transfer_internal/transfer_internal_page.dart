import 'package:agribank_banking/components/button_border.dart';
import 'package:agribank_banking/modules/transfer/screens/transfer_internal/transfer_internal_controller.dart';
import 'package:agribank_banking/routes/app_routes.dart';
import 'package:agribank_banking/utils/convert.dart';
import 'package:agribank_banking/utils/enums.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../app_theme.dart';
import '../../../../components/account_information.dart';
import '../../../../components/widget_input.dart';

class TransferInternalPage extends GetWidget<TransferInternalController> {
  const TransferInternalPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFF67D10),
        centerTitle: true,
        title: Text(
          'CHUYỂN KHOẢN NỘI BỘ QUA TK/SĐT',
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
                                'Thông tin thụ hưởng',
                                style: Styles.baseNotoSansTS.copyWith(
                                    fontSize: 16, fontWeight: FontWeight.w500),
                              )
                            ],
                          ),
                          Obx(
                            () => WidgetInput(
                              errorText: controller.errorAccount.value,
                              onChanged: (value) {
                                controller.account.value = value;
                              },
                              text: 'Số điện thoại/số tài khoản',
                              onPress: () {},
                              controller: controller.controllerAccount,
                              onEditingComplete: () async {
                                await controller.getUserName();
                              },
                              suffixIcon: GestureDetector(
                                  onTap: () {
                                    Get.dialog(
                                        Dialog(
                                          backgroundColor: Colors.transparent,
                                          child: Container(
                                            width: width * 0.8,
                                            height: height * 0.5,
                                            decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        width16)),
                                            child: Column(
                                              children: [
                                                Container(
                                                  width: width * 0.8,
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
                                                    'Số tài khoản',
                                                    style: Styles.baseNotoSansTS
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
                                                ...controller.internalContacts
                                                    .map((e) => InkWell(
                                                          onTap: () {
                                                            controller.indexContact.value = controller.internalContacts.indexOf(e);
                                                            controller.account.value = e.accountNumber;
                                                            controller.controllerAccount.text = e.accountNumber;

                                                            Get.back();
                                                          },
                                                          child: Container(
                                                              padding:
                                                                  EdgeInsets.all(
                                                                      width8),
                                                              child: Text(
                                                                e.accountNumber,
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
                                  child: const Icon(Icons.keyboard_arrow_down)),
                            ),
                          ),
                          Obx(
                            () => controller.userName.value == null
                                ? Container()
                                : Text(
                                    controller.userName.value!.toUpperCase(),
                                    style: Styles.baseNotoSansTS.copyWith(
                                      fontSize: 14,
                                    ),
                                  ),
                          ),
                          Obx(
                            () => WidgetInput(
                              errorText: controller.errorMoney.value,
                              onChanged: (value) {
                                controller.money.value = value;
                              },
                              text: 'Số tiền',
                              onPress: () {},
                              keyboardType: TextInputType.number,
                              inputFormatters: [
                                ThousandsSeparatorInputFormatter()
                              ],
                              suffixIcon: Text(
                                'VND',
                                style: Styles.baseNotoSansTS
                                    .copyWith(fontSize: 16, color: black500),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: height16,
                          ),
                          Text(
                            'Nội dung chuyển khoản',
                            style: Styles.baseNotoSansTS.copyWith(
                              color: black500,
                              fontSize: 16,
                            ),
                          ),
                          Obx(() => TextField(
                                onChanged: (value) {
                                  controller.content.value = value;
                                },
                                decoration: InputDecoration(
                                    errorText: controller.errorContent.value),
                                style: Styles.baseNotoSansTS
                                    .copyWith(fontSize: 18),
                              )),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Lưu thụ hưởng',
                                style: Styles.baseNotoSansTS.copyWith(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: black800),
                              ),
                              CupertinoSwitch(
                                  value: controller.isSaveAccount.value,
                                  onChanged: (value) {
                                    controller.isSaveAccount.value = value;
                                  })
                            ],
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
                              if (controller.checkData()) {
                                Get.toNamed(AppRoutes.transferDetailInternal,
                                    arguments: [
                                      controller
                                          .accounts[
                                              controller.indexAccount.value]
                                          .accountNumber,
                                      controller.account.value,
                                      controller.money.value,
                                      controller.content.value
                                    ]);
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
