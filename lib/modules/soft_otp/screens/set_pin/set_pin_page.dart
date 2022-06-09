import 'package:agribank_banking/modules/soft_otp/screens/set_pin/set_pin_controller.dart';
import 'package:agribank_banking/utils/enums.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../../../app_theme.dart';
import '../../../../components/button_border.dart';

class SetPinPage extends GetWidget<SetPinController> {
  const SetPinPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xFFF67D10),
          centerTitle: true,
          title: Text(
            'ĐẶT MÃ PIN SOFT OTP',
            style: Styles.baseNotoSansTS.copyWith(
                fontSize: 16, color: white, fontWeight: FontWeight.w600),
          ),
          elevation: 0,
        ),
        body: Obx(
          () => controller.loadStatus.value == AppLoadStatus.loading
              ? const Center(
                  child: CupertinoActivityIndicator(),
                )
              : SingleChildScrollView(
                  child: Padding(
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
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: height16,
                              ),
                              Text(
                                "Vui lòng cài đặt mã PIN cho Soft OTP để tăng tính bảo mật và an toàn cho giao dịch trên Ứng dụng. Quý khách cần nhập mã PIN khi xác thực bằng SoftOTP",
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
                                'Nhập mật khẩu',
                                style: Styles.baseNotoSansTS
                                    .copyWith(fontSize: 15),
                              ),
                              SizedBox(
                                height: height8,
                              ),
                              TextField(
                                controller: controller.controllerPassword,
                                obscureText: true,
                                style: Styles.baseNotoSansTS.copyWith(
                                  fontSize: 16,
                                ),
                              ),
                              SizedBox(
                                height: height8,
                              ),
                              Text(
                                'Nhập mã pin',
                                style: Styles.baseNotoSansTS
                                    .copyWith(fontSize: 15),
                              ),
                              SizedBox(
                                height: height8,
                              ),
                              PinCodeTextField(
                                controller: controller.controllerPin,
                                appContext: context,
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
                              SizedBox(
                                height: height16,
                              ),
                              Text(
                                'Nhập lại mã pin',
                                style: Styles.baseNotoSansTS
                                    .copyWith(fontSize: 15),
                              ),
                              PinCodeTextField(
                                controller: controller.controllerRetypePin,
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
                                onTab: () async {
                                  await controller.turnOnPin();
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
        ));
  }
}
