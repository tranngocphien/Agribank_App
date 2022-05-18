import 'package:agribank_banking/modules/question_answer/question_answer_controller.dart';
import 'package:get/get.dart';

class QuestionAnswerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => QuestionAnswerController());
  }

}