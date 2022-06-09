import 'package:agribank_banking/models/response_list_contact.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../models/static_money.dart';
import '../../../../routes/app_routes.dart';
import '../../../../services/contact_service.dart';

class DetailContactController extends GetxController {
  final ContactEntity contact = Get.arguments;
  final types = [
    Attribute(title: 'Chuyển khoản nội bộ', value: '1'),
    Attribute(title: 'Chuyển khoản liên ngân hàng', value: '2')
  ];
  final banks = [

  ];
  final indexType = 0.obs;

  final controllerType = TextEditingController();
  final controllerName = TextEditingController();
  final controllerAccount = TextEditingController();

  final _contactService = ContactService.instance;

  @override
  void onInit() {
    // TODO: implement onInit
    initData();
    controllerType.text = types[indexType.value].title;
    super.onInit();
  }

  void initData() {
    controllerName.text = contact.nickName;
    controllerAccount.text = contact.accountNumber;
    indexType.value = contact.typeContact == '1' ? 0 : 1;
  }

  Future<void> updateContact() async {
    try {
      await _contactService.updateContact(id: contact.id, type: types[indexType.value].value);
      Get.dialog(CupertinoAlertDialog(
        title: const Text('Thông báo'),
        content: const Text('Cập nhật thông tin thành công.'),
        actions: [
          CupertinoDialogAction(
            onPressed: () {
              Get.offAllNamed(AppRoutes.softOTP);
            },
            child: const Text('Đồng ý'),
          )
        ],
      ));
    }
    on DioError catch (e) {
      final message = (e.response!.data as Map)['message'];
      Get.dialog(CupertinoAlertDialog(
        title: const Text('Thông báo'),
        content: Text(message),
        actions: [
          CupertinoDialogAction(
            onPressed: () {
              Get.offAllNamed(AppRoutes.softOTP);
            },
            child: const Text('Đồng ý'),
          )
        ],
      ));

    }
  }

}