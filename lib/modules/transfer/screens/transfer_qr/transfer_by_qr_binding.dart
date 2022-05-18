import 'package:agribank_banking/modules/transfer/screens/transfer_qr/transfer_by_qr_controller.dart';
import 'package:get/get.dart';

class TransferByQrBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => TransferByQrController());
  }

}