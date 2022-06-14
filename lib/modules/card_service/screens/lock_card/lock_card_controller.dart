import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../../data/storage/store_global.dart';
import '../../../../models/bank_account_entity.dart';
import '../../../../models/card_entity.dart';
import '../../../../services/card_service.dart';
import '../../../../utils/enums.dart';

class LockCardController extends GetxController {
  final loadStatus = AppLoadStatus.idle.obs;
  final _cardService = CardService.instance;

  final cards = List<CardEntity>.empty(growable: true).obs;
  Map<String, BankAccountEntity> accounts = {};

  @override
  void onInit() async {
    // TODO: implement onInit
    await getListCard();
    super.onInit();
  }

  Future<void> getListCard() async {
    loadStatus(AppLoadStatus.loading);
    cards..clear()..addAll(await _cardService.getListCard());
    for( CardEntity cardEntity in cards) {
      accounts[cardEntity.id] = StoreGlobal.accounts.firstWhere((element) => element.id == cardEntity.bankAccountId);
    }
    loadStatus(AppLoadStatus.success);
  }

  Future<void> lockCard({required String id, required bool lock}) async {
    try {
      await _cardService.updateLimit(id: id, block: lock);
      await getListCard();
      Get.dialog(CupertinoAlertDialog(
        title: const Text('Thông báo'),
        content: Text(lock ? 'Khóa thẻ thành công': 'Bỏ khóa thẻ thành công'),
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