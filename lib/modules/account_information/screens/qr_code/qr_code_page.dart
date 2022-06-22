import 'package:agribank_banking/modules/account_information/screens/qr_code/qr_code_controller.dart';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../../../../app_theme.dart';
import 'package:get/get.dart';

class QrCodePage extends GetWidget<QrCodeController> {
  const QrCodePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFF67D10),
        centerTitle: true,
        title: Text(
          'QR CODE',
          style: Styles.baseNotoSansTS.copyWith(
              fontSize: 16, color: white, fontWeight: FontWeight.w600),
        ),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Container(
          width: width,
          padding: EdgeInsets.all(width16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              QrImage(
                data: controller.account.accountNumber,
                version: QrVersions.auto,
                size: 320,
                gapless: false,
              )            ],
          ),
        ),
      ),
    );
  }
}
