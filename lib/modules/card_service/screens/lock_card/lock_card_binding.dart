import 'package:agribank_banking/modules/card_service/screens/lock_card/lock_card_controller.dart';
import 'package:get/get.dart';

class LockCardBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => LockCardController());
  }

}