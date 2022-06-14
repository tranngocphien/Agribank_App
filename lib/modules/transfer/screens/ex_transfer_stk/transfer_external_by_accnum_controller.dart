import 'package:agribank_banking/services/contact_service.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../../models/bank_account_entity.dart';
import '../../../../models/response_list_contact.dart';
import '../../../../routes/app_routes.dart';
import '../../../../services/transaction_service.dart';
import '../../../../services/user_service.dart';
import '../../../../utils/enums.dart';

class TransferExternalByAccNumberController extends GetxController {
  final indexSelected = 0.obs;

  final _userService = UserService.instance;
  final _transactionService = TransactionService.instance;
  final _contactService = ContactService.instance;

  final userName = Rx<String?>(null);

  final accounts = List<BankAccountEntity>.empty(growable: true);
  final indexAccount = 0.obs;

  final loadStatus = AppLoadStatus.idle.obs;

  final isSaveAccount = false.obs;

  final TextEditingController controllerPhone = TextEditingController();
  final TextEditingController controllerAmount = TextEditingController();
  final TextEditingController controllerContent = TextEditingController();
  final TextEditingController controllerBank = TextEditingController();
  final TextEditingController controllerName = TextEditingController();

  final indexBank = 0.obs;

  final indexContact = 0.obs;
  final internalContacts = List<ContactEntity>.empty(growable: true).obs;

  @override
  Future<void> onInit() async {
    // TODO: implement onInit
    loadStatus(AppLoadStatus.loading);
    await getListAccountInformation();
    await getListContacts();
    loadStatus(AppLoadStatus.success);
    super.onInit();
  }

  Future<void> getUserName() async {
    try {
      loadStatus(AppLoadStatus.loading);
      final response  = await _transactionService.getUserInterbank(destination: controllerPhone.text);
      userName.value = response!.name;
      loadStatus(AppLoadStatus.success);
    }
    on DioError catch (e) {
      loadStatus(AppLoadStatus.failed);
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


  Future<void> getListAccountInformation() async {
    final listAcc = await _userService.getListBankAccount();
    accounts.addAll(listAcc);
  }

  Future<void> getListContacts() async {
    var temp = await _contactService.getListContact(typeContact: 2);
    internalContacts.addAll(temp!.rows);
  }

  Future<void> sendMoneyInterbank({String? pin, String? password}) async {
    try {
      final res = await _transactionService.sendMoneyInterbank(
          accountSender: accounts[indexAccount.value].accountNumber,
          accountReceiver: controllerPhone.text,
          money: int.parse(controllerAmount.text.replaceAll(',', '')),
          content: controllerContent.text,
          saveContact: isSaveAccount.value ? 1 : 0,
          pin: pin,
          password: password,
          nameInterbank: controllerBank.text,
          nameReceiver: userName.value ?? 'TRẦN QUANG HIẾU');
      Get.toNamed(AppRoutes.resultTransaction, arguments: res);

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
