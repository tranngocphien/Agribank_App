import 'package:agribank_banking/models/bank_account_entity.dart';
import 'package:agribank_banking/models/history_transaction.dart';
import 'package:agribank_banking/services/transaction_service.dart';
import 'package:agribank_banking/utils/convert.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../routes/app_routes.dart';

class DetailInformationController extends GetxController {
  BankAccountEntity account = Get.arguments[0];

  final startDate = DateTime.now().obs;
  final endDate = DateTime.now().obs;
  final histories = List<HistoryTransactionEntity>.empty(growable: true).obs;

  final _transactionService = TransactionService.instance;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  Future<void> getHistoryTransaction() async {
    try {
      final resHistory = await _transactionService.getHistory(
          type: 'all',
          accountNumber: account.accountNumber,
          startDate: ConvertDateTime.convertDate(startDate.value),
          endDate: ConvertDateTime.convertDate(endDate.value));
      histories.addAll(resHistory);
      if(histories.isEmpty){
        Get.dialog(CupertinoAlertDialog(
          title: const Text('Thông báo'),
          content: const Text('Không phát sinh giao dịch trong khoảng thời gian này'),
          actions: [
            CupertinoDialogAction(
              onPressed: () {
                Get.back();
              },
              child: const Text('Đồng ý'),
            )
          ],
        ));

      }
    } on DioError catch (e) {
      final message = (e.response!.data as Map)['message'];
      Get.dialog(CupertinoAlertDialog(
        title: const Text('Thông báo'),
        content: Text(message),
        actions: [
          CupertinoDialogAction(
            onPressed: () {
              Get.back();
            },
            child: const Text('Đồng ý'),
          )
        ],
      ));

    }
  }
}
