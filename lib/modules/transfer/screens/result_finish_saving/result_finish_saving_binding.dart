import 'package:agribank_banking/modules/transfer/screens/result_finish_saving/result_finish_saving_controller.dart';
import 'package:get/get.dart';

class ResultFinishSavingBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => ResultFinishSavingController());
  }

}