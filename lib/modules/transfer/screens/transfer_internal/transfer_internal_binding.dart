import 'package:agribank_banking/modules/transfer/screens/transfer_internal/transfer_internal_controller.dart';
import 'package:get/get.dart';

class TransferInternalBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => TransferInternalController());
  }

}