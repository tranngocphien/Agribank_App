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
  final TextEditingController controllerPhone = TextEditingController();
  final TextEditingController controllerAmount = TextEditingController();
  final TextEditingController controllerContent = TextEditingController();

  var errorAccount = Rx<String?>(null);
  var errorMoney = Rx<String?>(null);
  var errorContent = Rx<String?>(null);

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
    // Future.wait([getListAccountInformation(), getListContacts()]);
    await getListAccountInformation();
    await getListContacts();
    // await getListAccountInformation();
    loadStatus(AppLoadStatus.success);
    super.onInit();
  }

  @override
  Future<void> onClose() async {
    // TODO: implement onInit
    controllerContent.dispose();
    controllerAmount.dispose();
    controllerPhone.dispose();
    super.onClose();
  }

  @override
  Future<void> onReady() async {
    // TODO: implement onInit
    controllerContent.text = '';
    controllerAmount.text = '';
    controllerPhone.text = '';
    super.onReady();
  }

  Future<void> getListContacts() async {
    var temp = await _contactService.getListContact(typeContact: 1);
    internalContacts.addAll(temp!.rows);
  }


  Future<void> getListAccountInformation() async {
    final listAcc = await _userService.getListBankAccount();
    accounts.addAll(listAcc);
  }

  Future<void> sendMoney({String? pin, String? password}) async {
    if(checkData()){
      try {
        await _transactionService.sendMoney(
            accountSender: accounts[indexAccount.value].accountNumber,
            accountReceiver: controllerPhone.text,
            money: int.parse(controllerAmount.text.replaceAll(',', '')),
            content: controllerContent.text,
            saveContact: isSaveAccount.value ? 1 : 0,
            password: password,
            pin: pin);
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

  bool checkData() {
    bool flag = true;
    if(controllerPhone.text.isEmpty){
      errorAccount.value = 'Chưa nhập số tài khoản';
      flag =  false;
    }
    else {
      errorAccount.value = null;
    }
    if(controllerAmount.text.isEmpty){
      errorMoney.value = 'Chưa nhập số tiền';
      flag =  false;
    }
    else {
      errorMoney.value = null;
    }
    if(controllerContent.text.isEmpty){
      errorContent.value = 'Chưa nhập nội dung';
      flag =  false;
    }
    else {
      errorContent.value = null;
    }
    return flag;
  }
}
