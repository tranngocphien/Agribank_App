import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../data/storage/store_global.dart';
import '../../../routes/app_routes.dart';
import '../../../services/auth_service.dart';
import '../../../services/user_service.dart';

class RegisterController extends GetxController {
  final TextEditingController controllerName = TextEditingController();
  final TextEditingController controllerCCCD = TextEditingController();
  final TextEditingController controllerPhone = TextEditingController();
  final TextEditingController controllerPassword = TextEditingController();

  final _authService = AuthService.instance;
  final _userService = UserService.instance;

  Future<void> register() async {
    try {
      await _authService.register(username: controllerName.text, password: controllerPassword.text, phone: controllerPhone.text);
      // Get.toNamed(AppRoutes.cccdAuthentication, arguments: [
      //   controllerName.text,
      //   controllerCCCD.text
      // ]);
      final _response = await _authService.login(
          username: controllerPhone.text, password: controllerPassword.text);
      StoreGlobal.user.value = _response!.data.user;
      StoreGlobal.isLogin.value = true;
      StoreGlobal.soft.value = _response.data.user.softOtp;
      await getAccounts();
      if(_response.data.user.verified){
        Get.offAllNamed(AppRoutes.home);
      }
      else {
        Get.toNamed(AppRoutes.updateInformation, arguments: [
          _response.data.user.name.toUpperCase()
        ]);
      }
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

  Future<void> getAccounts() async {
    final response = await _userService
        .getListBankAccount()
        .then((value) => StoreGlobal.accounts.addAll(value));
  }

}