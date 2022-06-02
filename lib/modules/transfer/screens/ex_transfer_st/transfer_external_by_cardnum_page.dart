import 'package:agribank_banking/modules/transfer/screens/ex_transfer_st/transfer_external_by_cardnum_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../app_theme.dart';
import '../../../../components/account_information.dart';
import '../../../../components/button_border.dart';
import '../../../../components/widget_input.dart';
import '../../../../routes/app_routes.dart';

class TransferExByCardNumberPage
    extends GetWidget<TransferExternalByCardNumberController> {
  const TransferExByCardNumberPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFF67D10),
        centerTitle: true,
        title: Text(
          'CK LIÊN NH QUA SỐ THẺ',
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
              AccountInformationWidget(
                accounts: [],
                indexSelected: 0,
                onPress: (value) {},
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
                    WidgetInput(
                      text: 'Ngân hàng thụ hưởng',
                      onPress: () {},
                      suffixIcon: const Icon(Icons.keyboard_arrow_down),
                    ),
                    WidgetInput(
                      text: 'Số thẻ thụ hưởng',
                      onPress: () {},
                      suffixIcon: const Icon(Icons.keyboard_arrow_down),
                    ),
                    WidgetInput(
                      text: 'Số tiền',
                      onPress: () {},
                      suffixIcon: Text(
                        'VND',
                        style: Styles.baseNotoSansTS
                            .copyWith(fontSize: 16, color: black500),
                      ),
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
                      decoration: const InputDecoration(),
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
                      onTab: () {
                        Get.back();
                      },
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
                        Get.toNamed(AppRoutes.transferExAccNumberDetail);
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
    ;
  }
}
