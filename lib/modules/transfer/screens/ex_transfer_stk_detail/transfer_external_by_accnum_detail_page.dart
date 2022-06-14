import 'package:agribank_banking/data/storage/store_global.dart';
import 'package:agribank_banking/modules/transfer/screens/ex_transfer_stk_detail/transfer_external_by_accnum_detail_controller.dart';
import 'package:agribank_banking/utils/enums.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../app_theme.dart';
import '../../../../components/button_border.dart';
import '../../../../routes/app_routes.dart';

class TransferExternalByAccNumDetailPage extends GetWidget<TransferExternalByAccNumDetailController> {
  const TransferExternalByAccNumDetailPage({Key? key}) : super(key: key);

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
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(width16),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(width8),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(width16), color: white),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InformationTile(
                      label: 'Tài khoản nguồn',
                      content: controller.senderAccount! ,
                    ),
                    InformationTile(
                      label: 'Số tài khoản thụ hưởng',
                      content: controller.receiverAccount!,
                    ),
                    InformationTile(
                      label: 'Tên người thụ hưởng',
                      content: controller.name!,
                      isHighLight: true,
                    ),

                    InformationTile(
                      label: 'Số tiền',
                      content: controller.amount!,
                    ),
                    const InformationTile(
                      label: 'Phí giao dịch',
                      content: '0 VND',
                    ),
                    InformationTile(
                      label: 'Tổng tiền',
                      content: controller.amount!,
                    ),
                    InformationTile(
                      label: 'Nội dung CK',
                      content: controller.content!,
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
                    width: width*0.4,
                    height: height48,
                    child: ButtonPrimaryText(
                      onTab: () {
                        if(StoreGlobal.user.value!.softOtp){
                          Get.toNamed(AppRoutes.confirmTransaction, arguments: TransactionType.sendMoneyInterbank);
                        }
                        else {
                          Get.toNamed(AppRoutes.confirmTransactionPassword, arguments: TransactionType.sendMoneyInterbank);

                        }
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

class InformationTile extends StatelessWidget {
  const InformationTile({
    Key? key, required this.label, required this.content, this.isFinal = false, this.isHighLight = false,
  }) : super(key: key);

  final String label;
  final String content;
  final bool? isFinal;
  final bool? isHighLight;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: Styles.baseNotoSansTS.copyWith(
            fontSize: 14,
            color: Colors.grey,
          ),),
          SizedBox(height: height4,),
          Text(content, style: Styles.baseNotoSansTS.copyWith(
            fontSize: 17,
            color: isHighLight! ? const Color(0xFFF67D10) : black,
            fontWeight: isHighLight! ? FontWeight.w600:  FontWeight.w400
          ),),
          SizedBox(height: height4,),
          isFinal! ? Container() : const Divider(thickness: 1,)
        ],
      ),
    );
  }
}
