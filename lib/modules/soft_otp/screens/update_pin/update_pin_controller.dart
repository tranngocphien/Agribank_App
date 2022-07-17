import 'package:agribank_banking/services/soft_otp_service.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../../routes/app_routes.dart';
import '../../../../utils/enums.dart';

class UpdatePinController extends GetxController {
  String oldPin = Get.arguments;
  final controllerNewPin = TextEditingController();
  final controllerNewPinRetype = TextEditingController();

  final softOTPService = SoftOtpService.instance;
  final loadStatus = AppLoadStatus.idle.obs;


  Future<void> updatePin() async {
    try {
      await softOTPService.updatePin(
          pinOld: oldPin,
          pinNew: controllerNewPin.text,
          retypePinNew: controllerNewPinRetype.text);
      Get.dialog(CupertinoAlertDialog(
        title: const Text('Thông báo'),
        content: const Text('Quý khách đã đổi mã pin thành công.'),
        actions: [
          CupertinoDialogAction(
            onPressed: () {
              // Get.offAllNamed(AppRoutes.softOTP);
              Get.until((route) => Get.currentRoute == AppRoutes.softOTP);
            },
            child: const Text('Đồng ý'),
          )
        ],
      ));
    } on DioError catch (e) {
      loadStatus(AppLoadStatus.failed);
      final message = (e.response!.data as Map)['message'];
      Get.dialog(CupertinoAlertDialog(
        title: const Text('Thông báo'),
        content: Text(message),
        actions: [
          CupertinoDialogAction(
            onPressed: () {
              Get.until((route) => Get.currentRoute == AppRoutes.softOTP);
              // Get.offAllNamed(AppRoutes.softOTP);
            },
            child: const Text('Đồng ý'),
          )
        ],
      ));
    }

  }
}
