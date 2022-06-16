import 'package:agribank_banking/modules/transfer/screens/confirm_transaction_password/confirm_transaction_password_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../app_theme.dart';
import '../../../../components/button_border.dart';
import '../../../../components/widget_input.dart';

class ConfirmTransactionPasswordPage extends GetWidget<ConfirmTransactionPasswordController> {
  const ConfirmTransactionPasswordPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFF67D10),
        centerTitle: true,
        title: Text(
          'XÁC THỰC GIAO DỊCH',
          style: Styles.baseNotoSansTS.copyWith(
              fontSize: 16, color: white, fontWeight: FontWeight.w600),
        ),
        elevation: 0,
      ),
      body: Padding(
        padding: EdgeInsets.all(width16),
        child: Column(
          children: [
            Container(
              width: width,
              padding: EdgeInsets.all(width16),
              decoration: BoxDecoration(
                color: white,
                borderRadius: BorderRadius.circular(width16),
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: height8,
                  ),
                  Text(
                    "Vui lòng nhập mật khẩu đăng nhập ứng dụng để xác thực giao dịch",
                    style: Styles.baseNotoSansTS.copyWith(
                      fontSize: 15,
                    ),
                  ),
                  SizedBox(height: height8,),
                  WidgetInput(
                    text: 'Nhập mật khẩu',
                    obscureText: true,
                    onChanged: (value) {
                      controller.password.value = value;
                    },
                    // controller: controller.controllerPassword,
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
                          onTab: () {
                            Get.back();
                          },
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
                          onTab: () async {
                            await controller.onConfirmTransaction();
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
          ],
        ),
      ),
    );
  }
}
