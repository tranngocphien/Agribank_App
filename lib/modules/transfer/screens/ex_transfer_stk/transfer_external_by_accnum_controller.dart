import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../../models/bank_account_entity.dart';
import '../../../../services/transaction_service.dart';
import '../../../../services/user_service.dart';
import '../../../../utils/enums.dart';

class TransferExternalByAccNumberController extends GetxController {
  final indexSelected = 0.obs;

  final _userService = UserService.instance;
  final _transactionService = TransactionService.instance;

  final accounts = List<BankAccountEntity>.empty(growable: true);
  final indexAccount = 0.obs;

  final loadStatus = AppLoadStatus.idle.obs;
  final controllerPhone = TextEditingController();

  @override
  Future<void> onInit() async {
    // TODO: implement onInit
    loadStatus(AppLoadStatus.loading);
    await getListAccountInformation();
    loadStatus(AppLoadStatus.success);
    super.onInit();
  }

  Future<void> getListAccountInformation() async {
    final listAcc = await _userService.getListBankAccount();
    accounts.addAll(listAcc);
  }

  Future<void> sendMoney() async {}

}