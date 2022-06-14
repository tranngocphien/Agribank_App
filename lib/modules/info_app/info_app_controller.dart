import 'package:agribank_banking/models/info_app_entity.dart';
import 'package:agribank_banking/services/info_app_service.dart';
import 'package:agribank_banking/utils/enums.dart';
import 'package:get/get.dart';

class InfoAppController extends GetxController {
  final infoApp = Rx<InfoAppEntity?>(null);

  final infoAppService = InfoAppService.instance;
  final loadStatus = AppLoadStatus.idle.obs;

  @override
  void onInit() async {
    // TODO: implement onInit
    loadStatus(AppLoadStatus.loading);
    await getInfoApp();
    loadStatus(AppLoadStatus.success);
    super.onInit();
  }

  Future<void> getInfoApp() async {
    infoApp.value = await infoAppService.getInfoApp();
  }



}