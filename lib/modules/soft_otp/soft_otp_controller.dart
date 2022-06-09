import 'package:agribank_banking/data/storage/store_global.dart';
import 'package:get/get.dart';

class SoftOTPController extends GetxController {
  final turnOnOTP = StoreGlobal.user.value!.softOtp.obs;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

}