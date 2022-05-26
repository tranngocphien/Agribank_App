import 'package:agribank_banking/modules/buy_card_phone/buy_card_phone_controller.dart';
import 'package:agribank_banking/modules/recharge_phone/recharge_phone_controller.dart';
import 'package:agribank_banking/modules/transfer/screens/transfer_internal/transfer_internal_controller.dart';
import 'package:agribank_banking/routes/app_routes.dart';
import 'package:agribank_banking/utils/enums.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ConfirmTransactionController extends GetxController {
  TransactionType type = Get.arguments;
  final controllerPin = TextEditingController();
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  Future<void> onConfirmTransaction() async {
    switch (type) {
      case (TransactionType.rechargePhone):
        {
          try {
            final controller = Get.find<RechargePhoneController>();
            await controller.rechargePhone(pin: controllerPin.text);
          } on DioError catch (e) {}
          break;
        }
      case (TransactionType.sendMoney):
        {
          try {
            final controller = Get.find<TransferInternalController>();
            await controller.sendMoney(pin: controllerPin.text);
          } on DioError catch (e) {}
          break;
        }
      case (TransactionType.buyCodePhone):
        {
          final controller = Get.find<BuyCardPhoneController>();
          controller.buyCodePhone(pin: controllerPin.text);
        }
    }
  }
}
