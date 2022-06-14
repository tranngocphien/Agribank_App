import 'package:agribank_banking/modules/card_service/screens/detail_card_info/detail_card_info_controller.dart';
import 'package:get/get.dart';

class DetailCardInfoBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => DetailCardInfoController());
  }

}