import 'package:agribank_banking/modules/online_saving_money/screens/open_saving_account/open_saving_account_controller.dart';
import 'package:get/get.dart';

class OpenSavingAccountBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => OpenSavingAccountController());
  }

}