import 'package:agribank_banking/modules/information_lookup/screens/lookup_address/lookup_address_controller.dart';
import 'package:get/get.dart';

class LookupAddressBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => LookupAddressController());
  }

}