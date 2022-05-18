import 'package:agribank_banking/components/button_border.dart';
import 'package:agribank_banking/modules/transfer/screens/transfer_internal/transfer_internal_controller.dart';
import 'package:agribank_banking/routes/app_routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../app_theme.dart';

class TransferInternalPage extends GetWidget<TransferInternalController> {
  const TransferInternalPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFF67D10),
        centerTitle: true,
        title: Text(
          'CHUYỂN KHOẢN NỘI BỘ QUA TK/SĐT',
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
                          Icons.account_circle_outlined,
                          color: Colors.deepOrangeAccent,
                        ),
                        SizedBox(
                          width: width16,
                        ),
                        Text(
                          'Thông tin thụ hưởng',
                          style: Styles.baseNotoSansTS.copyWith(
                              fontSize: 16, fontWeight: FontWeight.w500),
                        )
                      ],
                    ),
                    TextField(
                      decoration: const InputDecoration(
                        suffixIcon: Icon(Icons.keyboard_arrow_down),
                        label: Text('Số điện thoại/số tài khoản'),
                        focusColor: black700,
                        hoverColor: black700,
                        fillColor: black700,
                        border: InputBorder.none,
                      ),
                      style: Styles.baseNotoSansTS.copyWith(fontSize: 18),
                    ),
                    TextField(
                      decoration: InputDecoration(
                        suffixIcon: Text(
                          'VND',
                          style: Styles.baseNotoSansTS
                              .copyWith(color: black700, fontSize: 16),
                        ),
                        label: const Text('Số tiền'),
                        focusColor: black700,
                        hoverColor: black700,
                        fillColor: black700,
                        border: InputBorder.none,
                      ),
                      style: Styles.baseNotoSansTS.copyWith(fontSize: 18),
                      keyboardType: TextInputType.number,
                    ),
                    SizedBox(
                      height: height16,
                    ),
                    Text(
                      'Nội dung chuyển khoản',
                      style: Styles.baseNotoSansTS.copyWith(
                        color: black500,
                        fontSize: 16,
                      ),
                    ),
                    TextField(
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                      ),
                      style: Styles.baseNotoSansTS.copyWith(fontSize: 18),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Lưu thụ hưởng',
                          style: Styles.baseNotoSansTS.copyWith(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: black800),
                        ),
                        CupertinoSwitch(value: false, onChanged: (value) {})
                      ],
                    )
                  ],
                ),
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
                    width: width*0.4,
                    height: height48,
                    child: ButtonPrimaryText(
                      onTab: () {
                        Get.toNamed(AppRoutes.transferDetailInternal);
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
