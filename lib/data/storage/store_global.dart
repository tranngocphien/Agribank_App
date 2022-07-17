import 'package:agribank_banking/models/response_login_entity.dart';
import 'package:get/get.dart';

import '../../models/bank_account_entity.dart';
class StoreGlobal {
  static Rx<bool> isLogin = false.obs;
  static var user = Rx<UserEntity?>(null);
  static var accounts = List<BankAccountEntity>.empty(growable: true).obs;
  static var soft = false.obs;

  static void deleteData() {
   isLogin = false.obs;
   user = Rx<UserEntity?>(null);
   accounts = List<BankAccountEntity>.empty(growable: true).obs;
   soft = false.obs;  }
}