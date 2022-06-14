import 'package:agribank_banking/models/bank_account_entity.dart';
import 'package:agribank_banking/services/user_service.dart';
import 'package:agribank_banking/utils/enums.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../../models/response_list_contact.dart';
import '../../../../routes/app_routes.dart';
import '../../../../services/contact_service.dart';
import '../../../../services/transaction_service.dart';

class TransferInternalController extends GetxController {
  final userName = Rx<String?>(null);
  final controllerAccount = TextEditingController();
  var errorAccount = Rx<String?>(null);
  var errorMoney = Rx<String?>(null);
  var errorContent = Rx<String?>(null);

  var account = Rx<String?>(null);
  var money = Rx<String?>(null);
  var content = Rx<String?>(null);

  final _userService = UserService.instance;
  final _transactionService = TransactionService.instance;
  final _contactService = ContactService.instance;

  final accounts = List<BankAccountEntity>.empty(growable: true);
  final indexAccount = 0.obs;

  final isSaveAccount = false.obs;

  final loadStatus = AppLoadStatus.idle.obs;

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


  Future<void> getListContacts() async {
    var temp = await _contactService.getListContact(typeContact: 1);
    internalContacts.addAll(temp!.rows);
  }

  Future<void> getUserName() async {
    try {
      loadStatus(AppLoadStatus.loading);
      final response  = await _transactionService.getUserInternal(destination: account.value ?? '');
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

  Future<void> sendMoney({String? pin, String? password}) async {
    if(checkData()){
      try {
        final res = await _transactionService.sendMoney(
            accountSender: accounts[indexAccount.value].accountNumber,
            accountReceiver: account.value ?? '',
            money: int.parse(money.value == null ? '': money.value!.replaceAll(',', '')),
            content: content.value ?? '',
            saveContact: isSaveAccount.value ? 1 : 0,
            password: password,
            pin: pin);
        Get.toNamed(AppRoutes.resultTransaction, arguments: res);
        // Get.dialog(CupertinoAlertDialog(
        //   title: const Text('Thông báo'),
        //   content: const Text('Giao dịch thành công'),
        //   actions: [
        //     CupertinoDialogAction(
        //       onPressed: () {
        //         Get.until((route) => Get.currentRoute == AppRoutes.transferInternal);
        //       },
        //       child: const Text('Đồng ý'),
        //     )
        //   ],
        // ));

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

  bool checkData() {
    bool flag = true;
    if(account.value == null){
      errorAccount.value = 'Chưa nhập số tài khoản';
      flag =  false;
    }
    else {
      errorAccount.value = null;
    }
    if(money.value == null){
      errorMoney.value = 'Chưa nhập số tiền';
      flag =  false;
    }
    else {
      errorMoney.value = null;
    }
    if(content.value == null){
      errorContent.value = 'Chưa nhập nội dung';
      flag =  false;
    }
    else {
      errorContent.value = null;
    }
    return flag;
  }
}
