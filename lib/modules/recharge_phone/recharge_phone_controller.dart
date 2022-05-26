import 'package:agribank_banking/models/static_money.dart';
import 'package:agribank_banking/services/transaction_service.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../models/bank_account_entity.dart';
import '../../routes/app_routes.dart';
import '../../services/user_service.dart';
import '../../utils/enums.dart';

class RechargePhoneController extends GetxController {
  final indexSelected = 0.obs;
  final values = [
    Money(title: '20,000 VND', value: 20000),
    Money(title: '30,000 VND', value: 30000),
    Money(title: '50,000 VND', value: 50000),
    Money(title: '100,000 VND', value: 100000),
    Money(title: '200,000 VND', value: 200000),
    Money(title: '500,000 VND', value: 500000),
  ];

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

  Future<void> rechargePhone({required String pin}) async {
    try {
      await _transactionService.rechargePhone(
          accountNumber: accounts[indexAccount.value].accountNumber,
          phone: controllerPhone.text,
          money: values[indexSelected.value].value,
          pin: pin);
    } on DioError catch (e) {
      final message = (e.response!.data as Map)['message'];
      Get.dialog(CupertinoAlertDialog(
        title: const Text('Thông báo'),
        content: Text(message),
        actions: [
          CupertinoDialogAction(
            onPressed: () {
              Get.offAndToNamed(AppRoutes.home);
            },
            child: const Text('Đồng ý'),
          )
        ],
      ));
    }
  }
}
