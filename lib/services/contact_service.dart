import 'package:agribank_banking/data/network/api_constants.dart';
import 'package:agribank_banking/models/base_entity.dart';
import 'package:agribank_banking/models/response_list_contact.dart';
import 'package:agribank_banking/models/response_message.dart';
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

  Future<ResponseListContact?> getListContact(
      {required int typeContact, int index = 0, int count = 20}) async {
    _repo.dio = DioService.instance.get();
    _repo.url = APIConstants.baseURL + APIConstants.getListContact;
    _repo.keyData = 'data';
    final res = await _repo.queryByPath((e) => ResponseListContact.fromJson(e),
        data: {'type_contact': typeContact, 'index': index, 'count': count});
    return res;
  }

  Future<ContactEntity?> createContact(
      {required String typeContact,
      required String nickName,
      required String accountNumber,
      required String nameBankInterbank}) async {
    _repo.method = HttpMethod.post;
    _repo.url = APIConstants.baseURL + APIConstants.addContact;
    _repo.keyData = 'data';
    final res = await _repo.queryByPath((e) => ContactEntity.fromJson(e), data: {
      'type_contact': typeContact,
      'nick_name': nickName,
      'account_number': accountNumber,
      'name_bank_interbank': nameBankInterbank
    });
    _repo.keyData = null;
    return res;
  }

  Future<ContactEntity?> updateContact({required String id, required String type}) async {
    _repo.method = HttpMethod.post;
    _repo.url = APIConstants.baseURL + APIConstants.updateContact;
    _repo.keyData = 'data';
    try {
      final res = await _repo.queryByPath((e) => ContactEntity.fromJson(e), data: {
        'id': id,
        'type_contact': type
      });
      return res;
    }
    catch (e) {
      rethrow;
    }
  }

  Future<ResponseMessage?> deleteContact({required String id}) async {
    _repo.method = HttpMethod.post;
    _repo.url = APIConstants.baseURL + APIConstants.deleteContact;
    try {
      final res = await _repo.queryByPath((e) => ResponseMessage.fromJson(e), data: {
        'id': id
      });
      return res;
    }
    catch (e) {
      rethrow;
    }

  }
}
