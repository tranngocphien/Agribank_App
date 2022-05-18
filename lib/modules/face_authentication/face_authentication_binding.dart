import 'package:agribank_banking/modules/face_authentication/face_authentication_controller.dart';
import 'package:get/get.dart';

class FaceAuthenticationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => FaceAuthenticationController());
  }

}