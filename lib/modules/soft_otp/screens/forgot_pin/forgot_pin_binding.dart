import 'package:agribank_banking/modules/soft_otp/screens/forgot_pin/forgot_pin_controller.dart';
import 'package:get/get.dart';

class ForgotPinBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => ForgotPinController());
  }

}