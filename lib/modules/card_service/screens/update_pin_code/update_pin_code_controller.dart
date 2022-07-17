import 'package:agribank_banking/utils/enums.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../../models/card_entity.dart';
import '../../../../services/card_service.dart';

class UpdatePinCardController extends GetxController {
  final loadStatus = AppLoadStatus.idle.obs;

  CardEntity card = Get.arguments[0];

  final oldPin = Rx<String?>(null);
  final newPin = Rx<String?>(null);
  final retypeNewPin = Rx<String?>(null);

  final errorPass = Rx<String?>(null);
  final errorNewPin = Rx<String?>(null);
  final errorRetypeNewPin = Rx<String?>(null);

  final isShowPass = false.obs;
  final isShowNewPin = false.obs;
  final isShowRetypeNewPin = false.obs;

  final _cardService = CardService.instance;

  Future<void> updatePin() async {
    try {
      await _cardService.changePin(id: card.id, oldPass: oldPin.value!, newPass: newPin.value!);
      Get.dialog(CupertinoAlertDialog(
        title: const Text('Thông báo'),
        content: const Text("Cập nhật mã PIN thành công"),
        actions: [
          CupertinoDialogAction(
            onPressed: () {
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
            },
            child: const Text('Đồng ý'),
          )
        ],
      ));
    }
  }




  bool checkData() {
    bool flag = true;
    if(oldPin.value == null){
      flag = false;
      errorPass.value = 'Chưa nhập mã PIN hiện tại';
    }
    else {
      errorPass.value = null;
    }
    if(newPin.value == null){
      flag = false;
      errorNewPin.value = 'Chưa mã PIN mới';
    }
    else {
      errorNewPin.value = null;
    }
    if(retypeNewPin.value == null){
      flag = false;
      errorRetypeNewPin.value = 'Chưa nhập lại mã pin mới';
    }
    else {
      errorRetypeNewPin.value = null;
    }
    if(retypeNewPin.value != newPin.value) {
      flag = false;
      errorRetypeNewPin.value = 'Nhập lại mã PIN không đúng';
    }
    else {
      errorRetypeNewPin.value = null;
    }
    return flag;
  }
}