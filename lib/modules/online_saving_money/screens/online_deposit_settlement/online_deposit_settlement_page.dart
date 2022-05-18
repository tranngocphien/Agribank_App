import 'package:agribank_banking/modules/online_saving_money/screens/online_deposit_settlement/online_deposit_settlement_controller.dart';
import 'package:flutter/material.dart';

import '../../../../app_theme.dart';
import '../../../../components/button_border.dart';
import '../../../../routes/app_routes.dart';
import 'package:get/get.dart';

class OnlineDepositSettlementPage extends GetWidget<OnlineDepositSettlementController> {
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
                              fontSize: 16, fontWeight: FontWeight.w500),
                        )
                      ],
                    ),
                    SizedBox(
                      height: height16,
                    ),
                    TextField(
                      decoration: const InputDecoration(
                        suffixIcon: Icon(Icons.keyboard_arrow_down),
                        label: Text('Hình thức gia hạn'),
                        focusColor: black700,
                        hoverColor: black700,
                        fillColor: black700,
                        border: InputBorder.none,
                      ),
                      style: Styles.baseNotoSansTS.copyWith(fontSize: 18),
                    ),
                    const Divider(thickness: 1,),
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
                              fontSize: 16, fontWeight: FontWeight.w500),
                        )
                      ],
                    ),
                    SizedBox(
                      height: height16,
                    ),
                    TextField(
                      controller: controller.controllerReceiveAcc,
                      decoration: const InputDecoration(
                        suffixIcon: Icon(Icons.keyboard_arrow_down),
                        label: Text('Chọn tài khoản nhận'),
                        focusColor: black700,
                        hoverColor: black700,
                        fillColor: black700,
                        border: InputBorder.none,
                      ),
                      style: Styles.baseNotoSansTS.copyWith(fontSize: 18),
                    ),
                    const Divider(thickness: 1,),


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
                        Get.toNamed(AppRoutes.transferDetailInternal);
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
