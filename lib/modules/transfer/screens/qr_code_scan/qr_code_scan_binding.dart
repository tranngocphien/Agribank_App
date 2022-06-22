import 'package:agribank_banking/modules/transfer/screens/qr_code_scan/qr_code_scan_controller.dart';
import 'package:get/get.dart';

class QrCodeScanBindings extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => QrCodeScanController());
  }

}