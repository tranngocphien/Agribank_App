import 'package:agribank_banking/data/network/api_constants.dart';
import 'package:agribank_banking/models/base_entity.dart';
import 'package:agribank_banking/models/response_login_entity.dart';
import 'package:agribank_banking/models/response_message.dart';
import 'package:agribank_banking/repositories/base_repository.dart';
import 'package:agribank_banking/services/dio_service.dart';
import 'package:agribank_banking/utils/enums.dart';
import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';

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

  Future<BaseEntity?> register(
      {required String username, required String password, required String phone}) async {
    _repo.url = APIConstants.baseURL + APIConstants.register;
    final data = {"name": username, "password": password, 'phone': phone};
    final res = await _repo.queryByPath((e) => BaseEntity.fromJson(e), data: data);
    return res;
  }

  Future<BaseEntity?> changePassword({required String oldPassword, required String newPassword, required String retypeNewPassword}) async {
    _repo.url = APIConstants.baseURL + APIConstants.changePassword;
    _repo.dio = DioService.instance.get();
    return  await _repo.queryByPath((e) => BaseEntity.fromJson(e), data: {
      'old_password': oldPassword,
      'new_password': newPassword,
      'retype_password': retypeNewPassword
    });

  }

  Future<ResponseMessage?> verifyFace({required XFile idImage, required XFile faceImage}) async {
    _repo.url = APIConstants.baseURL + APIConstants.verifyOCR;
    _repo.keyData = null;
    _repo.dio = DioService.instance.get();
    FormData formData = FormData.fromMap({
      "id_image":
      await MultipartFile.fromFile(idImage.path),
      "person_image": await MultipartFile.fromFile(faceImage.path)
    });
    return await _repo.queryByPath((e) => ResponseMessage.fromJson(e), data: formData);
  }
}

