import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../routes/app_routes.dart';


class UpdateInformationController extends GetxController {
  final TextEditingController controllerName = TextEditingController();
  final TextEditingController controllerCCCD = TextEditingController();

  @override
  void onInit() {
    // TODO: implement onInit
    controllerName.text = Get.arguments[0];
    super.onInit();
  }

  void toAuthentication() {
    Get.toNamed(AppRoutes.cccdAuthentication, arguments: [
      controllerName.text, controllerCCCD.text
    ]);
  }



}