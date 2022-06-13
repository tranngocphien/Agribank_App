import 'package:agribank_banking/modules/transfer/screens/update_limit_trans/update_limit_trans_controller.dart';
import 'package:get/get.dart';

class UpdateLimitTransBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => UpdateLimitTransController());
  }

}