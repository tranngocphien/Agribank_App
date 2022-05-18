import 'package:agribank_banking/components/button_border.dart';
import 'package:agribank_banking/modules/authentication/update_information/update_information_controller.dart';
import 'package:agribank_banking/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../app_theme.dart';

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
                  Text(
                    'Họ và tên',
                    style: Styles.baseNotoSansTS.copyWith(
                      fontSize: 16,
                      color: black700,
                    ),
                  ),
                  SizedBox(
                    height: height8,
                  ),
                  TextField(
                    textCapitalization: TextCapitalization.characters,
                    controller: controller.controllerName,
                    style: Styles.baseNotoSansTS.copyWith(fontSize: 16),
                  ),
                  SizedBox(
                    height: height8,
                  ),
                  Text(
                    'Số CCCD/CMND',
                    style: Styles.baseNotoSansTS.copyWith(
                      fontSize: 16,
                      color: black700,
                    ),
                  ),
                  TextField(
                    controller: controller.controllerCCCD,
                    style: Styles.baseNotoSansTS.copyWith(fontSize: 16),
                  ),
                  SizedBox(
                    height: height8,
                  ),
                  Text(
                    'Chi nhánh mở tài khoản',
                    style: Styles.baseNotoSansTS.copyWith(
                      fontSize: 16,
                      color: black700,
                    ),
                  ),
                  TextField(
                    style: Styles.baseNotoSansTS.copyWith(fontSize: 16),
                  ),
                  SizedBox(
                    height: height16,
                  ),
                  ButtonPrimaryText(
                      onTab: () {
                        Get.toNamed(AppRoutes.cccdAuthentication, arguments: [
                          controller.controllerName.text,
                          controller.controllerCCCD.text
                        ]);
                      },
                      margin: EdgeInsets.zero,
                      padding: EdgeInsets.all(width16),
                      radius: width30,
                      fontWeightText: FontWeight.w500,
                      sizeText: 20,
                      colorBackground: Colors.deepOrangeAccent,
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
