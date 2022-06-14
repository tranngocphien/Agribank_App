import 'package:agribank_banking/data/storage/store_global.dart';
import 'package:agribank_banking/utils/convert.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../app_theme.dart';
import 'detail_information_controller.dart';

class DetailInformationPage extends GetWidget<DetailInformationController> {
  const DetailInformationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFF67D10),
        centerTitle: true,
        title: Text(
          'TÀI KHOẢN THANH TOÁN',
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
                width: width,
                padding:
                    EdgeInsets.symmetric(horizontal: width8, vertical: width16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(width16),
                  color: white,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Icon(
                          Icons.credit_card,
                          color: Color(0xFFF67D10),
                        ),
                        SizedBox(
                          width: width16,
                        ),
                        Text(
                          'Chi tiết tài khoản',
                          style: Styles.baseNotoSansTS.copyWith(
                            fontSize: 14,
                            color: black,
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: height16,
                    ),
                    Text(
                      controller.account.accountNumber,
                      style: Styles.baseNotoSansTS.copyWith(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: const Color(0xFFF67D10)),
                    ),
                    SizedBox(
                      height: height16,
                    ),
                    Text(
                      'Số dư: ${MoneyFormat.formatMoneyInteger(controller.account.money)} VND',
                      style: Styles.baseNotoSansTS.copyWith(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: black700),
                    ),
                    SizedBox(
                      height: height8,
                    ),
                    const Divider(
                      height: 0,
                      color: black,
                    ),
                    SizedBox(
                      height: height16,
                    ),
                    Text(
                      'Chủ tài khoản',
                      style: Styles.baseNotoSansTS.copyWith(
                        fontSize: 14,
                        color: black500,
                      ),
                    ),
                    SizedBox(
                      height: height4,
                    ),
                    Text(
                      StoreGlobal.user.value!.name.toUpperCase(),
                      style: Styles.baseNotoSansTS.copyWith(
                        fontSize: 16,
                        color: black,
                      ),
                    ),
                    SizedBox(
                      height: height4,
                    ),
                    const Divider(
                      color: black,
                      height: 2,
                    ),
                    SizedBox(
                      height: height8,
                    ),
                    Text(
                      'Chi nhánh mở',
                      style: Styles.baseNotoSansTS.copyWith(
                        fontSize: 14,
                        color: black500,
                      ),
                    ),
                    SizedBox(
                      height: height8,
                    ),
                    Text(
                      'Chi nhanh Dong Da',
                      style: Styles.baseNotoSansTS.copyWith(
                        fontSize: 16,
                        color: black,
                      ),
                    ),
                    SizedBox(
                      height: height8,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: height16,
              ),
              Container(
                width: width,
                // height: height25*10,
                padding: EdgeInsets.symmetric(
                    vertical: height16, horizontal: width8),
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
                                      controller.startDate
                                          .toString()
                                          .substring(0, 10),
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
                                                    mode:
                                                        CupertinoDatePickerMode
                                                            .date,
                                                    onDateTimeChanged: (value) {
                                                      controller.startDate
                                                          .value = value;
                                                    },
                                                    initialDateTime:
                                                        DateTime.now(),
                                                  ),
                                                );
                                              });
                                        },
                                        child:
                                            const Icon(Icons.arrow_drop_down))
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
                            Row(
                              children: [
                                Text(
                                  controller.endDate.value
                                      .toString()
                                      .substring(0, 10),
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
                                                  controller.endDate.value = value;
                                                },
                                                initialDateTime: DateTime.now(),
                                              ),
                                            );
                                          });
                                    },
                                    child: const Icon(Icons.arrow_drop_down))
                              ],
                            ),
                          ],
                        ),
                        GestureDetector(
                          onTap: () async {
                            await controller.getHistoryTransaction();
                          },
                          child: Container(
                            child: const Icon(
                              Icons.search,
                              color: Color(0xFFF67D10),
                            ),
                            padding: EdgeInsets.all(width4),
                            decoration: const BoxDecoration(
                                color: Color(0xFFF9F9F9),
                                shape: BoxShape.circle),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
              Obx(
                () => controller.histories.isNotEmpty
                    ? Container(
                        width: width,
                        // height: height25*10,
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
                            ...controller.histories.map((element) => Column(
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
                            ))
                          ],
                        ),
                      )
                    : Container(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
