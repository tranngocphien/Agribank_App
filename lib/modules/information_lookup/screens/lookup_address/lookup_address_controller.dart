import 'dart:convert';

import 'package:agribank_banking/models/address_entity.dart';
import 'package:agribank_banking/models/static_money.dart';
import 'package:agribank_banking/services/info_app_service.dart';
import 'package:agribank_banking/utils/enums.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
class LookupAddressController extends GetxController {
  var provinces = List<Province>.empty(growable: true);
  Province? province;

  final infoAppService = InfoAppService.instance;
  final addresses = List<AddressEntity>.empty(growable: true).obs;

  final controllerDistrict = TextEditingController();
  final controllerProvince = TextEditingController();
  final controllerType = TextEditingController();
  
  final types = [Attribute(title: 'ATM Agribank', value: 'atm'), Attribute(title: 'PGD Agribank', value: 'transaction_room'), Attribute(title: 'Khác', value: 'other')];
  final indexTypes = 0.obs;

  final loadStatus = AppLoadStatus.idle.obs;

  @override
  Future<void> onInit() async {
    // TODO: implement onInit
    loadStatus(AppLoadStatus.loading);
    await readJson();
    loadStatus(AppLoadStatus.success);
    super.onInit();
  }

  Future<void> readJson() async {
    final String response = await rootBundle.loadString('assets/address.json');
    final data = await json.decode(response);
    provinces = (data as List).map((e) => Province.fromJson(e)).toList();
  }

  Future<void> getListAddress() async {
    loadStatus(AppLoadStatus.loading);
    addresses..clear()..addAll(await infoAppService.getListAddress(province: controllerProvince.text, district: controllerDistrict.text, type: types[indexTypes.value].value));
    loadStatus(AppLoadStatus.success);
  }

}