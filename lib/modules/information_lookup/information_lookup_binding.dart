import 'package:agribank_banking/modules/information_lookup/information_lookup_controller.dart';
import 'package:get/get.dart';

class InformationLookkupBindings extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => InformationLookupController());
  }

}