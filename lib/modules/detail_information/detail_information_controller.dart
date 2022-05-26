import 'package:agribank_banking/models/bank_account_entity.dart';
import 'package:get/get.dart';

class DetailInformationController extends GetxController {
  BankAccountEntity account = Get.arguments[0];

  final startDate = DateTime.now().obs;
  final endDate = DateTime.now().obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

}