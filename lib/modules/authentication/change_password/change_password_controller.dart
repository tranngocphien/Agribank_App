import 'package:agribank_banking/services/auth_service.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../data/storage/store_global.dart';
import '../../../services/user_service.dart';
import '../../../utils/enums.dart';

class ChangePasswordController extends GetxController {
  final loadStatus = AppLoadStatus.idle.obs;

  final oldPass = Rx<String?>(null);
  final newPass = Rx<String?>(null);
  final retypeNewPass = Rx<String?>(null);

  final errorOldPass = Rx<String?>(null);
  final errorNewPass = Rx<String?>(null);
  final errorRetypeNewPass = Rx<String?>(null);

  final isShowOldPass = false.obs;
  final isShowNewPass = false.obs;
  final isShowRetypeNewPass = false.obs;

  final _authService = AuthService.instance;
  final _userService = UserService.instance;

  Future<void> changePassword() async {
    if(checkData()){
      try {
        await _authService.changePassword(
            oldPassword: oldPass.value ?? '',
            newPassword: newPass.value ?? '',
            retypeNewPassword: retypeNewPass.value ?? '');
        Get.dialog(CupertinoAlertDialog(
          title: const Text('Thông báo'),
          content: const Text('Quý khách đã đổi mật khẩu thành công.'),
          actions: [
            CupertinoDialogAction(
              onPressed: () {
                Get.back();
              },
              child: const Text('Đồng ý'),
            )
          ],
        ));
      } on DioError catch (e) {
        final message = (e.response!.data as Map)['message'];
        Get.dialog(CupertinoAlertDialog(
          title: const Text('Thông báo'),
          content: Text(message),
          actions: [
            CupertinoDialogAction(
              onPressed: () {
                Get.back();              },
              child: const Text('Đồng ý'),
            )
          ],
        ));

      }
    }

  }

  bool checkData() {
    bool flag = true;
    if(oldPass.value == null){
      flag = false;
      errorOldPass.value = 'Chưa mật khẩu cũ';
    }
    else {
      errorOldPass.value = null;
    }
    if(newPass.value == null){
      flag = false;
      errorNewPass.value = 'Chưa nhập mật khẩu mới';
    }
    else {
      errorNewPass.value = null;
    }
    if(retypeNewPass.value == null){
      flag = false;
      errorRetypeNewPass.value = 'Chưa nhập lại mật khẩu mới';
    }
    else {
      errorRetypeNewPass.value = null;
    }
    if(retypeNewPass.value != newPass.value) {
      flag = false;
      errorRetypeNewPass.value = 'Nhập lại mật khẩu không đúng';
    }
    else {
      errorRetypeNewPass.value = null;
    }
    return flag;
  }


}
