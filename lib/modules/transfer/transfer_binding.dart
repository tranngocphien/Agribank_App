import 'package:agribank_banking/modules/transfer/transfer_controller.dart';
import 'package:get/get.dart';

class TransferBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => TransferController());
  }

}