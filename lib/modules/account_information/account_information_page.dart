import 'package:agribank_banking/app_theme.dart';
import 'package:agribank_banking/modules/account_information/account_information_controller.dart';
import 'package:agribank_banking/routes/app_routes.dart';
import 'package:agribank_banking/utils/convert.dart';
import 'package:agribank_banking/utils/enums.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class AccountInformationPage extends GetWidget<AccountInformationController> {
  const AccountInformationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var formatter = NumberFormat('###,###,###');
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFF67D10),
        centerTitle: true,
        title: Text(
          'THÔNG TIN TÀI KHOẢN',
          style: Styles.baseNotoSansTS.copyWith(
              fontSize: 16, color: white, fontWeight: FontWeight.w600),
        ),
        elevation: 0,
      ),
      body: Obx(() => controller.loadStatus.value == AppLoadStatus.loading
          ? const Center(
              child: CupertinoActivityIndicator(),
            )
          : Container(
              width: width,
              height: height,
              padding: EdgeInsets.all(width16),
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      // Get.toNamed(AppRoutes.detailInformation,
                      //     arguments: [controller.accounts.first]);
                    },
                    child: Container(
                      height: height160,
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
                                Icons.credit_card,
                                color: Colors.deepOrangeAccent,
                              ),
                              SizedBox(
                                width: width16,
                              ),
                              Text(
                                'Tài khoản thanh toán',
                                style: Styles.baseNotoSansTS.copyWith(
                                    fontSize: 16, fontWeight: FontWeight.w500),
                              )
                            ],
                          ),
                          SizedBox(
                            height: height32,
                          ),
                          Text(
                            controller.accounts.first.accountNumber,
                            style: Styles.baseNotoSansTS.copyWith(
                                color: Colors.deepOrangeAccent, fontSize: 18),
                          ),
                          SizedBox(
                            height: height32,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Số dư: ${formatter.format(controller.accounts.first.money)} VND',
                                style: Styles.baseNotoSansTS
                                    .copyWith(fontSize: 16),
                              ),
                              Row(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      Get.toNamed(AppRoutes.qrCode, arguments: [
                                        controller.accounts.first
                                      ]);
                                    },
                                    child: const Icon(
                                      Icons.qr_code_scanner_rounded,
                                      color: Colors.deepOrangeAccent,
                                    ),
                                  ),
                                  SizedBox(
                                    width: width16,
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      Get.toNamed(AppRoutes.detailInformation,
                                          arguments: [
                                            controller.accounts.first
                                          ]);
                                    },
                                    child: const Icon(
                                      Icons.arrow_forward_ios,
                                      size: 14,
                                      color: Colors.deepOrangeAccent,
                                    ),
                                  )
                                ],
                              )
                            ],
                          )
                        ],
                      ),
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
                              Icons.credit_card,
                              color: Colors.deepOrangeAccent,
                            ),
                            SizedBox(
                              width: width16,
                            ),
                            Text(
                              'Tài khoản tiết kiệm',
                              style: Styles.baseNotoSansTS.copyWith(
                                  fontSize: 15, fontWeight: FontWeight.w500),
                            ),
                            const Spacer(),
                            Obx(
                              () => controller.clickedView.value
                                  ? Container()
                                  : GestureDetector(
                                      onTap: () async {
                                        await controller.getListSavingAccount();
                                        controller.clickedView.value = true;
                                      },
                                      child: Text(
                                        'Xem thêm',
                                        style: Styles.baseNotoSansTS.copyWith(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w500,
                                            color: const Color(0xFFF67D10)),
                                      ),
                                    ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: height8,
                        ),
                        ...controller.savingAccounts.map((element) => InkWell(
                              onTap: () {
                                Get.toNamed(AppRoutes.detailSavingAccount,
                                    arguments: element);
                              },
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        element.accountNumber,
                                        style: Styles.baseNotoSansTS.copyWith(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w600,
                                            color: const Color(0xFFF67D10)),
                                      ),
                                      SizedBox(
                                        height: height8,
                                      ),
                                      Text(
                                        'Số dư: ${MoneyFormat.formatMoneyInteger(element.money)} VNĐ',
                                        style: Styles.baseNotoSansTS.copyWith(
                                            fontSize: 14, color: black600),
                                      ),
                                      SizedBox(
                                        height: height4,
                                      ),
                                      const Divider(
                                        height: 1,
                                      )
                                    ],
                                  ),
                                  GestureDetector(
                                      onTap: () {
                                        Get.toNamed(
                                            AppRoutes.detailSavingAccount,
                                            arguments: element);
                                      },
                                      child: const Icon(
                                        Icons.arrow_forward_ios,
                                        size: 14,
                                        color: Color(0xFFF67D10),
                                      ))
                                ],
                              ),
                            ))
                      ],
                    ),
                  )
                ],
              ),
            )),
    );
  }
}
