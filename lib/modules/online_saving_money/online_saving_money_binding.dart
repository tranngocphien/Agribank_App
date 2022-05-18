import 'package:agribank_banking/modules/online_saving_money/online_saving_money_controller.dart';
import 'package:get/get.dart';

class OnlineSavingMoneyBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => OnlineSavingMoneyController());
  }

}