import 'package:agribank_banking/data/storage/store_global.dart';
import 'package:agribank_banking/routes/app_routes.dart';
import 'package:agribank_banking/services/auth_service.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final controllerPhone = TextEditingController();
  final controllerPassword = TextEditingController();
  final isShowPassword = false.obs;

  var phoneError = Rx<String?>(null);
  var passwordError = Rx<String?>(null);

  final _authService = AuthService.instance;


  Future<void> login() async{
    if(checkData()){
      try {
        final _response = await _authService.login(username: controllerPhone.text, password: controllerPassword.text);
        StoreGlobal.user.value = _response!.data.user;
        StoreGlobal.isLogin.value = true;
        Get.offAllNamed(AppRoutes.home);
      } on DioError {
        Get.toNamed(AppRoutes.updateInformation);

      }

    }
  }

  bool checkData() {
    bool flag = true;
    if(controllerPhone.text == ''){
      flag = false;
      phoneError.value = 'Chưa nhập số điện thoại';
    }
    else {
      phoneError.value = null;
    }
    if(controllerPassword.text == ''){
      flag = false;
      passwordError.value = 'Chưa nhập mật khẩu';
    }
    else {
      passwordError.value = null;
    }
    return flag;
  }



}