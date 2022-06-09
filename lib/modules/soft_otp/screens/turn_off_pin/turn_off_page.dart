import 'package:agribank_banking/modules/soft_otp/screens/turn_off_pin/turn_off_controller.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../../../app_theme.dart';
import '../../../../components/button_border.dart';

class TurnOffPage extends GetWidget<TurnOffController> {
  const TurnOffPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFF67D10),
        centerTitle: true,
        title: Text(
          'NHẬP MÃ PIN',
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
                  Text(
                    "Quý khách vui lòng nhập mã PIN quý khách đã cài đặt khi kích hoạt Soft OTP",
                    style: Styles.baseNotoSansTS.copyWith(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: height8,),
                  PinCodeTextField(
                    appContext: context,
                    keyboardType: TextInputType.number,
                    length: 6,
                    onChanged: (value) {
                    },
                    obscureText: true,
                    obscuringCharacter: '*',
                    pinTheme: PinTheme(
                      activeColor: white,
                      inactiveColor: const Color(0xFFF67D10),
                    ),
                  ),
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
    );
  }
}
