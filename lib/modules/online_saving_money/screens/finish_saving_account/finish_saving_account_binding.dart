import 'package:agribank_banking/modules/online_saving_money/screens/finish_saving_account/finish_saving_account_controller.dart';
import 'package:get/get.dart';

class FinishSavingAccountBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => FinishSavingAccountController());
  }

}