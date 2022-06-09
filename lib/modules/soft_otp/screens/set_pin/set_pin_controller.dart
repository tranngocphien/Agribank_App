import 'package:agribank_banking/data/storage/store_global.dart';
import 'package:agribank_banking/services/soft_otp_service.dart';
import 'package:agribank_banking/utils/enums.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../../routes/app_routes.dart';

class SetPinController extends GetxController {
  final controllerPassword = TextEditingController();
  final controllerPin = TextEditingController();
  final controllerRetypePin = TextEditingController();

  final softOTPService = SoftOtpService.instance;

  final loadStatus = AppLoadStatus.idle.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  Future<void> turnOnPin() async {
    loadStatus(AppLoadStatus.loading);
    try {
      await softOTPService.turnOn(
          password: controllerPassword.text,
          pin: controllerPin.text,
          retypePin: controllerRetypePin.text);
      loadStatus(AppLoadStatus.success);
      StoreGlobal.user.value!.softOtp = true;
      Get.dialog(CupertinoAlertDialog(
        title: const Text('Thông báo'),
        content: const Text('Quý khách đã kích hoạt xác thực giao dịch bằng Soft OTP thành công.'),
        actions: [
          CupertinoDialogAction(
            onPressed: () {
              Get.offAllNamed(AppRoutes.softOTP);
            },
            child: const Text('Đồng ý'),
          )
        ],
      ));
    }
    catch (e) {
      if(e is DioError){
        final message = (e.response!.data as Map)['message'];
        Get.dialog(CupertinoAlertDialog(
          title: const Text('Thông báo'),
          content: Text(message),
          actions: [
            CupertinoDialogAction(
              onPressed: () {
                Get.offAllNamed(AppRoutes.softOTP);
              },
              child: const Text('Đồng ý'),
            )
          ],
        ));

      }
    }

    loadStatus(AppLoadStatus.success);
  }
}
