import 'package:agribank_banking/modules/transfer/screens/ex_transfer_stk_detail/transfer_external_by_accnum_detail_controller.dart';
import 'package:get/get.dart';

class TransferExternalByAccNumberDetailBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => TransferExternalByAccNumDetailController());
  }

}