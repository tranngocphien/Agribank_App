import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../../data/storage/store_global.dart';
import '../../../../routes/app_routes.dart';
import '../../../../services/soft_otp_service.dart';

class TurnOffController extends GetxController {
  final pin = Rx<String?>(null);
  final softOTPService = SoftOtpService.instance;

  Future<void> turnOffPin() async {
    try {
      await softOTPService.turnOff(pin: pin.value ?? '');
      StoreGlobal.soft.value = false;
      Get.dialog(CupertinoAlertDialog(
        title: const Text('Thông báo'),
        content: const Text('Quý khách đã hủy xác thực bằng Soft OTP thành công.'),
        actions: [
          CupertinoDialogAction(
            onPressed: () {
              Get.back();
              Get.back();
              },
            child: const Text('Đồng ý'),
          )
        ],
      ));
    }
    on DioError catch (e) {
      final message = (e.response!.data as Map)['message'];
      Get.dialog(CupertinoAlertDialog(
        title: const Text('Thông báo'),
        content: Text(message),
        actions: [
          CupertinoDialogAction(
            onPressed: () {
              Get.back();
              Get.back();
            },
            child: const Text('Đồng ý'),
          )
        ],
      ));

    }

  }


}