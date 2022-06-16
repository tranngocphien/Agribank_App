import 'package:agribank_banking/modules/information_lookup/screens/lookup_currency/lookup_currency_controller.dart';
import 'package:get/get.dart';

class LookupCurrencyBinding extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => LookupCurrencyController());
  }

}