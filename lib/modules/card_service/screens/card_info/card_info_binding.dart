import 'package:agribank_banking/modules/card_service/screens/card_info/card_info_controller.dart';
import 'package:get/get.dart';

class CardInfoBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => CardInfoController());
  }

}