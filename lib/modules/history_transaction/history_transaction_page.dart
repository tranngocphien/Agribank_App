import 'package:agribank_banking/modules/history_transaction/history_transaction_controller.dart';
import 'package:agribank_banking/routes/app_routes.dart';
import 'package:agribank_banking/utils/convert.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../app_theme.dart';

class HistoryTransactionPage extends GetWidget<HistoryTransactionController> {
  const HistoryTransactionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6F6F6),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF67D10),
        centerTitle: true,
        title: Text(
          'LỊCH SỬ GIAO DỊCH',
          style: Styles.baseNotoSansTS.copyWith(
              fontSize: 16, color: white, fontWeight: FontWeight.w600),
        ),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(width16),
              child: Container(
                width: width,
                // height: height25*10,
                padding:
                    EdgeInsets.symmetric(vertical: height16, horizontal: width8),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(width16), color: white),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                            decoration: BoxDecoration(
                                color: const Color(0xFFF67D10),
                                borderRadius: BorderRadius.circular(width4)),
                            child: const Icon(
                              Icons.bar_chart,
                              color: white,
                            )),
                        SizedBox(
                          width: width8,
                        ),
                        Text(
                          'Tra cứu giao dịch',
                          style: Styles.baseNotoSansTS.copyWith(
                            fontSize: 16,
                            color: black,
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: height16,
                    ),
                    const Divider(
                      color: black,
                      height: 2,
                    ),
                    SizedBox(
                      height: height16,
                    ),
                    Text(
                      'Tài khoản',
                      style: Styles.baseNotoSansTS
                          .copyWith(fontSize: 14, color: black600),
                    ),
                    Obx(
                      () => Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            controller.bankAccounts[controller.indexAccount.value]
                                .accountNumber,
                            style: Styles.baseNotoSansTS.copyWith(
                                color: black,
                                fontSize: 16,
                                fontWeight: FontWeight.w500),
                          ),
                          GestureDetector(
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
                                                    topLeft: Radius.circular(
                                                        width16))),
                                            child: Center(
                                                child: Text(
                                              "Loại giao dịch",
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
                                          ...controller.bankAccounts.map((e) =>
                                              InkWell(
                                                onTap: () {
                                                  controller.indexAccount.value =
                                                      controller.bankAccounts
                                                          .indexOf(e);
                                                  controller.controllerAccount
                                                      .text = e.accountNumber;
                                                  Get.back();
                                                },
                                                child: Container(
                                                  padding: EdgeInsets.all(width8),
                                                  child: Text(
                                                    e.accountNumber,
                                                    style: Styles.baseNotoSansTS
                                                        .copyWith(
                                                            fontSize: 16,
                                                            fontWeight:
                                                                FontWeight.w600),
                                                  ),
                                                ),
                                              ))
                                        ],
                                      ),
                                    ),
                                  ),
                                  useSafeArea: true);
                            },
                            child: const Icon(
                              Icons.arrow_drop_down,
                              color: black600,
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: height8,
                    ),
                    const Divider(
                      color: black500,
                      height: 2,
                    ),
                    SizedBox(
                      height: height16,
                    ),
                    Text(
                      'Loại giao dịch',
                      style: Styles.baseNotoSansTS
                          .copyWith(fontSize: 14, color: black600),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Tất cả giao dịch',
                          style: Styles.baseNotoSansTS.copyWith(
                              color: black,
                              fontSize: 16,
                              fontWeight: FontWeight.w500),
                        ),
                        const Icon(
                          Icons.arrow_drop_down,
                          color: black600,
                        )
                      ],
                    ),
                    SizedBox(
                      height: height8,
                    ),
                    const Divider(
                      color: black500,
                      height: 2,
                    ),
                    SizedBox(
                      height: height4,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Từ ngày',
                              style: Styles.baseNotoSansTS
                                  .copyWith(fontSize: 14, color: black700),
                            ),
                            SizedBox(
                              height: height8,
                            ),
                            Obx(() => Row(
                                  children: [
                                    Text(
                                      ConvertDateTime.convertDate(
                                          controller.startDate.value),
                                      style: Styles.baseNotoSansTS
                                          .copyWith(fontSize: 16, color: black),
                                    ),
                                    SizedBox(
                                      width: width16,
                                    ),
                                    GestureDetector(
                                        onTap: () {
                                          showCupertinoModalPopup(
                                              context: context,
                                              builder: (BuildContext builder) {
                                                return Container(
                                                  height: MediaQuery.of(context)
                                                          .copyWith()
                                                          .size
                                                          .height *
                                                      0.3,
                                                  color: Colors.white,
                                                  child: CupertinoDatePicker(
                                                    mode: CupertinoDatePickerMode
                                                        .date,
                                                    onDateTimeChanged: (value) {
                                                      controller.startDate.value =
                                                          value;
                                                    },
                                                    initialDateTime:
                                                        DateTime.now(),
                                                  ),
                                                );
                                              });
                                        },
                                        child: const Icon(Icons.arrow_drop_down))
                                  ],
                                ))
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Đến ngày',
                              style: Styles.baseNotoSansTS
                                  .copyWith(fontSize: 14, color: black700),
                            ),
                            SizedBox(
                              height: height8,
                            ),
                            Obx(
                              () => Row(
                                children: [
                                  Text(
                                    ConvertDateTime.convertDate(
                                        controller.endDate.value),
                                    style: Styles.baseNotoSansTS
                                        .copyWith(fontSize: 16, color: black),
                                  ),
                                  SizedBox(
                                    width: width16,
                                  ),
                                  GestureDetector(
                                      onTap: () {
                                        showCupertinoModalPopup(
                                            context: context,
                                            builder: (BuildContext builder) {
                                              return Container(
                                                height: MediaQuery.of(context)
                                                        .copyWith()
                                                        .size
                                                        .height *
                                                    0.3,
                                                color: Colors.white,
                                                child: CupertinoDatePicker(
                                                  mode: CupertinoDatePickerMode
                                                      .date,
                                                  onDateTimeChanged: (value) {
                                                    controller.endDate.value =
                                                        value;
                                                  },
                                                  initialDateTime: DateTime.now(),
                                                ),
                                              );
                                            });
                                      },
                                      child: const Icon(Icons.arrow_drop_down))
                                ],
                              ),
                            )
                          ],
                        ),
                        GestureDetector(
                          onTap: () async{
                            await controller.getHistoryTransaction();
                          },
                          child: Container(
                            child: const Icon(
                              Icons.search,
                              color: Color(0xFFF67D10),
                            ),
                            padding: EdgeInsets.all(width4),
                            decoration: const BoxDecoration(
                                color: Color(0xFFF9F9F9), shape: BoxShape.circle),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: width16),
              child: Text(
                'Lưu ý: Báo cáo chỉ bao gồm các giao dịch trên ứng dụng Agribank E-Mobile Banking',
                style: Styles.baseNotoSansTS.copyWith(
                    fontSize: 14,
                    fontStyle: FontStyle.italic,
                    color: black500,
                    height: 1.7),
              ),
            ),
            SizedBox(height: height8,),
            Obx(
                  () => controller.histories.isNotEmpty
                  ? Container(
                width: width,
                // height: height25*10,
                    margin: EdgeInsets.all(width16),
                padding: EdgeInsets.symmetric(
                    vertical: height16, horizontal: width8),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(width16),
                    color: white),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                            decoration: BoxDecoration(
                                color: const Color(0xFFF67D10),
                                borderRadius:
                                BorderRadius.circular(width4)),
                            child: const Icon(
                              Icons.bar_chart,
                              color: white,
                            )),
                        SizedBox(
                          width: width8,
                        ),
                        Text(
                          'Danh sách giao dịch',
                          style: Styles.baseNotoSansTS.copyWith(
                            fontSize: 16,
                            color: black,
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: height16,
                    ),
                    const Divider(
                      color: black,
                      height: 2,
                    ),
                    SizedBox(
                      height: height4,
                    ),
                    ...controller.histories.map((element) => InkWell(
                      onTap: () {
                        Get.toNamed(AppRoutes.detailHistoryTransaction, arguments: element);
                      },
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment:
                            MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                ConvertDateTime.convertDateTime(element.createdAt!),
                                style: Styles.baseNotoSansTS
                                    .copyWith(
                                    fontSize: 15,
                                    color: black500),
                              ),
                              Text(
                                  (element.transactionMoney > 0 ? '+' : '') +  MoneyFormat.formatMoneyInteger(element.transactionMoney),
                                  style: Styles.baseNotoSansTS
                                      .copyWith(
                                      fontSize: 15,
                                      color:
                                      element.transactionMoney > 0 ? Colors.greenAccent: Colors.redAccent))
                            ],
                          ),
                          SizedBox(
                            height: height4,
                          ),
                          Text(
                            element.contentTransaction,
                            style: Styles.baseNotoSansTS.copyWith(
                              fontSize: 15,
                            ),
                          ),
                          const Divider()
                        ],
                      ),
                    ))
                  ],
                ),
              )
                  : Container(),
            )

          ],
        ),
      ),
    );
  }
}
