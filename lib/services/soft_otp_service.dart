import 'package:agribank_banking/data/network/api_constants.dart';
import 'package:agribank_banking/models/base_entity.dart';
import 'package:agribank_banking/models/response_message.dart';
import 'package:agribank_banking/repositories/base_repository.dart';
import 'package:agribank_banking/services/dio_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../routes/app_routes.dart';
import '../utils/enums.dart';

class SoftOtpService {
  SoftOtpService._();

  static final SoftOtpService instance = SoftOtpService._();

  final _repo = BaseRepository(url: APIConstants.baseURL, dio: DioService.instance.get(), method: HttpMethod.post);

  Future<ResponseMessage?> turnOn({required String password, required String pin, required String retypePin}) async {
    _repo.url = APIConstants.baseURL + APIConstants.turnOn;
    try {
      final response = _repo.queryByPath((e) => ResponseMessage.fromJson(e), data: {
        'password': password,
        'pin': pin,
        'retype_pin': retypePin
      });
      return response;
    }
    catch (e) {
      rethrow;
    }

  }


  Future<ResponseMessage?> turnOff({required String pin}) async {
    _repo.url = APIConstants.baseURL + APIConstants.turnOff;
    _repo.keyData = null;
    final response = _repo.queryByPath((e) => ResponseMessage.fromJson(e), data: {
      'pin': pin,
    });
    return response;
  }

  Future<ResponseMessage?> updatePin({required String pinOld, required String pinNew, required String retypePinNew}) async {
    _repo.url = APIConstants.baseURL + APIConstants.updatePin;
    _repo.dio = DioService.instance.get();
    try {
      final response = _repo.queryByPath((e) => ResponseMessage.fromJson(e), data: {
        'pin_old': pinOld,
        'pin_new': pinNew,
        'retype_pin_new': retypePinNew
      });
      return response;
    }
    catch (e) {
      rethrow;
    }
  }

  Future<BaseEntity?> forgotOTP({required String password, required String newPin}) async {
    _repo.url = APIConstants.baseURL + APIConstants.forgotOTP;
    _repo.dio = DioService.instance.get();
    return  await _repo.queryByPath((e) => BaseEntity.fromJson(e), data: {
      'pin_new': newPin,
      'password': password,
    });

  }

  void updateDioService() {
    _repo.dio = DioService.instance.get();
  }


}