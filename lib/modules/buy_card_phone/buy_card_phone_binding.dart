import 'package:agribank_banking/modules/buy_card_phone/buy_card_phone_controller.dart';
import 'package:get/get.dart';

class BuyCardPhoneBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => BuyCardPhoneController());
  }

}