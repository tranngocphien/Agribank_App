import 'package:get/get.dart';

class TransferExternalByAccNumDetailController extends GetxController {
  final arguments = Get.arguments;
  String? senderAccount;
  String? receiverAccount;
  String? name;
  String? amount;
  String? content;
  @override
  void onInit() {
    initData();
    // TODO: implement onInit
    super.onInit();
  }

  void initData(){
    senderAccount = arguments['sender_account'];
    receiverAccount = arguments['receiver_account'];
    name = arguments['name'];
    amount = arguments['amount'];
    content = arguments['content'];
  }



}