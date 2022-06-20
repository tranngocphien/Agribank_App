import 'package:agribank_banking/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../app_theme.dart';
import '../../components/function_service_item.dart';

class InformationLookUpPage extends StatelessWidget {
  const InformationLookUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFF67D10),
        centerTitle: true,
        title: Text(
          'TRA CỨU THÔNG TIN',
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
                      text: 'Tỷ giá ngoại tệ',
                      onPress: () {
                        Get.toNamed(AppRoutes.lookupCurrency);

                      }),
                  FunctionServiceItem(
                      icon: Image.asset('assets/icons/ic_invoice.png'),
                      text: 'Lãi suất',
                      onPress: () {
                        Get.toNamed(AppRoutes.lookupRate);
                      }),
                  FunctionServiceItem(
                      icon: Image.asset('assets/icons/ic_credit_card.png'),
                      text: 'Địa điểm Agribank',
                      onPress: () {
                        Get.toNamed(AppRoutes.lookupAddress);
                      })
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
