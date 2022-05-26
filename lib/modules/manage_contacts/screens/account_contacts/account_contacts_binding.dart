import 'package:agribank_banking/modules/manage_contacts/screens/account_contacts/account_contacts_controller.dart';
import 'package:get/get.dart';

class AccountContactsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AccountContactsController());
  }

}