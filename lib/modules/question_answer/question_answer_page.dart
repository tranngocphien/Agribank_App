import 'package:flutter/material.dart';

import '../../app_theme.dart';

class QuestionAnswerPage extends StatelessWidget {
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
        child: Container()
      ),
    );
  }
}
