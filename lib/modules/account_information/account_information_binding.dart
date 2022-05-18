import 'package:agribank_banking/modules/account_information/account_information_controller.dart';
import 'package:get/get.dart';

class AccountInformationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AccountInformationController());
  }

}