import 'package:agribank_banking/modules/detail_information/detail_information_controller.dart';
import 'package:get/get.dart';

class DetailInformationBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => DetailInformationController());
  }

}