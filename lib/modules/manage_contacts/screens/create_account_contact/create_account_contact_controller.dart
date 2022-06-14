import 'package:agribank_banking/models/static_money.dart';
import 'package:agribank_banking/modules/manage_contacts/screens/account_contacts/account_contacts_controller.dart';
import 'package:agribank_banking/services/contact_service.dart';
import 'package:agribank_banking/utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class CreateAccountContactController extends GetxController {
  final types = [
    Attribute(title: 'Chuyển khoản nội bộ', value: '1'),
    Attribute(title: 'Chuyển khoản liên ngân hàng', value: '2')
  ];
  final indexType = 0.obs;
  final indexBank = 0.obs;

  final controllerType = TextEditingController();
  final controllerName = TextEditingController();
  final controllerBank = TextEditingController();
  final controllerAccount = TextEditingController();

  final _contactService = ContactService.instance;

  @override
  void onInit() {
    // TODO: implement onInit
    controllerType.text = types[indexType.value].title;
    super.onInit();
  }

  Future<void> addContact() async {
    final newContact = await _contactService.createContact(
        typeContact: types[indexType.value].value,
        nickName: controllerName.text,
        accountNumber: controllerAccount.text,
        nameBankInterbank: bank[indexBank.value].value);
    final accsController = Get.find<AccountContactsController>();
    if(indexType.value == 0){
      accsController.internalContacts.add(newContact!);
    }
    else {
      accsController.externalContacts.add(newContact!);
    }
    Get.back();
  }
}
