import 'package:agribank_banking/components/function_service_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../app_theme.dart';
import '../../routes/app_routes.dart';

class OnlineSavingMoneyPage extends StatelessWidget {
  const OnlineSavingMoneyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFF67D10),
        centerTitle: true,
        title: Text(
          'TIỀN GỬI TRỰC TUYẾN',
          style: Styles.baseNotoSansTS.copyWith(
              fontSize: 16, color: white, fontWeight: FontWeight.w600),
        ),
        elevation: 0,
      ),
      body: Container(
        padding: EdgeInsets.all(width16),
        width: width,
        child: Column(
          children: [
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                mainAxisSpacing: width16,
                crossAxisSpacing: width16,
                childAspectRatio: 1.5,
                children: [
                  FunctionServiceItem(
                      icon: Image.asset('assets/icons/ic_picky_money.png'),
                      text: 'Mở tài khoản tiền gửi trực tuyến',
                      onPress: () {
                        Get.toNamed(AppRoutes.openSavingAccount);
                      }),
                  FunctionServiceItem(
                      icon: Image.asset('assets/icons/ic_picky_money.png'),
                      text: 'Tất toàn tiền gửi trực tuyến',
                      onPress: () {
                        Get.toNamed(AppRoutes.onlineDepositSettlement);
                      }),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
