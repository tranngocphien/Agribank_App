import 'package:agribank_banking/modules/account_information/screens/qr_code/qr_code_controller.dart';
import 'package:get/get.dart';

class QrCodeBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => QrCodeController());
  }

}