import 'package:agribank_banking/models/info_app_entity.dart';

import '../data/network/api_constants.dart';
import '../models/address_entity.dart';
import '../repositories/base_repository.dart';
import '../utils/enums.dart';
import 'dio_service.dart';

class InfoAppService {
  InfoAppService._();

  static final InfoAppService instance = InfoAppService._();

  final _repo = BaseRepository(url: APIConstants.baseURL, dio: DioService.instance.get(), method: HttpMethod.get);

  Future<InfoAppEntity?> getInfoApp() async {
    _repo.url = APIConstants.baseURL + APIConstants.infoApp;
    _repo.keyData = 'data';
    return await _repo.queryByPath((e) => InfoAppEntity.fromJson(e));

  }

  Future<List<AddressEntity>> getListAddress({required String province, required String district, required String type}) async{
    _repo.url = APIConstants.baseURL + APIConstants.getListAddress;
    _repo.keyData = 'data';
    return await _repo.queryList((e) => AddressEntity.fromJson(e), data: {
      'province': province,
      'district': district,
      'type': type
    });

  }

  void updateDioService() {
    _repo.dio = DioService.instance.get();
  }



}