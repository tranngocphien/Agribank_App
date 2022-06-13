import 'package:agribank_banking/data/network/api_constants.dart';
import 'package:agribank_banking/models/history_transaction.dart';
import 'package:agribank_banking/models/open_saving_account_entity.dart';
import 'package:agribank_banking/models/response_message.dart';
import 'package:agribank_banking/models/user_name_entity.dart';
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
      String? pin,
      String? password}) async {
    _repo.url = APIConstants.baseURL + APIConstants.rechargePhone;
    try {
      await _repo.queryByPath((e) => ResponseMessage.fromJson(e), data: {
        'account_number': accountNumber,
        'phone_number': phone,
        'money': money,
        'pin': pin,
        'password': password
      });
    } catch (e) {
      rethrow;
    }
  }

  Future<void> buyCodePhone(
      {required String accountNumber,
      required String homeNetword,
      required int money,
      String? pin,
        String? password
      }) async {
    _repo.url = APIConstants.baseURL + APIConstants.buyCodePhone;
    try {
      await _repo.queryByPath((e) => ResponseMessage.fromJson(e), data: {
        'account_number': accountNumber,
        'home_network': homeNetword,
        'money': money,
        'pin': pin,
        'password': password
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
      String? pin,
        String? password
      }) async {
    _repo.url = APIConstants.baseURL + APIConstants.sendMoney;
    _repo.keyData = null;
    try {
      await _repo.queryByPath((e) => ResponseMessage.fromJson(e), data: {
        'account_number_sender': accountSender,
        'account_number_receiver': accountReceiver,
        'money': money,
        'content': content,
        'save_contact': saveContact,
        'pin': pin,
        'password': password
      });
    } catch (e) {
      rethrow;
    }
  }

  Future<void> sendMoneyInterbank(
      {required String accountSender,
      required String accountReceiver,
      required int money,
      required String content,
      required int saveContact,
      required String nameReceiver,
      required String nameInterbank,
      String? pin,
        String? password
      }) async {
    _repo.url = APIConstants.baseURL + APIConstants.sendMoney;
    try {
      await _repo.queryByPath((e) => ResponseMessage.fromJson(e), data: {
        'account_number_sender': accountSender,
        'account_number_receiver': accountReceiver,
        'money': money,
        'content': content,
        'save_contact': saveContact,
        'pin': pin,
        'password': password,
        'otp': pin,
        'name_receiver': nameReceiver,
        'name_interbank': nameInterbank
      });
    } catch (e) {
      rethrow;
    }
  }

  Future<List<HistoryTransactionEntity>> getHistory(
      {required String type,
      required String accountNumber,
      required String startDate,
      required String endDate}) async {
    _repo.url = APIConstants.baseURL + APIConstants.historyTransaction;
    _repo.keyData = 'data';
    final histories = await _repo
        .queryList((e) => HistoryTransactionEntity.fromJson(e), data: {
      'account_number': accountNumber,
      'type_transaction': type,
      'start_date': startDate,
      'end_date': endDate
    });
    return histories;
  }

  Future<OpenSavingAccountEntity?> openSavingAccount(
      {required String sourceAccountNumber,
      required int money,
      required String typeRenew,
      required String cycleId}) async {
    _repo.url = APIConstants.baseURL + APIConstants.openSavingAccount;
    _repo.keyData = 'data';
    return await _repo
        .queryByPath((e) => OpenSavingAccountEntity.fromJson(e), data: {
      'source_account_number': sourceAccountNumber,
      'money': money,
      'type_renew': typeRenew,
      'cycle_id': cycleId
    });
  }

  Future<MoneySaving?> finishSavingMoney(
      {required String savingAccountNumber,
      required String receiveAccountNumber}) async {
    _repo.url = APIConstants.baseURL + APIConstants.finishSavingAccount;
    _repo.keyData = 'data';
    return await _repo.queryByPath((e) => MoneySaving.fromJson(e), data: {
      'saving_account_number': savingAccountNumber,
      'reciver_account_number': receiveAccountNumber
    });
  }

  Future<UserNameEntity?> getUserInternal({required String destination}) async {
    _repo.url = APIConstants.baseURL + APIConstants.getUserNameTransactionInternal;
    _repo.keyData = 'data';
    return await _repo.queryByPath((e) => UserNameEntity.fromJson(e), data:  {
      'destination': destination
    });
  }

  Future<UserNameEntity?> getUserInterbank({required String destination}) async {
    _repo.url = APIConstants.baseURL + APIConstants.getUserNameTransactionInterbank;
    _repo.keyData = 'data';
    return await _repo.queryByPath((e) => UserNameEntity.fromJson(e), data:  {
      'destination': destination
    });
  }
}
