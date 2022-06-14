import 'package:agribank_banking/models/faq_entity.dart';
import 'package:agribank_banking/services/faq_service.dart';
import 'package:get/get.dart';

import '../../../../utils/enums.dart';

class DetailFaqCategoryController extends GetxController {
  final _faqService = FAQService.instance;

  final String category = Get.arguments;

  final faqs = List<FaqEntity>.empty(growable: true).obs;

  final loadStatus = AppLoadStatus.idle.obs;

  @override
  Future<void> onInit() async {
    // TODO: implement onInit
    loadStatus(AppLoadStatus.loading);
    await getListFaq();
    loadStatus(AppLoadStatus.success);
    super.onInit();
  }

  Future<void> getListFaq() async {
    faqs..clear()..addAll(await _faqService.getListFaq(category: category));
  }

}