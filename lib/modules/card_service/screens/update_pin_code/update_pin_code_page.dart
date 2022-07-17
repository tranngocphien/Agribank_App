import 'package:agribank_banking/modules/card_service/screens/update_pin_code/update_pin_code_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../../app_theme.dart';
import '../../../../components/button_border.dart';
import '../../../../components/widget_input.dart';
import '../../../../utils/enums.dart';


class UpdatePinCardPage extends GetWidget<UpdatePinCardController> {
  const UpdatePinCardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xFFF67D10),
          centerTitle: true,
          title: Text(
            'CẤP/ĐỔI MÃ PIN',
            style: Styles.baseNotoSansTS.copyWith(
                fontSize: 16, color: white, fontWeight: FontWeight.w600),
          ),
          elevation: 0,
        ),
        body: Obx(
              () => controller.loadStatus.value == AppLoadStatus.loading
              ? const Center(
            child: CupertinoActivityIndicator(),
          )
              : SingleChildScrollView(
            child: Container(
              width: width,
              margin: EdgeInsets.all(width16),
              padding: EdgeInsets.all(width16),
              decoration: BoxDecoration(
                  color: white,
                  borderRadius: BorderRadius.circular(width16)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Ghi nợ nội địa", style: Styles.baseNotoSansTS.copyWith(
                    fontSize: 15,
                  ),),
                  SizedBox(height: height4,),
                  const Divider(),
                  Text("Số thẻ", style: Styles.baseNotoSansTS.copyWith(
                    fontSize: 13,
                    color: black500
                  ),),
                  SizedBox(height: height4,),
                  Text(controller.card.cardNumber, style: Styles.baseNotoSansTS.copyWith(
                    fontSize: 15
                  ),),
                  Obx(() => WidgetInput(
                    text: 'Mã PIN hiện tại',
                    errorText: controller.errorPass.value,
                    obscureText: !controller.isShowPass.value,
                    onChanged: (value) {
                      controller.oldPin.value = value;
                    },
                    suffixIcon: GestureDetector(
                      onTap: () {
                        controller.isShowPass.value = !controller.isShowPass.value;
                      },
                      child: Icon(
                        controller.isShowPass.value
                            ? Icons.visibility_off
                            : Icons.visibility,
                        color: const Color(0xFFF67D10),
                      ),
                    ),
                  ),),
                  const Divider(
                    height: 1,
                  ),
                  SizedBox(
                    height: height8,
                  ),
                  Obx(() => WidgetInput(
                    text: 'Mã PIN mới',
                    errorText: controller.errorNewPin.value,
                    obscureText: !controller.isShowNewPin.value,
                    onChanged: (value) {
                      controller.newPin.value = value;
                    },
                    suffixIcon: GestureDetector(
                      onTap: () {
                        controller.isShowNewPin.value = !controller.isShowNewPin.value;
                      },
                      child: Icon(
                        controller.isShowNewPin.value
                            ? Icons.visibility_off
                            : Icons.visibility,
                        color: const Color(0xFFF67D10),
                      ),
                    ),
                  ),),
                  const Divider(
                    height: 1,
                  ),
                  SizedBox(
                    height: height8,
                  ),
                  Obx(() => WidgetInput(
                    text: 'Nhập lại mã PIN mới',
                    errorText: controller.errorRetypeNewPin.value,
                    obscureText: !controller.isShowRetypeNewPin.value,
                    onChanged: (value) {
                      controller.retypeNewPin.value = value;
                    },
                    suffixIcon: GestureDetector(
                      onTap: () {
                        controller.isShowRetypeNewPin.value = !controller.isShowRetypeNewPin.value;
                      },
                      child: Icon(
                        controller.isShowRetypeNewPin.value
                            ? Icons.visibility_off
                            : Icons.visibility,
                        color: const Color(0xFFF67D10),
                      ),
                    ),
                  ),),
                  const Divider(
                    height: 1,
                  ),
                  SizedBox(
                    height: height16,
                  ),
                  ButtonPrimaryText(
                      onTab: () async {
                        if(controller.checkData()){
                          controller.updatePin();
                        }
                      },
                      margin: EdgeInsets.zero,
                      padding: EdgeInsets.all(width16),
                      radius: width30,
                      fontWeightText: FontWeight.w500,
                      sizeText: 16,
                      colorBackground: const Color(0xFFF67D10),
                      colorText: white,
                      textPrimary: 'ĐỔI PIN')
                ],
              ),
            ),
          ),
        ));

  }
}
