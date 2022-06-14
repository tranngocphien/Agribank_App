import 'package:agribank_banking/data/storage/store_global.dart';
import 'package:agribank_banking/models/bank_account_entity.dart';
import 'package:agribank_banking/services/card_service.dart';
import 'package:get/get.dart';

import '../../../../models/card_entity.dart';
import '../../../../utils/enums.dart';

class CardInfoController extends GetxController {
  final loadStatus = AppLoadStatus.idle.obs;
  final _cardService = CardService.instance;

  final cards = List<CardEntity>.empty(growable: true).obs;
  Map<String, BankAccountEntity> accounts = {};

  @override
  void onInit() async {
    // TODO: implement onInit
    loadStatus(AppLoadStatus.loading);
    await getListCard();
    loadStatus(AppLoadStatus.success);
    super.onInit();
  }

  Future<void> getListCard() async {
    cards..clear()..addAll(await _cardService.getListCard());
    for( CardEntity cardEntity in cards) {
      accounts[cardEntity.id] = StoreGlobal.accounts.firstWhere((element) => element.id == cardEntity.bankAccountId);
    }
  }


}