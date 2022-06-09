import 'package:agribank_banking/data/storage/store_global.dart';
import 'package:agribank_banking/services/transaction_service.dart';
import 'package:agribank_banking/services/user_service.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../../models/open_saving_account_entity.dart';
import '../../../../utils/enums.dart';

class OnlineDepositSettlementController extends GetxController {
  final _userService = UserService.instance;
  final _transactionService = TransactionService.instance;

  final loadStatus = AppLoadStatus.idle.obs;

  final savingAccounts = List<AccountSaving>.empty(growable: true).obs;
  final indexSavingAccount = 0.obs;

  final bankAccounts = StoreGlobal.accounts;
  final indexAccount = 0.obs;

  final controllerSourceAccount = TextEditingController();
  final controllerReceiveAcc = TextEditingController();

  @override
  void onInit() async {
    // TODO: implement onInit
    loadStatus(AppLoadStatus.loading);
    controllerReceiveAcc.text = bankAccounts[indexAccount.value].accountNumber;
    await getListSavingAccount();
    loadStatus(AppLoadStatus.success);
    super.onInit();
  }

  Future<void> getListSavingAccount() async {
    savingAccounts
      ..clear()
      ..addAll(await _userService.getListSavingAccount());
    if (savingAccounts.isNotEmpty) {
      controllerSourceAccount.text =
          savingAccounts[indexSavingAccount.value].accountNumber;
    }
  }

  Future<void> finishSavingAccount() async {
    if(savingAccounts.isNotEmpty){
      try {
        await _transactionService.finishSavingMoney(
            savingAccountNumber:
            savingAccounts[indexSavingAccount.value].accountNumber,
            receiveAccountNumber: bankAccounts[indexAccount.value].accountNumber);
        Get.dialog(CupertinoAlertDialog(
          title: const Text('Thông báo'),
          content: const Text('Tất toán tài khoản tiền gửi trực tuyến thành công'),
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
    else {
      Get.dialog(CupertinoAlertDialog(
        title: const Text('Thông báo'),
        content: const Text('Bạn không có tài khoản tiền gửi nào'),
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
