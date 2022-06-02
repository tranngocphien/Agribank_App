import 'package:agribank_banking/components/account_information.dart';
import 'package:agribank_banking/modules/transfer/screens/ex_transfer_stk/transfer_external_by_accnum_controller.dart';
import 'package:agribank_banking/routes/app_routes.dart';
import 'package:agribank_banking/utils/enums.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../app_theme.dart';
import '../../../../components/button_border.dart';

class TransferExByAccNumberPage
    extends GetWidget<TransferExternalByAccNumberController> {
  const TransferExByAccNumberPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFF67D10),
        centerTitle: true,
        title: Text(
          'CK LIÊN NH QUA SỐ TK',
          style: Styles.baseNotoSansTS.copyWith(
              fontSize: 16, color: white, fontWeight: FontWeight.w600),
        ),
        elevation: 0,
      ),
      body: Obx(() => controller.loadStatus.value == AppLoadStatus.loading
          ? const Center(
              child: CupertinoActivityIndicator(),
            )
          : SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.all(width16),
                child: Column(
                  children: [
                    Obx(() => AccountInformationWidget(
                          accounts: controller.accounts,
                          indexSelected: controller.indexAccount.value,
                          onPress: (value) {
                            controller.indexAccount.value = value;
                          },
                        )),
                    SizedBox(
                      height: height16,
                    ),
                    Container(
                      padding: EdgeInsets.all(width8),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(width16),
                          color: white),
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
                            controller: controller.controllerBank,
                            decoration: InputDecoration(
                              suffixIcon: GestureDetector(
                                  onTap: () {
                                    showDialog(
                                        context: context,
                                        builder: (context) => Dialog(
                                              insetPadding: EdgeInsets.zero,
                                              alignment: Alignment.center,
                                              child: SizedBox(
                                                height: height * 0.5,
                                                width: width * 0.9,
                                                child: Column(
                                                  children: [
                                                    Container(
                                                      width: width * 0.9,
                                                      height: height48,
                                                      decoration:
                                                          const BoxDecoration(
                                                              color: Color(
                                                                  0xFFF67D10)),
                                                      child: Center(
                                                        child: Text(
                                                          "Ngân hàng thụ hưởng",
                                                          style: Styles
                                                              .baseNotoSansTS
                                                              .copyWith(
                                                                  fontSize: 16,
                                                                  color: white,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ));
                                  },
                                  child: const Icon(Icons.keyboard_arrow_down)),
                              label: const Text('Ngân hàng thụ hưởng'),
                              labelStyle: Styles.baseNotoSansTS
                                  .copyWith(fontSize: 16, color: black500),
                              focusColor: black700,
                              hoverColor: black700,
                              fillColor: black700,
                              border: InputBorder.none,
                            ),
                            style: Styles.baseNotoSansTS.copyWith(fontSize: 16),
                          ),
                          TextField(
                            controller: controller.controllerPhone,
                            decoration: InputDecoration(
                              suffixIcon: const Icon(Icons.keyboard_arrow_down),
                              label: const Text('Số tài khoản thụ hưởng'),
                              hoverColor: black700,
                              fillColor: black700,
                              labelStyle: Styles.baseNotoSansTS
                                  .copyWith(fontSize: 16, color: black500),
                              border: InputBorder.none,
                              // focusedBorder: const OutlineInputBorder(
                              //   borderSide: BorderSide(color: black500)
                              // )
                            ),
                            style: Styles.baseNotoSansTS.copyWith(fontSize: 18),
                          ),
                          TextField(
                            controller: controller.controllerAmount,
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
                              labelStyle: Styles.baseNotoSansTS
                                  .copyWith(fontSize: 16, color: black500),
                              border: InputBorder.none,
                            ),
                            style: Styles.baseNotoSansTS.copyWith(fontSize: 18),
                            keyboardType: TextInputType.number,
                          ),
                          TextField(
                            controller: controller.controllerName,
                            decoration: InputDecoration(
                              label: const Text('Tên tài khoản thụ hưởng'),
                              focusColor: black700,
                              hoverColor: black700,
                              fillColor: black700,
                              labelStyle: Styles.baseNotoSansTS
                                  .copyWith(fontSize: 16, color: black500),
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
                            controller: controller.controllerContent,
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
                              Obx(() => CupertinoSwitch(
                                  value: controller.isSaveAccount.value,
                                  onChanged: (value) {
                                    controller.isSaveAccount.value = value;
                                  }))
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
                              Get.toNamed(AppRoutes.transferExAccNumberDetail,
                                  arguments: {
                                    'sender_account': controller
                                        .accounts[controller.indexAccount.value]
                                        .accountNumber,
                                    'bank': controller.controllerBank.text,
                                    'receiver_account':
                                        controller.controllerPhone.text,
                                    'amount': controller.controllerAmount.text,
                                    'name': controller.controllerName.text,
                                    'content':
                                        controller.controllerContent.text,
                                    'isSaveAccount':
                                        controller.isSaveAccount.value
                                  });
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
            )),
    );
  }
}
