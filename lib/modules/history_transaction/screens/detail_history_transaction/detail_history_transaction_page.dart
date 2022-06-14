import 'package:agribank_banking/components/information_tile.dart';
import 'package:agribank_banking/modules/history_transaction/screens/detail_history_transaction/detail_history_transaction_controller.dart';
import 'package:agribank_banking/utils/convert.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../app_theme.dart';

class DetailHistoryTransactionPage extends GetWidget<DetailHistoryTransactionController> {
  const DetailHistoryTransactionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFF67D10),
        centerTitle: true,
        title: Text(
          'CHI TIẾT GIAO DỊCH',
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
                    InformationTile(label: 'Ngày giao dịch', content: ConvertDateTime.convertDate(controller.history.createdAt!),),
                    InformationTile(label: 'Giờ giao dịch', content: ConvertDateTime.convertTime(controller.history.createdAt!),),
                    InformationTile(label: 'Số tiền giao dịch', content: MoneyFormat.formatMoneyInteger(controller.history.transactionMoney),),
                    InformationTile(label: 'Số dư sau giao dịch', content: MoneyFormat.formatMoneyInteger(controller.history.overbalance),),
                    InformationTile(label: 'Chi nhánh GD', content: 'Chi nhánh ${controller.history.bankBranch}',),
                    InformationTile(label: 'Tài khoản đối ứng', content: controller.history.accountNumberDestination,),
                    InformationTile(label: 'Nội dung GD', content: controller.history.contentTransaction,),
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
