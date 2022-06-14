import 'package:agribank_banking/modules/history_transaction/screens/detail_history_transaction/detail_history_transaction_controller.dart';
import 'package:get/get.dart';

class DetailHistoryTransactionBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => DetailHistoryTransactionController());
  }

}