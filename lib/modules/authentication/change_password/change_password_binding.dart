import 'package:agribank_banking/modules/authentication/change_password/change_password_controller.dart';
import 'package:get/get.dart';

class ChangePasswordBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => ChangePasswordController());
  }

}