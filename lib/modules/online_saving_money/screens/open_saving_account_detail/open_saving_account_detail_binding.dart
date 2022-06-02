import 'package:agribank_banking/modules/online_saving_money/screens/open_saving_account_detail/open_saving_account_detail_controller.dart';
import 'package:get/get.dart';

class OpenSavingAccountDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => OpenSavingAccountDetailController());
  }

}