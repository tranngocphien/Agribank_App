import 'package:agribank_banking/data/network/api_constants.dart';
import 'package:agribank_banking/models/response_login_entity.dart';
import 'package:agribank_banking/repositories/base_repository.dart';
import 'package:agribank_banking/services/dio_service.dart';
import 'package:agribank_banking/utils/enums.dart';

class AuthService {
  AuthService._();

  static final AuthService instance = AuthService._();

  final _repo = BaseRepository(
      url: APIConstants.baseURL,
      dio: DioService.instance.get(),
      method: HttpMethod.post);

  Future<LoginResponse?> login(
      {required String username, required String password}) async {
    _repo.url = APIConstants.baseURL + APIConstants.login;
    final data = {"phone": username, "password": password};
    final _authResponse = await _repo.queryByPath((e) => LoginResponse.fromJson(e), data: data);
    DioService.instance.updateDioWithToken(_authResponse!.data.token);
    return _authResponse;
  }
}

