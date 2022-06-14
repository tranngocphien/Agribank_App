import 'package:agribank_banking/models/bank_account_entity.dart';
import 'package:get/get.dart';

import '../../../../models/open_saving_account_entity.dart';

class FinishSavingAccountController extends GetxController {
  final AccountSaving accounts = Get.arguments[0];
  final BankAccountEntity bankAccount = Get.arguments[1];


}