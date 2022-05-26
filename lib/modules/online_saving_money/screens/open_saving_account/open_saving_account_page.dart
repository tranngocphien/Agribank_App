import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../app_theme.dart';
import '../../../../components/button_border.dart';
import '../../../../components/widget_input.dart';
import '../../../../routes/app_routes.dart';

class OpenSavingAccountPage extends StatelessWidget {
  const OpenSavingAccountPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFF67D10),
        centerTitle: true,
        title: Text(
          'MỞ TÀI KHOẢN TIỀN GỬI TRỰC TUYẾN',
          style: Styles.baseNotoSansTS.copyWith(
              fontSize: 16, color: white, fontWeight: FontWeight.w600),
        ),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(width16),
          child: Column(
            children: [
              Container(
                height: height160,
                padding: EdgeInsets.all(width8),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(width16), color: white),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Icon(
                          Icons.credit_card,
                          color: Colors.deepOrangeAccent,
                        ),
                        SizedBox(
                          width: width16,
                        ),
                        Text(
                          'Tài khoản thanh toán',
                          style: Styles.baseNotoSansTS.copyWith(
                              fontSize: 16, fontWeight: FontWeight.w500),
                        )
                      ],
                    ),
                    SizedBox(
                      height: height32,
                    ),
                    Text(
                      '1504281024240',
                      style: Styles.baseNotoSansTS.copyWith(
                          color: Colors.deepOrangeAccent, fontSize: 18),
                    ),
                    SizedBox(
                      height: height32,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Số dư:',
                          style: Styles.baseNotoSansTS.copyWith(fontSize: 16),
                        ),
                        const Text('*******')
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(
                height: height16,
              ),
              Container(
                padding: EdgeInsets.all(width8),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(width16), color: white),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Icon(
                          Icons.vaping_rooms,
                          color: Colors.deepOrangeAccent,
                        ),
                        SizedBox(
                          width: width16,
                        ),
                        Text(
                          'Thông tin tiền gửi trực tuyến',
                          style: Styles.baseNotoSansTS.copyWith(
                              fontSize: 16, fontWeight: FontWeight.w500),
                        )
                      ],
                    ),
                    WidgetInput(
                      text: 'Loại tiền gửi',
                      onPress: () {},
                      suffixIcon: const Icon(Icons.keyboard_arrow_down),
                      enable: false,
                    ),
                    WidgetInput(
                      text: 'Chọn kỳ hạn',
                      onPress: () {},
                      suffixIcon: const Icon(Icons.keyboard_arrow_down),
                      enable: false,
                    ),
                    WidgetInput(
                        text: 'Số tiền',
                        onPress: () {},
                        keyboardType: TextInputType.number,
                        suffixIcon: Text(
                          'VND',
                          style: Styles.baseNotoSansTS
                              .copyWith(fontSize: 16, color: Colors.grey),
                        )),
                    SizedBox(
                      height: height8,
                    ),
                    WidgetInput(
                      text: 'Hình thức gia hạn',
                      onPress: () {},
                      suffixIcon: const Icon(Icons.keyboard_arrow_down),
                      enable: false,
                    ),
                    SizedBox(
                      height: height8,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: height16,
              ),
              Row(
                children: [
                  Checkbox(value: false, onChanged: (value) {}),
                  SizedBox(
                    width: width16,
                  ),
                  SizedBox(
                    width: width * 0.7,
                    child: Text(
                      'Tôi xác nhận đã đọc, hiểu rõ Điều kiện và Điều khoản mở tài khoản tiết kiệm trực tuyến',
                      style: Styles.baseNotoSansTS.copyWith(
                        fontSize: 14,
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: height16,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: width * 0.4,
                    height: height48,
                    child: ButtonPrimaryText(
                      onTab: () {},
                      margin: EdgeInsets.zero,
                      padding: EdgeInsets.all(width8),
                      radius: width30,
                      fontWeightText: FontWeight.w500,
                      sizeText: 16,
                      colorBackground: white,
                      colorText: Colors.deepOrangeAccent,
                      textPrimary: 'Hủy',
                      colorBorder: Colors.deepOrangeAccent,
                    ),
                  ),
                  SizedBox(
                    width: width * 0.4,
                    height: height48,
                    child: ButtonPrimaryText(
                      onTab: () {
                        Get.toNamed(AppRoutes.openSavingAccountDetail);
                      },
                      margin: EdgeInsets.zero,
                      padding: EdgeInsets.all(width8),
                      radius: width30,
                      fontWeightText: FontWeight.w500,
                      sizeText: 16,
                      colorBackground: Colors.deepOrangeAccent,
                      colorText: white,
                      textPrimary: 'Tiếp tục',
                      colorBorder: Colors.deepOrangeAccent,
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
