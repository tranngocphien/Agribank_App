import 'package:agribank_banking/data/storage/store_global.dart';
import 'package:agribank_banking/modules/account_information/screens/detail_saving_account/detail_saving_account_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../app_theme.dart';
import '../../../../components/information_tile.dart';
import '../../../../utils/convert.dart';

class DetailSavingAccountPage extends GetWidget<DetailSavingAccountController> {
  const DetailSavingAccountPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFF67D10),
        centerTitle: true,
        title: Text(
          'TÀI KHOẢN TIẾT KIỆM',
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
                    Row(
                      children: [
                        const Icon(Icons.credit_card, color: Color(0xFFF67D10),),
                        SizedBox(width: width8,),
                        Text('Chi tiết tài khoản', style: Styles.baseNotoSansTS.copyWith(
                          fontSize: 14,
                        ),)
                      ],
                    ),
                    SizedBox(height: height8,),
                    Text(controller.accounts.accountNumber, style: Styles.baseNotoSansTS.copyWith(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: const Color(0xFFF67D10)
                    ),),
                    SizedBox(height: height4,),
                    Text(
                      'Số dư: ${MoneyFormat.formatMoneyInteger(controller.accounts.money)} VNĐ',
                      style: Styles.baseNotoSansTS.copyWith(
                          fontSize: 14, color: black600),
                    ),
                    SizedBox(height: height4,),
                    const Divider(),
                    InformationTile(label: 'Chủ tài khoản', content: StoreGlobal.user.value!.name.toUpperCase()),
                    const InformationTile(label: 'Loại tiền', content: 'VNĐ'),
                    InformationTile(label: 'Ngày mở', content: ConvertDateTime.convertDate(controller.accounts.startDate!)),
                    InformationTile(label: 'Ngày đến hạn', content: ConvertDateTime.convertDate(controller.accounts.startDate!)),
                    InformationTile(label: 'Kỳ hạn', content: '${controller.accounts.cycleMonth} tháng'),
                    InformationTile(label: 'Lãi suất', content: '${controller.accounts.cycleInterestRate} %'),
                  ],
                ),
              ),
              SizedBox(
                height: height16,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
