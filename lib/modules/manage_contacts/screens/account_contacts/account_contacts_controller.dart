import 'package:agribank_banking/models/response_list_contact.dart';
import 'package:agribank_banking/services/contact_service.dart';
import 'package:agribank_banking/utils/enums.dart';
import 'package:get/get.dart';

class AccountContactsController extends GetxController {
  final _contactService = ContactService.instance;

  final loadStatus = AppLoadStatus.idle.obs;

  final indexSelected = 0.obs;
  final internalContacts = List<ContactEntity>.empty(growable: true).obs;
  final externalContacts = List<ContactEntity>.empty(growable: true).obs;

  @override
  void onInit() async {
    // TODO: implement onInit
    loadStatus(AppLoadStatus.loading);
    await getListContacts();
    loadStatus(AppLoadStatus.success);
    super.onInit();
  }

  Future<void> getListContacts() async {
    var temp = await _contactService.getListContact(typeContact: 1);
    internalContacts..clear()..addAll(temp!.rows);
    temp = await _contactService.getListContact(typeContact: 2);
    externalContacts..clear()..addAll(temp!.rows);
  }

  Future<void> deleteContact(String contactId) async {
    loadStatus(AppLoadStatus.loading);
    await _contactService.deleteContact(id: contactId);
    await getListContacts();
    loadStatus(AppLoadStatus.success);

  }
}
