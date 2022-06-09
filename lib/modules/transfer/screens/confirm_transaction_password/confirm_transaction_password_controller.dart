import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../../utils/enums.dart';
import '../../../buy_card_phone/buy_card_phone_controller.dart';
import '../../../online_saving_money/screens/open_saving_account/open_saving_account_controller.dart';
import '../../../recharge_phone/recharge_phone_controller.dart';
import '../ex_transfer_stk/transfer_external_by_accnum_controller.dart';
import '../transfer_internal/transfer_internal_controller.dart';

class ConfirmTransactionPasswordController extends GetxController{
  TransactionType type = Get.arguments;
  final controllerPassword = TextEditingController();
  @override
  void onInit() {
    // TODO: implement onInit
    controllerPassword.text = '';
    super.onInit();
  }

  Future<void> onConfirmTransaction() async {
    switch (type) {
      case (TransactionType.rechargePhone):
        {
          try {
            final controller = Get.find<RechargePhoneController>();
            await controller.rechargePhone(password: controllerPassword.text);
          } on DioError catch (e) {}
          break;
        }
      case (TransactionType.sendMoney):
        {
          try {
            final controller = Get.find<TransferInternalController>();
            await controller.sendMoney(password: controllerPassword.text);
          } on DioError catch (e) {}
          break;
        }
      case (TransactionType.buyCodePhone):
        {
          final controller = Get.find<BuyCardPhoneController>();
          controller.buyCodePhone(password: controllerPassword.text);
          break;
        }
      case (TransactionType.sendMoneyInterbank):
        {
          final controller = Get.find<TransferExternalByAccNumberController>();
          await controller.sendMoneyInterbank(password: controllerPassword.text);
          break;
        }
      case (TransactionType.openSavingAccount):
        {
          final controller = Get.find<OpenSavingAccountController>();
          await controller.openSavingAccount();
          break;

        }
    }
  }

}