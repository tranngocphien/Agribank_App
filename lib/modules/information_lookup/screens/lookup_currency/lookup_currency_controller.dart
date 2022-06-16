import 'package:get/get.dart';

import '../../../../models/currency_entity.dart';
import '../../../../models/cycle_entity.dart';
import '../../../../services/cycle_service.dart';
import '../../../../utils/enums.dart';

class LookupCurrencyController extends GetxController {
  final _cycleService = CycleService.instance;
  final loadStatus = AppLoadStatus.idle.obs;

  final currencies = Rx<CurrencyEntity?>(null);

  @override
  Future<void> onInit() async {
    // TODO: implement onInit
    loadStatus(AppLoadStatus.loading);
    await getCurrencies();
    loadStatus(AppLoadStatus.success);
    super.onInit();
  }

  Future<void> getCurrencies() async {
    currencies.value = await _cycleService.getListCurrencty();
  }
}