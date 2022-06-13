import 'package:agribank_banking/modules/buy_card_phone/buy_card_phone_controller.dart';
import 'package:agribank_banking/modules/online_saving_money/screens/open_saving_account/open_saving_account_controller.dart';
import 'package:agribank_banking/modules/recharge_phone/recharge_phone_controller.dart';
import 'package:agribank_banking/modules/transfer/screens/ex_transfer_stk/transfer_external_by_accnum_controller.dart';
import 'package:agribank_banking/modules/transfer/screens/transfer_internal/transfer_internal_controller.dart';
import 'package:agribank_banking/utils/enums.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

class ConfirmTransactionController extends GetxController {
  TransactionType type = Get.arguments;
  // final controllerPin = TextEditingController();
  final pin = Rx<String?>(null);

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
            await controller.rechargePhone(pin: pin.value ?? '');
          } on DioError catch (e) {}
          break;
        }
      case (TransactionType.sendMoney):
        {
          try {
            final controller = Get.find<TransferInternalController>();
            await controller.sendMoney(pin: pin.value ?? '');
          } on DioError catch (e) {}
          break;
        }
      case (TransactionType.buyCodePhone):
        {
          final controller = Get.find<BuyCardPhoneController>();
          controller.buyCodePhone(pin: pin.value ?? '');
          break;
        }
      case (TransactionType.sendMoneyInterbank):
        {
          final controller = Get.find<TransferExternalByAccNumberController>();
          await controller.sendMoneyInterbank(pin: pin.value ?? '');
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
