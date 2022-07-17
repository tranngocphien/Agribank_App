import 'package:agribank_banking/modules/card_service/screens/update_pin_code/update_pin_code_controller.dart';
import 'package:get/get.dart';

class UpdatePinCodeBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => UpdatePinCardController());
  }

}