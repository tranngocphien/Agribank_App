import 'package:agribank_banking/data/storage/store_global.dart';
import 'package:agribank_banking/modules/online_saving_money/screens/open_saving_account_detail/open_saving_account_detail_controller.dart';
import 'package:agribank_banking/utils/convert.dart';
import 'package:agribank_banking/utils/enums.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../app_theme.dart';
import '../../../../components/button_border.dart';
import '../../../../components/information_tile.dart';
import '../../../../routes/app_routes.dart';

class OpenSavingAccountDetailPage
    extends GetWidget<OpenSavingAccountDetailController> {
  const OpenSavingAccountDetailPage({Key? key}) : super(key: key);

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
                padding: EdgeInsets.all(width8),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(width16), color: white),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InformationTile(
                      label: 'Tài khoản nguồn',
                      content: controller.source!,
                    ),
                    InformationTile(
                      label: 'Tên Khách hàng',
                      content: StoreGlobal.user.value!.name.toUpperCase(),
                      isHighLight: false,
                    ),
                    InformationTile(
                      label: 'Loại tiền gửi',
                      content: controller.type!,
                    ),
                    InformationTile(
                      label: 'Số tiền',
                      content: controller.money!,
                    ),
                    InformationTile(
                        label: 'Kỳ hạn gửi',
                        content: '${controller.cycle!.month.toString()} tháng'),
                    InformationTile(
                      label: 'Ngày mở tài khoản',
                      content: ConvertDateTime.convertDate(DateTime.now()),
                    ),
                    InformationTile(
                      label: 'Lãi suất',
                      content:
                          '${controller.cycle!.interestRate.toString()}%/năm',
                    ),
                    InformationTile(
                      label: 'Hình thức gia hạn',
                      content: controller.typeRenew!,
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
                        Get.toNamed(AppRoutes.confirmTransaction, arguments: TransactionType.openSavingAccount);
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
