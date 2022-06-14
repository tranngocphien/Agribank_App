import 'package:agribank_banking/models/faq_entity.dart';
import 'package:agribank_banking/services/faq_service.dart';
import 'package:get/get.dart';

import '../../utils/enums.dart';

class QuestionAnswerController extends GetxController {
  final loadStatus = AppLoadStatus.idle.obs;

  final categories = List<FaqCategoryEntity>.empty(growable: true).obs;

  final _faqService = FAQService.instance;

  @override
  Future<void> onInit() async {
    loadStatus(AppLoadStatus.loading);
    await getListCategory();
    loadStatus(AppLoadStatus.success);
    super.onInit();
  }

  Future<void> getListCategory() async {
    categories..clear()..addAll(await _faqService.getListCategory());
  }


}