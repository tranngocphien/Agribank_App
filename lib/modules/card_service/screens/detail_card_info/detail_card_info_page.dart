import 'package:agribank_banking/components/button_border.dart';
import 'package:agribank_banking/components/information_tile.dart';
import 'package:agribank_banking/components/widget_input.dart';
import 'package:agribank_banking/data/storage/store_global.dart';
import 'package:agribank_banking/modules/card_service/screens/detail_card_info/detail_card_info_controller.dart';
import 'package:agribank_banking/utils/convert.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../app_theme.dart';
import '../../../../utils/enums.dart';

class DetailCardInfoPage extends GetWidget<DetailCardInfoController> {
  const DetailCardInfoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFF67D10),
        centerTitle: true,
        title: Text(
          'CHI TIẾT THẺ GHI NỢ NỘI ĐỊA',
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
                width: width,
                height: height,
                padding: EdgeInsets.all(width16),
                child: Column(
                  children: [
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
                                'Ghi nợ nội địa',
                                style: Styles.baseNotoSansTS.copyWith(
                                    fontSize: 16, fontWeight: FontWeight.w500),
                              )
                            ],
                          ),
                          SizedBox(
                            height: height4,
                          ),
                          const Divider(
                            height: 1,
                          ),
                          SizedBox(
                            height: height8,
                          ),
                          Text(
                            controller.card.cardNumber,
                            style: Styles.baseNotoSansTS.copyWith(
                                fontSize: 17,
                                fontWeight: FontWeight.w600,
                                color: const Color(0xFFF67D10)),
                          ),
                          SizedBox(
                            height: height8,
                          ),
                          Text(
                            'Số tài khoản: ${controller.account.accountNumber}',
                            style: Styles.baseNotoSansTS.copyWith(
                              fontSize: 15,
                            ),
                          ),
                          SizedBox(
                            height: height8,
                          ),
                          Text(
                            'Số dư tài khoản: ${MoneyFormat.formatMoneyInteger(controller.account.money)} VNĐ',
                            style: Styles.baseNotoSansTS.copyWith(
                              fontSize: 15,
                            ),
                          ),
                          SizedBox(
                            height: height16,
                          ),
                          const Divider(
                            height: 1,
                          ),
                          SizedBox(
                            height: height16,
                          ),
                          InformationTile(
                              label: 'Tên chủ thẻ',
                              content:
                                  StoreGlobal.user.value!.name.toUpperCase()),
                          InformationTile(
                              label: 'Ngày hết hạn hiệu lực',
                              content: ConvertDateTime.convertDate(
                                  controller.card.expirationDate)),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: height8,
                    ),
                    Container(
                      padding: EdgeInsets.all(width16),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(width16),
                          color: white),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Tình trạng thẻ',
                                style: Styles.baseNotoSansTS.copyWith(
                                  fontSize: 14,
                                  color: black600,
                                ),
                              ),
                              Text(
                                controller.card.block
                                    ? 'Không hoạt động'
                                    : 'Đang hoạt động',
                                style: Styles.baseNotoSansTS
                                    .copyWith(fontSize: 16, color: black),
                              )
                            ],
                          ),
                          SizedBox(
                            height: height8,
                          ),
                          const Divider(
                            thickness: 1,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Hạn mức giao dịch',
                                style: Styles.baseNotoSansTS.copyWith(
                                  fontSize: 14,
                                  color: black600,
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Get.dialog(
                                      Dialog(
                                        backgroundColor: Colors.transparent,
                                        child: Container(
                                          width: width * 0.8,
                                          height: height * 0.3,
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      width16)),
                                          child: SingleChildScrollView(
                                            child: Column(
                                              children: [
                                                Container(
                                                  width: width * 0.8,
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
                                                    'Hạn mức giao dịch',
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
                                                Container(
                                                  padding:
                                                      EdgeInsets.all(width16),
                                                  child: Column(
                                                    children: [
                                                      WidgetInput(
                                                        inputFormatters: [
                                                          ThousandsSeparatorInputFormatter()
                                                        ],
                                                        text:
                                                            'Hạn mức giao dịch internet',
                                                        initialValue: MoneyFormat
                                                            .formatMoneyInteger(
                                                                controller.card
                                                                    .limitInternet),
                                                        onChanged: (value) {
                                                          controller
                                                                  .limitInternet =
                                                              value;
                                                        },
                                                      ),
                                                      WidgetInput(
                                                        inputFormatters: [
                                                          ThousandsSeparatorInputFormatter()
                                                        ],
                                                        text:
                                                            'Hạn mức rút tiền mặt',
                                                        initialValue: MoneyFormat
                                                            .formatMoneyInteger(
                                                                controller.card
                                                                    .limitCash),
                                                        onChanged: (value) {
                                                          controller.limitCash =
                                                              value;
                                                        },
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                ButtonPrimaryText(
                                                    onTab: () async {
                                                      await controller.updateLimit();
                                                    },
                                                    margin:
                                                        EdgeInsets.symmetric(horizontal: width16),
                                                    padding:
                                                        EdgeInsets.all(width16),
                                                    radius: width16,
                                                    fontWeightText:
                                                        FontWeight.w500,
                                                    sizeText: 16,
                                                    colorBackground:
                                                        Color(0xFFF67D10),
                                                    colorText: white,
                                                    textPrimary: 'Cập nhật')
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                      useSafeArea: true);
                                },
                                child: Row(
                                  children: [
                                    Text(
                                      'Chi tiết',
                                      style: Styles.baseNotoSansTS.copyWith(
                                          fontSize: 16,
                                          color: const Color(0xFFF67D10)),
                                    ),
                                    SizedBox(
                                      width: width4,
                                    ),
                                    const Icon(
                                      Icons.arrow_forward_ios,
                                      size: 14,
                                      color: Color(0xFFF67D10),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            height: height8,
                          ),
                          const Divider(
                            thickness: 1,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Khóa thẻ',
                                style: Styles.baseNotoSansTS.copyWith(
                                  fontSize: 14,
                                  color: black600,
                                ),
                              ),
                              CupertinoSwitch(
                                value: controller.card.block,
                                onChanged: (bool value) {},
                              )
                            ],
                          ),
                          SizedBox(
                            height: height8,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )),
    );
  }
}
