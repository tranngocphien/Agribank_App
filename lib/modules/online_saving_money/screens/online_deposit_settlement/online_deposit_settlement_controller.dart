import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class OnlineDepositSettlementController extends GetxController {
  final controllerReceiveAcc = TextEditingController();

  @override
  void onInit() {
    // TODO: implement onInit
    controllerReceiveAcc.text = '111111111111111';
    super.onInit();
  }

}