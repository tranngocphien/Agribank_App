import 'package:agribank_banking/data/network/api_constants.dart';
import 'package:agribank_banking/models/response_list_contact.dart';
import 'package:agribank_banking/repositories/base_repository.dart';
import 'package:agribank_banking/services/dio_service.dart';
import 'package:agribank_banking/utils/enums.dart';

class ContactService {
  ContactService._();
  static final ContactService instance = ContactService._();
  final _repo = BaseRepository(
      url: APIConstants.baseURL,
      dio: DioService.instance.get(),
      method: HttpMethod.post);

  Future<ResponseListContact?> getListContact({required int typeContact, int index = 0, int count = 20}) async {
    _repo.dio = DioService.instance.get();
    _repo.url = APIConstants.baseURL + APIConstants.getListContact;
    _repo.keyData = 'data';
    final res = await _repo.queryByPath((e) => ResponseListContact.fromJson(e), data: {
      'type_contact': typeContact,
      'index': index,
      'count': count
    });
    return res;
  }
}
