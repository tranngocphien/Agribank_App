import 'package:agribank_banking/modules/transfer/transfer_controller.dart';
import 'package:agribank_banking/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../app_theme.dart';
import '../home/home_page.dart';

class TransferPage extends GetWidget<TransferController> {
  const TransferPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFF67D10),
        centerTitle: true,
        title: Text('CHUYỂN KHOẢN', style: Styles.baseNotoSansTS.copyWith(
            fontSize: 16,
            color: white,
            fontWeight: FontWeight.w600
        ),),
        elevation: 0,
      ),
      body: Column(
        children: [
          Container(
            width: width,
            padding: EdgeInsets.all(width16),
            // height: height241,
            child: GridView.count(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: 3,
                crossAxisSpacing: width8,
                mainAxisSpacing: width8,
                children: [
                  FunctionItem(
                    icon: Image.asset(
                      'assets/icons/ic_phone.png',
                      height: height40,
                      width: width40,
                    ),
                    text: 'Chuyển khoản nội bộ qua \n TK/SDT',
                    onClick: () {
                      Get.toNamed(AppRoutes.transferInternal);
                    },
                    background: white,
                  ),
                  FunctionItem(
                    icon: Image.asset(
                      'assets/icons/ic_credit_card.png',
                      height: height40,
                      width: width40,
                    ),
                    text: 'CK liên NH qua số tài khoản',
                    onClick: () {
                      Get.toNamed(AppRoutes.transferExAccNumber);
                    },
                    background: white,
                  ),
                  FunctionItem(
                    icon: Image.asset(
                      'assets/icons/ic_credit_card.png',
                      height: height40,
                      width: width40,
                    ),
                    text: 'CK liên NH qua số thẻ',
                    onClick: () {
                      Get.toNamed(AppRoutes.transferExCardNumber);
                    },
                    background: white,
                  ),
                  FunctionItem(
                    icon: Image.asset(
                      'assets/icons/ic_qr_scan.png',
                      height: height40,
                      width: width40,
                    ),
                    text: 'Chuyển khoản 24/7 mã QR',
                    onClick: () {
                      Get.toNamed(AppRoutes.transferExQr);
                    },
                    background: white,
                  ),
                ]),
          ),


        ],
      ),

    );
  }
}

