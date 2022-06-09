import 'package:agribank_banking/modules/soft_otp/screens/turn_off_pin/turn_off_controller.dart';
import 'package:get/get.dart';

class TurnOffBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => TurnOffController());
  }

}