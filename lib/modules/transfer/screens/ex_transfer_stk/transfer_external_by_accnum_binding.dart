import 'package:agribank_banking/modules/transfer/screens/ex_transfer_stk/transfer_external_by_accnum_controller.dart';
import 'package:get/get.dart';

class TransferExternalByAccNumberBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => TransferExternalByAccNumberController());
  }

}