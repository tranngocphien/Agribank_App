import 'package:agribank_banking/modules/card_service/screens/list_card/list_card_controller.dart';
import 'package:get/get.dart';

class ListCardBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => ListCardController());
  }

}