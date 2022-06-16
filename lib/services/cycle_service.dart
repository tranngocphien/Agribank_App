import 'package:agribank_banking/models/currency_entity.dart';
import 'package:agribank_banking/models/cycle_entity.dart';

import '../data/network/api_constants.dart';
import '../repositories/base_repository.dart';
import '../utils/enums.dart';
import 'dio_service.dart';

class CycleService {
  CycleService._();

  static final CycleService instance = CycleService._();

  final _repo = BaseRepository(
      url: APIConstants.baseURL,
      dio: DioService.instance.get(),
      method: HttpMethod.post);

  Future<List<CycleEntity>> getListCycle() async {
    _repo.url = APIConstants.baseURL + APIConstants.getCycles;
    _repo.keyData = 'data';
    return await _repo.queryList((e) => CycleEntity.fromJson(e));
  }

  Future<CurrencyEntity?> getListCurrencty() async {
    _repo.url = APIConstants.baseURL + APIConstants.getCurrency;
    _repo.method = HttpMethod.get;
    _repo.keyData = 'data';
    return await _repo.queryByPath((e) => CurrencyEntity.fromJson(e));
  }

}