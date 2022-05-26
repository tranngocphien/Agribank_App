import 'package:agribank_banking/components/function_service_item.dart';
import 'package:agribank_banking/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../app_theme.dart';

class ManageContactPage extends StatelessWidget {
  const ManageContactPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFF67D10),
        centerTitle: true,
        title: Text(
          'DỊCH VỤ THẺ',
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
                crossAxisCount: 3,
                mainAxisSpacing: width16,
                crossAxisSpacing: width16,
                childAspectRatio: 1,
                children: [
                  FunctionServiceItem(
                      icon: Image.asset('assets/icons/ic_kieu_hoi.png'),
                      text: 'Danh bạ tài \nkhoản/Thẻ',
                      onPress: () {
                        Get.toNamed(AppRoutes.manageContactAccount);
                      }),
                  FunctionServiceItem(
                      icon: Image.asset('assets/icons/ic_invoice.png'),
                      text: 'Danh bạ hóa đơn',
                      onPress: () {}),
                  FunctionServiceItem(
                      icon: Image.asset('assets/icons/ic_phone.png'),
                      text: 'Danh bạ nạp tiền',
                      onPress: () {}),
                  FunctionServiceItem(
                      icon: Image.asset('assets/icons/ic_credit_card.png'),
                      text: 'Danh bạ tài \nkhoản/Thẻ',
                      onPress: () {})
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
