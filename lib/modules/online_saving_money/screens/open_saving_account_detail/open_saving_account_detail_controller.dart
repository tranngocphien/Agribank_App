import 'package:agribank_banking/models/cycle_entity.dart';
import 'package:get/get.dart';

class OpenSavingAccountDetailController extends GetxController {
  final arguments = Get.arguments;
  String? source;
  String? type;
  String? money;
  CycleEntity? cycle;
  String? typeRenew;
  @override
  void onInit() {
    initData();
    // TODO: implement onInit
    super.onInit();
  }

  void initData() {
    source = arguments['sourceAccount'];
    type = arguments['type'];
    money = arguments['money'];
    cycle = arguments['cycle'];
    typeRenew = arguments['typeRenew'];

  }

}