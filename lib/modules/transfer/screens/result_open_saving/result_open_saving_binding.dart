import 'package:agribank_banking/modules/transfer/screens/result_open_saving/result_open_saving_controller.dart';
import 'package:get/get.dart';

class ResultOpenSavingBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => ResultOpenSavingController());
  }

}