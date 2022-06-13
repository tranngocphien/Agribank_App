import 'package:agribank_banking/data/storage/store_global.dart';
import 'package:agribank_banking/modules/transfer/screens/update_limit_trans/update_limit_trans_controller.dart';
import 'package:agribank_banking/utils/convert.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../app_theme.dart';
import '../../../../components/button_border.dart';
import '../../../../components/widget_input.dart';

class UpdateLimitTransPage extends GetWidget<UpdateLimitTransController> {
  const UpdateLimitTransPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFF67D10),
        centerTitle: true,
        title: Text(
          'CÀI ĐẶT HẠN MỨC CHUYỂN KHOẢN',
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
              padding: EdgeInsets.all(width16),
              decoration: BoxDecoration(
                  color: white, borderRadius: BorderRadius.circular(width16)),
              child: Column(
                children: [
                  Obx(() => WidgetInput(
                        text: 'Hạn mức/ Giao dịch',
                        initialValue: MoneyFormat.formatMoneyInteger(
                            StoreGlobal.user.value!.limitPerTrans),
                        onChanged: (value) {
                          controller.limitPerTrans = value.replaceAll(',', '');
                        },
                        inputFormatters: [ThousandsSeparatorInputFormatter()],
                        suffixIcon: GestureDetector(
                            onTap: () {
                              controller.isEditTrans.value =
                                  !controller.isEditTrans.value;

                            },
                            child: const Icon(
                              Icons.edit,
                              color: Color(0xFFF67D10),
                            )),
                      )),
                  const Divider(
                    height: 1,
                    thickness: 1,
                  ),
                  Obx(
                    () => WidgetInput(
                      onChanged: (value) {
                        controller.limitPerDay = value.replaceAll(',', '');
                      },
                      inputFormatters: [ThousandsSeparatorInputFormatter()],
                      initialValue: MoneyFormat.formatMoneyInteger(
                          StoreGlobal.user.value!.limitPerDay),
                      text: 'Tổng hạn mức/ngày',
                      suffixIcon: GestureDetector(
                          onTap: () {
                            controller.isEditDays.value =
                                !controller.isEditDays.value;
                          },
                          child: const Icon(
                            Icons.edit,
                            color: Color(0xFFF67D10),
                          )),
                    ),
                  ),
                  const Divider(
                    height: 1,
                    thickness: 1,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: height16,
            ),
            ButtonPrimaryText(
                onTab: () async {
                  await controller.updateLimitTrans();
                },
                margin: EdgeInsets.all(width16),
                padding: EdgeInsets.all(width16),
                radius: 30,
                fontWeightText: FontWeight.w600,
                sizeText: 18,
                colorBackground: const Color(0xFFF67D10),
                colorText: white,
                textPrimary: 'Tiếp tục')
          ],
        ),
      )),
    );
  }
}
