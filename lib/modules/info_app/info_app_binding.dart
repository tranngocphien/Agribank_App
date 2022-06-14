import 'package:agribank_banking/modules/info_app/info_app_controller.dart';
import 'package:get/get.dart';

class InfoAppBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => InfoAppController());
  }

}