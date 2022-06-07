import 'package:agribank_banking/modules/soft_otp/screens/update_pin/update_pin_controller.dart';
import 'package:get/get.dart';

class UpdatePinBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => UpdatePinController());

  }

}