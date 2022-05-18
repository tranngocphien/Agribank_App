import 'package:agribank_banking/modules/transfer/screens/ex_transfer_st/transfer_external_by_cardnum_controller.dart';
import 'package:get/get.dart';

class TransferExternalByCardNumberBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => TransferExternalByCardNumberController());
  }

}