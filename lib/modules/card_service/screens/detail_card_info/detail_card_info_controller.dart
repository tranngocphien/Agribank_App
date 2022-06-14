import 'package:agribank_banking/models/bank_account_entity.dart';
import 'package:agribank_banking/models/card_entity.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../../services/card_service.dart';
import '../../../../utils/enums.dart';

class DetailCardInfoController extends GetxController {
  final loadStatus = AppLoadStatus.idle.obs;
  final _cardService = CardService.instance;

  CardEntity card = Get.arguments[0];
  final BankAccountEntity account = Get.arguments[1];
  String? limitInternet;
  String? limitCash;
  @override
  void onInit() async {
    // TODO: implement onInit
    limitInternet = card.limitInternet.toString();
    limitCash = card.limitCash.toString();
    super.onInit();
  }

  Future<void> updateLimit() async {
    try {
      card = (await _cardService.updateLimit(
          id: card.id,
          limitInternet: int.parse(limitInternet!.replaceAll(',', '')),
          limitCash: int.parse(limitCash!.replaceAll(',', ''))))!;
      Get.dialog(CupertinoAlertDialog(
        title: const Text('Thông báo'),
        content: const Text('Cập nhật hạn mức thành công'),
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
}
