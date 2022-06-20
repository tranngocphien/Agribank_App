import 'package:agribank_banking/modules/authentication/update_information/update_information_controller.dart';
import 'package:get/get.dart';

class UpdateInformationBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => UpdateInformationController());
  }

}