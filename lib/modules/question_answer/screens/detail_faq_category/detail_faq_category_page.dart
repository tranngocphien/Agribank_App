import 'package:agribank_banking/modules/question_answer/screens/detail_faq_category/detail_faq_category_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../app_theme.dart';

class DetailFaqCategoryPage extends GetWidget<DetailFaqCategoryController> {
  const DetailFaqCategoryPage({Key? key}) : super(key: key);

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
              itemBuilder: ((context, index) => SizedBox(
                width: width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Câu 1: ${controller.faqs[index].question}', style: Styles.baseNotoSansTS.copyWith(
                      fontWeight: FontWeight.w600,
                      color: black
                    ),),
                    SizedBox(height: height4,),
                    Text(controller.faqs[index].answer, style: Styles.baseNotoSansTS.copyWith(
                        fontSize: 14
                    ),)
                  ],

                ),
              )),
              itemCount: controller.faqs.length,
            ),
          ))),
    );
  }
}
