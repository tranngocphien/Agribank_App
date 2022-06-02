import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../models/bank_account_entity.dart';
import '../../models/static_money.dart';
import '../../routes/app_routes.dart';
import '../../services/transaction_service.dart';
import '../../services/user_service.dart';
import '../../utils/enums.dart';

class BuyCardPhoneController extends GetxController {
  final indexSelected = 0.obs;

  final homeNetworks = [
    Attribute(title: 'MobiFone', value: 'mobifone'),
    Attribute(title: 'Viettel', value: 'viettel'),
    Attribute(title: 'VinaPhone', value: 'vinaphone'),
  ];
  final indexHomeNetword = 0.obs;

  final moneys = [
    Attribute(title: '10,000 VND', value: '10000'),
    Attribute(title: '20,000 VND', value: '20000'),
    Attribute(title: '30,000 VND', value: '30000'),
    Attribute(title: '50,000 VND', value: '50000'),
    Attribute(title: '100,000 VND', value: '100000'),
    Attribute(title: '200,000 VND', value: '200000'),
    Attribute(title: '300,000 VND', value: '300000'),
    Attribute(title: '500,000 VND', value: '500000'),
  ];
  final indexMoney = 0.obs;

  final _userService = UserService.instance;
  final _transactionService = TransactionService.instance;

  final accounts = List<BankAccountEntity>.empty(growable: true);
  final indexAccount = 0.obs;

  final loadStatus = AppLoadStatus.idle.obs;
  final controllerHomeNetword = TextEditingController();
  final controllerMoney = TextEditingController();

  @override
  Future<void> onInit() async {
    // TODO: implement onInit
    loadStatus(AppLoadStatus.loading);
    initData();
    await getListAccountInformation();
    loadStatus(AppLoadStatus.success);
    super.onInit();
  }

  void initData() {
    controllerHomeNetword.text = homeNetworks[indexHomeNetword.value].title;
    controllerMoney.text = moneys[indexMoney.value].title;
  }

  Future<void> getListAccountInformation() async {
    final listAcc = await _userService.getListBankAccount();
    accounts.addAll(listAcc);
  }

  Future<void> buyCodePhone({required String pin}) async {
    try {
      await _transactionService.buyCodePhone(
          accountNumber: accounts[indexAccount.value].accountNumber,
          homeNetword: homeNetworks[indexHomeNetword.value].value,
          money: int.parse(moneys[indexMoney.value].value),
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
