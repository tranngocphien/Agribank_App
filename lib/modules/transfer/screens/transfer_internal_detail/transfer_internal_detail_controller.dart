import 'package:get/get.dart';

class TransferInternalDetailController extends GetxController {
  String senderAccount = Get.arguments[0];
  String receiverAccount = Get.arguments[1];
  String money = Get.arguments[2];
  String content = Get.arguments[3];
  String name = Get.arguments[4];

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

}