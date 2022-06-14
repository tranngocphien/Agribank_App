import 'package:agribank_banking/modules/authentication/change_password/change_password_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../app_theme.dart';
import '../../../components/button_border.dart';
import '../../../components/widget_input.dart';
import '../../../utils/enums.dart';

class ChangePasswordPage extends GetWidget<ChangePasswordController> {
  const ChangePasswordPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xFFF67D10),
          centerTitle: true,
          title: Text(
            'ĐỔI MẬT KHẨU',
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
                        Obx(() => WidgetInput(
                          text: 'Mật khẩu cũ',
                          errorText: controller.errorOldPass.value,
                          obscureText: !controller.isShowOldPass.value,
                          onChanged: (value) {
                            controller.oldPass.value = value;
                          },
                          suffixIcon: GestureDetector(
                            onTap: () {
                              controller.isShowOldPass.value = !controller.isShowOldPass.value;
                            },
                            child: Icon(
                              controller.isShowOldPass.value
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
                          text: 'Mật khẩu mới',
                          errorText: controller.errorNewPass.value,
                          obscureText: !controller.isShowNewPass.value,
                          onChanged: (value) {
                            controller.newPass.value = value;
                          },
                          suffixIcon: GestureDetector(
                            onTap: () {
                              controller.isShowNewPass.value = !controller.isShowNewPass.value;
                            },
                            child: Icon(
                              controller.isShowNewPass.value
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
                          text: 'Nhập lại mật khẩu mới',
                          errorText: controller.errorRetypeNewPass.value,
                          obscureText: !controller.isShowRetypeNewPass.value,
                          onChanged: (value) {
                            controller.retypeNewPass.value = value;
                          },
                          suffixIcon: GestureDetector(
                            onTap: () {
                              controller.isShowRetypeNewPass.value = !controller.isShowRetypeNewPass.value;
                            },
                            child: Icon(
                              controller.isShowRetypeNewPass.value
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
                              await controller.changePassword();
                            },
                            margin: EdgeInsets.zero,
                            padding: EdgeInsets.all(width16),
                            radius: width30,
                            fontWeightText: FontWeight.w500,
                            sizeText: 16,
                            colorBackground: const Color(0xFFF67D10),
                            colorText: white,
                            textPrimary: 'ĐỔI MẬT KHẨU')
                      ],
                    ),
                  ),
                ),
        ));
  }
}
