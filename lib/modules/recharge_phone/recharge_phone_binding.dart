import 'package:agribank_banking/modules/recharge_phone/recharge_phone_controller.dart';
import 'package:get/get.dart';

class RechargePhoneBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => RechargePhoneController());
  }

}