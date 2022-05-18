import 'package:agribank_banking/app_theme.dart';
import 'package:agribank_banking/modules/account_information/account_information_controller.dart';
import 'package:agribank_banking/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AccountInformationPage extends GetWidget<AccountInformationController> {
  const AccountInformationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFF67D10),
        centerTitle: true,
        title: Text('THÔNG TIN TÀI KHOẢN', style: Styles.baseNotoSansTS.copyWith(
          fontSize: 16,
          color: white,
          fontWeight: FontWeight.w600
        ),),
        elevation: 0,
      ),
      body: Container(
        width: width,
        height: height,
        padding: EdgeInsets.all(width16),
        child: Column(
          children: [
            GestureDetector(
              onTap: (){
                Get.toNamed(AppRoutes.detailInformation);
              },
              child: Container(
                height: height160,
                padding: EdgeInsets.all(width8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(width16),
                  color: white
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Icon(Icons.credit_card, color: Colors.deepOrangeAccent,),
                        SizedBox(width: width16,),
                        Text('Tài khoản thanh toán', style: Styles.baseNotoSansTS.copyWith(
                          fontSize: 16,
                          fontWeight: FontWeight.w500
                        ),)

                      ],
                    ),
                    SizedBox(height: height32,),
                    Text('1504281024240', style: Styles.baseNotoSansTS.copyWith(
                      color: Colors.deepOrangeAccent,
                      fontSize: 18
                    ),),
                    SizedBox(height: height32,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Số dư: 0 VND', style: Styles.baseNotoSansTS.copyWith(
                          fontSize: 16
                        ),),
                        Row(
                          children: [
                            const Icon(Icons.qr_code_scanner_rounded, color: Colors.deepOrangeAccent,),
                            SizedBox(width: width16,),
                            const Icon(Icons.arrow_forward_ios, color: Colors.deepOrangeAccent,)
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ),
            )
          ],

        ),

      ),
    );
  }
}
