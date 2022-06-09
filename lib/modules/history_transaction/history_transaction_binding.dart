import 'package:agribank_banking/modules/history_transaction/history_transaction_controller.dart';
import 'package:get/get.dart';

class HistoryTransactionBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HistoryTransactionController());
  }

}