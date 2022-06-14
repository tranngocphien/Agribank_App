import 'package:agribank_banking/modules/transfer/screens/result_phone/result_phone_controller.dart';
import 'package:get/get.dart';

class ResultPhoneBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => ResultPhoneController());
  }

}