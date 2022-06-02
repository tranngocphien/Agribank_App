import 'package:agribank_banking/modules/soft_otp/soft_otp_controller.dart';
import 'package:get/get.dart';

class SoftOTPBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SoftOTPController());
  }

}