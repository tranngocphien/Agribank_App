import 'package:agribank_banking/modules/manage_contacts/screens/create_account_contact/create_account_contact_controller.dart';
import 'package:get/get.dart';

class CreateAccountContactBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CreateAccountContactController());
  }

}