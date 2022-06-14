import 'package:agribank_banking/modules/question_answer/screens/detail_faq_category/detail_faq_category_controller.dart';
import 'package:get/get.dart';

class DetailFaqCategoryBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => DetailFaqCategoryController());
  }

}