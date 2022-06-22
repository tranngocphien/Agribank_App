import 'package:agribank_banking/modules/transfer/screens/qr_code_scan/qr_code_scan_controller.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import '../../../../app_theme.dart';

class QrCodeScanPage extends GetWidget<QrCodeScanController> {
  const QrCodeScanPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFF67D10),
        centerTitle: true,
        title: Text(
          'QUÉT MÃ QR',
          style: Styles.baseNotoSansTS.copyWith(
              fontSize: 16, color: white, fontWeight: FontWeight.w600),
        ),
        elevation: 0,
      ),
      body: Center(
        child: SizedBox(
          child: QRView(
            key: controller.qrKey,
            onQRViewCreated: controller.onQRViewCreated,
            overlay: QrScannerOverlayShape(
              borderColor: white,
              borderRadius: 0,
              borderLength: 5,
              borderWidth: 7,
              cutOutSize: (MediaQuery.of(context).size.width < 400 ||
                  MediaQuery.of(context).size.height < 400)
                  ? 150.0
                  : 300.0,
            ),

          ),
        ),
      ),
    );

  }
}
