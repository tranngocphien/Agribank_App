import 'package:dio/dio.dart';

///Create DioBase
class DioBase {
  ///GetDio
  static Dio getDio() => Dio(BaseOptions(
        connectTimeout: 10000,
        receiveTimeout: 10000,
        headers: {
          'Content-Type': 'application/json',
          'charset': 'utf-8',
          'accept': 'application/json'
        },
      ));

  static Dio addToken(String token) => Dio(BaseOptions(
    connectTimeout: 30000,
    receiveTimeout: 30000,
    headers: {
      'Authorization' : 'Bearer $token',
      'token': token,
    },
  ));
}
