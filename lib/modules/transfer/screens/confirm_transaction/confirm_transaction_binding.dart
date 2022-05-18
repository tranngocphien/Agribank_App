import 'package:agribank_banking/modules/transfer/screens/confirm_transaction/confirm_transaction_controller.dart';
import 'package:get/get.dart';

class ConfirmTransactionBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ConfirmTransactionController());
  }

}