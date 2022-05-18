import 'package:agribank_banking/modules/card_service/card_service_controller.dart';
import 'package:get/get.dart';

class CardServiceBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CardServiceController());
  }

}