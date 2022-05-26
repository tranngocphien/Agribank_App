import 'package:agribank_banking/modules/transfer/screens/transfer_internal_detail/transfer_internal_detail_controller.dart';
import 'package:get/get.dart';

class TransferInternalDetailBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => TransferInternalDetailController());
  }

}