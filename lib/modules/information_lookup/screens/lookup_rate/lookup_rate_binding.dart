import 'package:agribank_banking/modules/information_lookup/screens/lookup_rate/lookup_rate_controller.dart';
import 'package:get/get.dart';

class LookupRateBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => LookupRateController());
  }

}