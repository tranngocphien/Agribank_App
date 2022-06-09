import 'package:agribank_banking/modules/manage_contacts/screens/detail_contact/detail_contact_controller.dart';
import 'package:get/get.dart';

class DetailContactBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => DetailContactController());
  }

}