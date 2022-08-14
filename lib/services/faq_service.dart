import 'package:agribank_banking/data/network/api_constants.dart';
import 'package:agribank_banking/models/faq_entity.dart';
import 'package:agribank_banking/repositories/base_repository.dart';
import 'package:agribank_banking/services/dio_service.dart';
import 'package:agribank_banking/utils/enums.dart';

class FAQService {
  FAQService._();
  
  static final FAQService instance = FAQService._();
  
  final _repo = BaseRepository(url: APIConstants.baseURL, dio: DioService.instance.get(), method: HttpMethod.post);

  Future<List<FaqCategoryEntity>> getListCategory() async {
    _repo.url = APIConstants.baseURL + APIConstants.getListCategory;
    _repo.keyData = 'data';
    return await _repo.queryList((e) => FaqCategoryEntity.fromJson(e));
  }

  Future<List<FaqEntity>> getListFaq({required String category}) async {
    _repo.url = APIConstants.baseURL + APIConstants.getListFaq;
    _repo.keyData = 'data';
    return await _repo.queryList((e) => FaqEntity.fromJson(e), data: {
      'category': category
    });
  }

  void updateDioService() {
    _repo.dio = DioService.instance.get();
  }


  
}