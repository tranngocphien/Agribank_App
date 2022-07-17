import 'package:agribank_banking/models/card_entity.dart';
import 'package:agribank_banking/repositories/base_repository.dart';
import 'package:agribank_banking/services/dio_service.dart';

import '../data/network/api_constants.dart';
import '../utils/enums.dart';

class CardService {
  CardService._();
  static final CardService instance = CardService._();

  final _repo = BaseRepository(url: APIConstants.baseURL, dio: DioService.instance.get(), method: HttpMethod.post);

  Future<List<CardEntity>> getListCard() async {
    _repo.url = APIConstants.baseURL + APIConstants.getListCard;
    _repo.keyData = 'data';
    return await _repo.queryList((e) => CardEntity.fromJson(e));
  }

  Future<CardEntity?> updateLimit({required String id,int? limitInternet, int? limitCash, bool? block}) async {
    _repo.url = APIConstants.baseURL + APIConstants.updateCard;
    _repo.keyData = 'data';
    var data = {};
    if(block != null) {
      data = {
        'id': id,
        'block': block
      };
    }
    else {
      data = {
        'id': id,
        'limit_cash': limitCash,
        'limit_internet': limitInternet,
      };
    }

    return await _repo.queryByPath((e) => CardEntity.fromJson(e), data: data);

  }

  Future<CardEntity?> changePin({required String id,required String oldPass,required String newPass}) async {
    _repo.url = APIConstants.baseURL + APIConstants.updateCard;
    _repo.keyData = 'data';
    var data = {
      'id': id,
      'pin_old': oldPass,
      'pin_new': newPass,
    };

    return await _repo.queryByPath((e) => CardEntity.fromJson(e), data: data);

  }



}