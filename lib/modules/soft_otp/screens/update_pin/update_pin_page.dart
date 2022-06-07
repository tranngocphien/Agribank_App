import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../../../app_theme.dart';
import '../../../../components/button_border.dart';

class UpdatePinPage extends StatelessWidget {
  const UpdatePinPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFF67D10),
        centerTitle: true,
        title: Text(
          'ĐẶT MÃ PIN',
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
                    "Vui lòng cài mã PIN mới và ghi nhớ mã này để nhập khi xác thực giao dịch bằng Soft OTP",
                    style: Styles.baseNotoSansTS.copyWith(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: height8,
                  ),
                  const Divider(
                    thickness: 1,
                    height: 1,
                  ),
                  SizedBox(
                    height: height16,
                  ),
                  Text(
                    'Nhập mã pin',
                    style: Styles.baseNotoSansTS.copyWith(fontSize: 15),
                  ),
                  SizedBox(height: height8,),
                  PinCodeTextField(
                    appContext: context,
                    length: 6,
                    onChanged: (value) {},
                    obscureText: true,
                    obscuringCharacter: '*',
                    pinTheme: PinTheme(
                      activeColor: white,
                      inactiveColor: const Color(0xFFF67D10),
                    ),
                  ),
                  SizedBox(
                    height: height16,
                  ),
                  Text(
                    'Nhập lại mã pin',
                    style: Styles.baseNotoSansTS.copyWith(fontSize: 15),
                  ),
                  PinCodeTextField(
                    appContext: context,
                    length: 6,
                    onChanged: (value) {},
                    cursorColor: black,
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
                    onTab: () async {},
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
