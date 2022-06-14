import 'package:agribank_banking/modules/card_service/screens/card_info/card_info_controller.dart';
import 'package:agribank_banking/routes/app_routes.dart';
import 'package:agribank_banking/utils/convert.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../app_theme.dart';
import '../../../../utils/enums.dart';

class CardInfoPage extends GetWidget<CardInfoController> {
  const CardInfoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFF67D10),
        centerTitle: true,
        title: Text(
          'TRUY VẤN THÔNG TIN THẺ',
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
              },
              child: Container(
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
                          'Thẻ ghi nợ nội địa',
                          style: Styles.baseNotoSansTS.copyWith(
                              fontSize: 16, fontWeight: FontWeight.w500),
                        )
                      ],
                    ),
                    SizedBox(height: height4,),
                    const Divider(height: 1,),
                    SizedBox(height: height4,),
                    ...controller.cards.map((element) => InkWell(
                      onTap: () {
                        Get.toNamed(AppRoutes.cardInfoDetail, arguments: [element, controller.accounts[element.id]]);
                      },
                      child: Column(
                        children: [
                          SizedBox(height: height8,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(element.cardNumber, style: Styles.baseNotoSansTS.copyWith(
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                                color: const Color(0xFFF67D10)
                              ),),
                              Text(element.block ? 'Không hoạt động': 'Đang hoạt động', style: Styles.baseNotoSansTS.copyWith(
                                fontSize: 14
                              ),)
                            ],
                          ),
                          SizedBox(height: height8,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Số tài khoản', style: Styles.baseNotoSansTS.copyWith(
                                  fontSize: 14,
                                fontWeight: FontWeight.w400
                              ),),
                              Text(controller.accounts[element.id]!.accountNumber, style: Styles.baseNotoSansTS.copyWith(
                                  fontSize: 15,
                                fontWeight: FontWeight.w600
                              ),)
                            ],
                          ),
                          SizedBox(height: height8,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Số dư sử dụng', style: Styles.baseNotoSansTS.copyWith(
                                fontSize: 14,
                              ),),
                              Text( MoneyFormat.formatMoneyInteger(controller.accounts[element.id]!.money), style: Styles.baseNotoSansTS.copyWith(
                                  fontSize: 15,
                                fontWeight: FontWeight.w500
                              ),)
                            ],
                          ),
                          const Divider(thickness: 1,),
                        ],

                      ),
                    ))
                  ],
                ),
              ),
            ),
          ],
        ),
      )),
    );
  }
}
