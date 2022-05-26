import 'package:agribank_banking/data/network/api_constants.dart';
import 'package:agribank_banking/models/response_message.dart';
import 'package:agribank_banking/repositories/base_repository.dart';
import 'package:agribank_banking/services/dio_service.dart';
import 'package:agribank_banking/utils/enums.dart';

class TransactionService {
  TransactionService._();

  static final TransactionService instance = TransactionService._();

  final _repo = BaseRepository(
      url: APIConstants.baseURL,
      dio: DioService.instance.get(),
      method: HttpMethod.post);

  Future<void> rechargePhone(
      {required String accountNumber,
      required String phone,
      required int money,
      required String pin}) async {
    _repo.url = APIConstants.baseURL + APIConstants.rechargePhone;
    try {
      await _repo.queryByPath((e) => ResponseMessage.fromJson(e), data: {
        'account_number': accountNumber,
        'phone_number': phone,
        'money': money,
        'pin': pin
      });
    } catch (e) {
      rethrow;
    }
  }

  Future<void> buyCodePhone(
      {required String accountNumber,
        required String homeNetword,
        required int money,
        required String pin}) async {
    _repo.url = APIConstants.baseURL + APIConstants.buyCodePhone;
    try {
      await _repo.queryByPath((e) => ResponseMessage.fromJson(e), data: {
        'account_number': accountNumber,
        'home_netword': homeNetword,
        'money': money,
        'pin': pin
      });
    } catch (e) {
      rethrow;
    }
  }

  Future<void> sendMoney(
      {required String accountSender,
      required String accountReceiver,
      required int money,
      required String content,
      required int saveContact,
      required String pin}) async {
    _repo.url = APIConstants.baseURL + APIConstants.sendMoney;
    try {
      await _repo.queryByPath((e) => ResponseMessage.fromJson(e), data: {
        'account_number_sender': accountSender,
        'account_number_receiver': accountReceiver,
        'money': money,
        'content': content,
        'save_contact': saveContact,
        'pin': pin
      });
    } catch (e) {
      rethrow;
    }
  }
}
