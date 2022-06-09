import 'package:agribank_banking/data/network/api_constants.dart';
import 'package:agribank_banking/models/base_entity.dart';
import 'package:agribank_banking/models/response_message.dart';
import 'package:agribank_banking/repositories/base_repository.dart';
import 'package:agribank_banking/services/dio_service.dart';

import '../utils/enums.dart';

class SoftOtpService {
  SoftOtpService._();

  static final SoftOtpService instance = SoftOtpService._();

  final _repo = BaseRepository(url: APIConstants.baseURL, dio: DioService.instance.get(), method: HttpMethod.post);

  Future<void> turnOn({required String password, required String pin, required String retypePin}) async {
    _repo.url = APIConstants.baseURL + APIConstants.turnOn;
    try {
      _repo.queryByPath((e) => BaseEntity(), data: {
        'password': password,
        'pin': pin,
        'retype_pin': retypePin
      });
    }
    catch (e) {
      rethrow;
    }

  }


  Future<void> turnOff({required String password, required String pin, required String retypePin}) async {
    _repo.url = APIConstants.baseURL + APIConstants.turnOff;
    try {
      _repo.queryByPath((e) => BaseEntity(), data: {
        'password': password,
        'pin': pin,
        'retype_pin': retypePin
      });
    }
    catch (e) {
      rethrow;
    }
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


}