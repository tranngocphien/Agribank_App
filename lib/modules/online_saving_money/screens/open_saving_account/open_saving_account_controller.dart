import 'package:agribank_banking/models/cycle_entity.dart';
import 'package:agribank_banking/models/static_money.dart';
import 'package:agribank_banking/services/cycle_service.dart';
import 'package:agribank_banking/services/transaction_service.dart';
import 'package:agribank_banking/utils/constants.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../../models/bank_account_entity.dart';
import '../../../../routes/app_routes.dart';
import '../../../../services/user_service.dart';
import '../../../../utils/enums.dart';

class OpenSavingAccountController extends GetxController {
  final _userService = UserService.instance;
  final _cycleService = CycleService.instance;
  final _transactionService = TransactionService.instance;

  final loadStatus = AppLoadStatus.idle.obs;

  final accounts = List<BankAccountEntity>.empty(growable: true).obs;
  final indexAccount = 0.obs;

  final controllerType = TextEditingController();
  final controllerCycle = TextEditingController();
  final controllerMoney = TextEditingController();
  final controllerTypeRenew = TextEditingController();

  final cycles = List<CycleEntity>.empty(growable: true).obs;
  final indexCycles = (-1).obs;

  final isAcceptPolicy = false.obs;

  final typeRenews = [
    Attribute(
        title: 'Tự động gia hạn gốc',
        value: TypeRenewSavingAccount.autoRenewOrigin),
    Attribute(
        title: 'Tự động gia hạn gốc và lãi',
        value: TypeRenewSavingAccount.autoRenewOriginAndInterest),
    Attribute(
        title: 'Tự động tất toán khi đến hạn',
        value: TypeRenewSavingAccount.autoFinishSaving)
  ];
  final indexTypeRenews = 0.obs;

  @override
  Future<void> onInit() async {
    // TODO: implement onInit
    loadStatus(AppLoadStatus.loading);
    controllerType.text = 'Tiền gửi trực tuyến';
    await Future.wait([getListAccountInformation(), getListCycles()]);
    loadStatus(AppLoadStatus.success);
    super.onInit();
  }

  Future<void> getListAccountInformation() async {
    final listAcc = await _userService.getListBankAccount();
    accounts.addAll(listAcc);
  }

  Future<void> getListCycles() async {
    final resCycles = await _cycleService.getListCycle();
    cycles..clear()..addAll(resCycles);
  }

  Future<void> openSavingAccount() async {
    try {
      final res = await _transactionService.openSavingAccount(
          typeRenew: typeRenews[indexTypeRenews.value].value,
          money: int.parse(controllerMoney.text.replaceAll(',', '')),
          sourceAccountNumber: accounts[indexAccount.value].accountNumber,
          cycleId: cycles[indexCycles.value].id);
      Get.toNamed(AppRoutes.resultOpenSaving, arguments: res);
    } on DioError catch (e) {
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
