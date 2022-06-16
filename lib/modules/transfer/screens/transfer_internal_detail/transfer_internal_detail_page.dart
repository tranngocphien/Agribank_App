import 'package:agribank_banking/data/storage/store_global.dart';
import 'package:agribank_banking/modules/transfer/screens/transfer_internal_detail/transfer_internal_detail_controller.dart';
import 'package:agribank_banking/utils/enums.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../app_theme.dart';
import '../../../../components/button_border.dart';
import '../../../../components/information_tile.dart';
import '../../../../routes/app_routes.dart';

class TransferInternalDetailPage extends GetWidget<TransferInternalDetailController> {
  const TransferInternalDetailPage({Key? key}) : super(key: key);

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
                padding: EdgeInsets.all(width8),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(width16), color: white),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InformationTile(
                      label: 'Tài khoản nguồn',
                      content: controller.senderAccount,
                    ),
                    InformationTile(
                      label: 'Số tài khoản thụ hưởng',
                      content: controller.receiverAccount,
                    ),
                    InformationTile(
                      label: 'Tên người thụ hưởng',
                      content: controller.name.toUpperCase(),
                      isHighLight: true,
                    ),

                    InformationTile(
                      label: 'Số tiền',
                      content: '${controller.money} VND',
                    ),

                    const InformationTile(
                      label: 'Phí giao dịch',
                      content: '0 VND',
                    ),

                    InformationTile(
                      label: 'Tổng tiền',
                      content: '${controller.money} VND',
                    ),

                    InformationTile(
                      label: 'Nội dung CK',
                      content: controller.content,
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
                        if(StoreGlobal.soft.value){
                          Get.toNamed(AppRoutes.confirmTransaction, arguments: TransactionType.sendMoney);
                        }
                        else {
                          Get.toNamed(AppRoutes.confirmTransactionPassword, arguments: TransactionType.sendMoney);
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

