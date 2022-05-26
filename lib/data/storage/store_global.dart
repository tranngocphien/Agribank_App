import 'package:agribank_banking/models/response_login_entity.dart';
import 'package:get/get.dart';
class StoreGlobal {
  static Rx<bool> isLogin = false.obs;
  static final user = Rx<UserEntity?>(null);
}