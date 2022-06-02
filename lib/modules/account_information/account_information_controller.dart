import 'package:agribank_banking/models/bank_account_entity.dart';
import 'package:agribank_banking/services/user_service.dart';
import 'package:agribank_banking/utils/enums.dart';
import 'package:get/get.dart';

class AccountInformationController extends GetxController {
  final _userService = UserService.instance;
  final loadStatus = AppLoadStatus.idle.obs;

  final accounts = List<BankAccountEntity>.empty(growable: true).obs;

  @override
  Future<void> onInit() async {
    // TODO: implement onInit
    loadStatus(AppLoadStatus.loading);
    await getListAccountInformation();
    loadStatus(AppLoadStatus.success);
    super.onInit();
  }

  Future<void> getListAccountInformation() async{
    final listAcc = await _userService.getListBankAccount();
    accounts.addAll(listAcc);
  }

}