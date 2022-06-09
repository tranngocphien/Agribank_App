import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../routes/app_routes.dart';
import '../../../services/auth_service.dart';

class UpdateInformationController extends GetxController {
  final TextEditingController controllerName = TextEditingController();
  final TextEditingController controllerCCCD = TextEditingController();
  final TextEditingController controllerPhone = TextEditingController();
  final TextEditingController controllerPassword = TextEditingController();

  final _authService = AuthService.instance;

  Future<void> register() async {
    try {
      await _authService.register(username: controllerName.text, password: controllerPassword.text, phone: controllerPhone.text);
      Get.toNamed(AppRoutes.cccdAuthentication, arguments: [
        controllerName.text,
        controllerCCCD.text
      ]);
    }
    on DioError catch (e) {
      final message = (e.response!.data as Map)['message'];
      Get.dialog(CupertinoAlertDialog(
        title: const Text('Thông báo'),
        content: Text(message),
        actions: [
          CupertinoDialogAction(
            onPressed: () {
              Get.offAndToNamed(AppRoutes.login);
            },
            child: const Text('Đồng ý'),
          )
        ],
      ));



    }
  }

}