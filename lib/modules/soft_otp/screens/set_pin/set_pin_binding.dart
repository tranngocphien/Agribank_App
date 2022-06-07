import 'package:agribank_banking/modules/soft_otp/screens/set_pin/set_pin_controller.dart';
import 'package:get/get.dart';

class SetPinBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SetPinController());
  }

}