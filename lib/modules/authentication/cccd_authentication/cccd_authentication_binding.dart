import 'package:get/get.dart';

import 'cccd_authentication_controller.dart';

class CccdAuthenticationBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => CccdAuthenticationController());

  }

}