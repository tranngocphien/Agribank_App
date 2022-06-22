import 'package:agribank_banking/routes/app_routes.dart';
import 'package:camera/camera.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class QrCodeScanController extends GetxController {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  QRViewController? controller;

  @override
  void onClose() {
    // TODO: implement onClose
    controller?.dispose();
    super.onClose();
  }


  void onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      print(scanData.code);
      Get.toNamed(AppRoutes.transferInternal, arguments: scanData.code);
    });
  }


}