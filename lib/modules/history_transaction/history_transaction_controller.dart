import 'package:agribank_banking/data/storage/store_global.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../models/history_transaction.dart';
import '../../services/transaction_service.dart';
import '../../utils/convert.dart';

class HistoryTransactionController extends GetxController {
  final bankAccounts = StoreGlobal.accounts;
  final indexAccount = 0.obs;

  final startDate = DateTime.now().obs;
  final endDate = DateTime.now().obs;
  final histories = List<HistoryTransactionEntity>.empty(growable: true).obs;

  final controllerAccount = TextEditingController();

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
          accountNumber: bankAccounts[indexAccount.value].accountNumber,
          startDate: ConvertDateTime.convertDateTime(startDate.value),
          endDate: ConvertDateTime.convertDateTime(endDate.value));
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