import 'package:agribank_banking/modules/transfer/screens/confirm_transaction_password/confirm_transaction_password_controller.dart';
import 'package:get/get.dart';

class ConfirmTransactionPasswordBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => ConfirmTransactionPasswordController());
  }

}