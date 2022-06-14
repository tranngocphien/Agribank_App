import 'package:agribank_banking/modules/question_answer/question_answer_controller.dart';
import 'package:agribank_banking/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../app_theme.dart';

class QuestionAnswerPage extends GetWidget<QuestionAnswerController> {
  const QuestionAnswerPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFF67D10),
        centerTitle: true,
        title: Text(
          'HỎI ĐÁP',
          style: Styles.baseNotoSansTS.copyWith(
              fontSize: 16, color: white, fontWeight: FontWeight.w600),
        ),
        elevation: 0,
      ),
      body: SingleChildScrollView(
          child: Obx(() => Container(
                width: width,
                height: height,
                padding: EdgeInsets.all(width16),
                child: ListView.builder(
                  itemBuilder: ((context, index) => Container(
                        padding: EdgeInsets.all(width16),
                        margin: EdgeInsets.only(bottom: width8),
                        decoration: BoxDecoration(
                            color: white,
                            borderRadius: BorderRadius.circular(width8),
                            border: Border.all(color: black100)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              controller.categories[index].label,
                              style:
                                  Styles.baseNotoSansTS.copyWith(fontSize: 14),
                            ),
                            GestureDetector(
                                onTap: () {
                                  Get.toNamed(AppRoutes.detailFAQCategory, arguments: controller.categories[index].value);
                                },
                                child: const Icon(
                                  Icons.arrow_forward_ios,
                                  size: 14,
                                  color: Color(0xFFF67D10),
                                ))
                          ],
                        ),
                      )),
                  itemCount: controller.categories.length,
                ),
              ))),
    );
  }
}
