import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../app_theme.dart';
import 'package:get/get.dart';

import '../../../../components/button_border.dart';
import '../../../../components/widget_input.dart';
import '../../../../utils/enums.dart';
import 'forgot_pin_controller.dart';
class ForgotPinPage extends GetWidget<ForgotPinController> {
  const ForgotPinPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xFFF67D10),
          centerTitle: true,
          title: Text(
            'LẤY LẠI MÃ PIN',
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
            child: Container(
              width: width,
              margin: EdgeInsets.all(width16),
              padding: EdgeInsets.all(width16),
              decoration: BoxDecoration(
                  color: white,
                  borderRadius: BorderRadius.circular(width16)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Obx(() => WidgetInput(
                    text: 'Mật khẩu',
                    errorText: controller.errorPass.value,
                    obscureText: !controller.isShowPass.value,
                    onChanged: (value) {
                      controller.password.value = value;
                    },
                    suffixIcon: GestureDetector(
                      onTap: () {
                        controller.isShowPass.value = !controller.isShowPass.value;
                      },
                      child: Icon(
                        controller.isShowPass.value
                            ? Icons.visibility_off
                            : Icons.visibility,
                        color: const Color(0xFFF67D10),
                      ),
                    ),
                  ),),
                  const Divider(
                    height: 1,
                  ),
                  SizedBox(
                    height: height8,
                  ),
                  Obx(() => WidgetInput(
                    text: 'Mã PIN mới',
                    errorText: controller.errorNewPin.value,
                    obscureText: !controller.isShowNewPin.value,
                    onChanged: (value) {
                      controller.newPin.value = value;
                    },
                    suffixIcon: GestureDetector(
                      onTap: () {
                        controller.isShowNewPin.value = !controller.isShowNewPin.value;
                      },
                      child: Icon(
                        controller.isShowNewPin.value
                            ? Icons.visibility_off
                            : Icons.visibility,
                        color: const Color(0xFFF67D10),
                      ),
                    ),
                  ),),
                  const Divider(
                    height: 1,
                  ),
                  SizedBox(
                    height: height8,
                  ),
                  Obx(() => WidgetInput(
                    text: 'Nhập lại mã PIN mới',
                    errorText: controller.errorRetypeNewPin.value,
                    obscureText: !controller.isShowRetypeNewPin.value,
                    onChanged: (value) {
                      controller.retypeNewPin.value = value;
                    },
                    suffixIcon: GestureDetector(
                      onTap: () {
                        controller.isShowRetypeNewPin.value = !controller.isShowRetypeNewPin.value;
                      },
                      child: Icon(
                        controller.isShowRetypeNewPin.value
                            ? Icons.visibility_off
                            : Icons.visibility,
                        color: const Color(0xFFF67D10),
                      ),
                    ),
                  ),),
                  const Divider(
                    height: 1,
                  ),
                  SizedBox(
                    height: height16,
                  ),
                  ButtonPrimaryText(
                      onTab: () async {
                        await controller.forgotOTP();
                      },
                      margin: EdgeInsets.zero,
                      padding: EdgeInsets.all(width16),
                      radius: width30,
                      fontWeightText: FontWeight.w500,
                      sizeText: 16,
                      colorBackground: const Color(0xFFF67D10),
                      colorText: white,
                      textPrimary: 'ĐỔI PIN')
                ],
              ),
            ),
          ),
        ));
  }
}
