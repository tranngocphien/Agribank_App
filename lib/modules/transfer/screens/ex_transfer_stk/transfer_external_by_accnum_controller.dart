import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../../models/bank_account_entity.dart';
import '../../../../routes/app_routes.dart';
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

  final isSaveAccount = false.obs;

  final TextEditingController controllerPhone = TextEditingController();
  final TextEditingController controllerAmount = TextEditingController();
  final TextEditingController controllerContent = TextEditingController();
  final TextEditingController controllerBank = TextEditingController();
  final TextEditingController controllerName = TextEditingController();

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

  Future<void> sendMoneyInterbank({required String pin}) async {
    try {
      await _transactionService.sendMoneyInterbank(
          accountSender: accounts[indexAccount.value].accountNumber,
          accountReceiver: controllerPhone.text,
          money: int.parse(controllerAmount.text),
          content: controllerContent.text,
          saveContact: isSaveAccount.value ? 1 : 0,
          pin: pin,
          nameInterbank: controllerBank.text,
          nameReceiver: controllerName.text);
      Get.dialog(CupertinoAlertDialog(
        title: const Text('Thông báo'),
        content: const Text('Giao dịch thành công'),
        actions: [
          CupertinoDialogAction(
            onPressed: () {
              Get.offAndToNamed(AppRoutes.home);
            },
            child: const Text('Đồng ý'),
          )
        ],
      ));
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
