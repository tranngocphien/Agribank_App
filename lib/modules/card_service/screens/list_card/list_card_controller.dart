import 'package:get/get.dart';

import '../../../../data/storage/store_global.dart';
import '../../../../models/bank_account_entity.dart';
import '../../../../models/card_entity.dart';
import '../../../../services/card_service.dart';
import '../../../../utils/enums.dart';

class ListCardController extends GetxController {
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