import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import '../../../../app_theme.dart';
import 'package:get/get.dart';

import '../../../../components/button_border.dart';
import '../../../../routes/app_routes.dart';

class ConfirmTransactionPage extends StatelessWidget {
  const ConfirmTransactionPage({Key? key}) : super(key: key);

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
                    height: height16,
                  ),
                  Image.asset(
                    'assets/icons/ic_phone.png',
                    width: width60,
                    height: height60,
                  ),
                  SizedBox(
                    height: height8,
                  ),
                  Text(
                    "Mã OTP đã được gửi đến số điện thoại",
                    style: Styles.baseNotoSansTS.copyWith(
                      fontSize: 16,
                    ),
                  ),
                  RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(children: <TextSpan>[
                      TextSpan(
                          text: "0377016054",
                          style: Styles.baseNotoSansTS.copyWith(
                              fontSize: 16, fontWeight: FontWeight.w600)),
                      TextSpan(
                          text:
                              ".Quý khách vui lòng nhập OTP để xác thực giao dịch",
                          style: Styles.baseNotoSansTS.copyWith(fontSize: 16))
                    ]),
                  ),
                  SizedBox(
                    height: height16,
                  ),
                  PinCodeTextField(
                      appContext: context, length: 6, onChanged: (value) {},
                    keyboardType: TextInputType.number,
                    cursorColor: Colors.red,
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
                        width: width*0.4,
                        height: height48,
                        child: ButtonPrimaryText(
                          onTab: () {
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