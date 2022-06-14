import 'package:agribank_banking/modules/transfer/screens/result_transaction/result_transaction_controller.dart';
import 'package:get/get.dart';

class ResultTransactionBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => ResultTransactionController());
  }

}