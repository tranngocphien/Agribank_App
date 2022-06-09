import 'package:agribank_banking/components/button_border.dart';
import 'package:agribank_banking/modules/authentication/update_information/update_information_controller.dart';
import 'package:agribank_banking/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../app_theme.dart';
import '../../../components/widget_input.dart';

class UpdateInformationPage extends GetWidget<UpdateInformationController> {
  const UpdateInformationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFF67D10),
        centerTitle: true,
        title: Text(
          'ĐĂNG KÝ TÀI KHOẢN',
          style: Styles.baseNotoSansTS.copyWith(
              fontSize: 16, color: white, fontWeight: FontWeight.w600),
        ),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: width,
              margin: EdgeInsets.all(width16),
              padding: EdgeInsets.all(width16),
              decoration: BoxDecoration(
                  color: white, borderRadius: BorderRadius.circular(width16)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  WidgetInput(
                    textCapitalization: TextCapitalization.characters,
                    controller: controller.controllerName,
                    text: 'Họ và tên',
                  ),
                  SizedBox(
                    height: height8,
                  ),
                  WidgetInput(
                    controller: controller.controllerCCCD,
                    text: 'Số CCCD/CMND',
                  ),
                  SizedBox(
                    height: height8,
                  ),
                  WidgetInput(
                    controller: controller.controllerPhone,
                    text: 'Số điện thoại',
                  ),
                  SizedBox(
                    height: height8,
                  ),
                  WidgetInput(
                    controller: controller.controllerPassword,
                    text: 'Mật khẩu',
                    obscureText: true,
                  ),
                  SizedBox(height: height16,),
                  ButtonPrimaryText(
                      onTab: () async {
                        await controller.register();
                      },
                      margin: EdgeInsets.zero,
                      padding: EdgeInsets.all(width16),
                      radius: width30,
                      fontWeightText: FontWeight.w500,
                      sizeText: 20,
                      colorBackground: Color(0xFFF67D10),
                      colorText: white,
                      textPrimary: 'ĐĂNG KÝ')
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
