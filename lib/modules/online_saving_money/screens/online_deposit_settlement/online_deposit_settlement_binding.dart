import 'package:agribank_banking/modules/online_saving_money/screens/online_deposit_settlement/online_deposit_settlement_controller.dart';
import 'package:get/get.dart';

class OnlineDepositSettlementBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => OnlineDepositSettlementController());
  }

}