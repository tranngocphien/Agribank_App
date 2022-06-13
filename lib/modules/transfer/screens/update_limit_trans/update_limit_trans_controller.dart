import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../../data/storage/store_global.dart';
import '../../../../services/user_service.dart';

class UpdateLimitTransController extends GetxController {
  final isEditTrans = true.obs;
  final isEditDays = true.obs;

  String limitPerTrans = StoreGlobal.user.value!.limitPerTrans.toString();
  String limitPerDay = StoreGlobal.user.value!.limitPerDay.toString();

  final _userService = UserService.instance;

  Future<void> updateLimitTrans() async {
    try {
      await _userService.updateLimitTransaction(limitPerTrans: int.parse(limitPerTrans), limitPerDay: int.parse(limitPerDay));
      Get.dialog(CupertinoAlertDialog(
        title: const Text('Thông báo'),
        content: const Text('Cập nhật thông tin thành công'),
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
    on DioError catch(e) {

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



}