import 'package:agribank_banking/data/network/api_constants.dart';
import 'package:agribank_banking/models/bank_account_entity.dart';
import 'package:agribank_banking/models/limit_transaction_entity.dart';
import 'package:agribank_banking/models/open_saving_account_entity.dart';
import 'package:agribank_banking/repositories/base_repository.dart';
import 'package:agribank_banking/services/dio_service.dart';
import 'package:agribank_banking/utils/enums.dart';

class UserService {
  UserService._();

  static final UserService instance = UserService._();

  final _repo = BaseRepository(url: APIConstants.baseURL, dio: DioService.instance.get(), method: HttpMethod.post);

  Future<List<BankAccountEntity>> getListBankAccount() async {
    _repo.dio = DioService.instance.get();
    _repo.url = APIConstants.baseURL + APIConstants.listBankAccount;
    _repo.keyData = 'data';
    final accounts = _repo.queryList((e) => BankAccountEntity.fromJson(e));
    return accounts;
  }

  Future<List<AccountSaving>> getListSavingAccount() async {
    _repo.dio = DioService.instance.get();
    _repo.url = APIConstants.baseURL + APIConstants.listSavingAccount;
    _repo.keyData = 'data';
    final accounts = _repo.queryList((e) => AccountSaving.fromJson(e));
    return accounts;
  }

  Future<LimitTransactionEntity?> updateLimitTransaction({required int limitPerTrans, required int limitPerDay}) async {
    _repo.url = APIConstants.baseURL + APIConstants.updateLimitTrans;
    _repo.keyData = 'data';
    final limit = _repo.queryByPath((e) => LimitTransactionEntity.fromJson(e), data: {
      'limit_per_trans': limitPerTrans,
      'limit_per_day': limitPerDay
    });
    return limit;
  }

  void updateDioService() {
    _repo.dio = DioService.instance.get();
  }

}
