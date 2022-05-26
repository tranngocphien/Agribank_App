import 'package:agribank_banking/data/network/api_constants.dart';
import 'package:agribank_banking/models/bank_account_entity.dart';
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

}
