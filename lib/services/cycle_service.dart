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

}