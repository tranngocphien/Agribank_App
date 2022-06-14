import 'package:agribank_banking/modules/account_information/screens/detail_saving_account/detail_saving_account_controller.dart';
import 'package:get/get.dart';

class DetailSavingAccountBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => DetailSavingAccountController());
  }

}