import 'package:agribank_banking/modules/manage_contacts/manage_contact_controller.dart';
import 'package:get/get.dart';

class ManageContactBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ManageContactController());
  }

}