import 'package:dio/dio.dart';
import '../data/network/dio_base.dart';

class DioService {
  DioService._();

  static final instance = DioService._();
  static Dio _dio = DioBase.getDio();

  Dio get() => _dio;

  void updateDioWithToken(String token) {
    _dio = DioBase.addToken(token);
  }

  void deleteDioToken(){
    _dio = DioBase.getDio();
  }
}
