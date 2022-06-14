import 'package:agribank_banking/models/bank_account_entity.dart';
import 'package:agribank_banking/services/user_service.dart';
import 'package:agribank_banking/utils/enums.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../models/open_saving_account_entity.dart';

class AccountInformationController extends GetxController {
  final _userService = UserService.instance;
  final loadStatus = AppLoadStatus.idle.obs;

  final accounts = List<BankAccountEntity>.empty(growable: true).obs;
  final savingAccounts = List<AccountSaving>.empty(growable: true).obs;

  final clickedView = false.obs;

  @override
  Future<void> onInit() async {
    // TODO: implement onInit
    loadStatus(AppLoadStatus.loading);
    await getListAccountInformation();
    loadStatus(AppLoadStatus.success);
    super.onInit();
  }

  Future<void> getListAccountInformation() async{
    final listAcc = await _userService.getListBankAccount();
    accounts.addAll(listAcc);
  }

  Future<void> getListSavingAccount() async {
    final listSaving = await _userService.getListSavingAccount();
    savingAccounts..clear()..addAll(listSaving);
    if(savingAccounts.isEmpty){
      Get.dialog(CupertinoAlertDialog(
        title: const Text('Thông báo'),
        content: const Text('Quý khách chưa có tài khoản tiết kiệm nào'),
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