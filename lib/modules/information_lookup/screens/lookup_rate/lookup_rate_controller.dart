import 'package:agribank_banking/services/cycle_service.dart';
import 'package:get/get.dart';

import '../../../../models/cycle_entity.dart';
import '../../../../utils/enums.dart';

class LookupRateController extends GetxController {
  final _cycleService = CycleService.instance;
  final loadStatus = AppLoadStatus.idle.obs;

  final cycles = List<CycleEntity>.empty(growable: true).obs;

  @override
  Future<void> onInit() async {
    // TODO: implement onInit
    loadStatus(AppLoadStatus.loading);
    await getListCycles();
    loadStatus(AppLoadStatus.success);
    super.onInit();
  }

  Future<void> getListCycles() async {
    final resCycles = await _cycleService.getListCycle();
    cycles..clear()..addAll(resCycles);
  }

}