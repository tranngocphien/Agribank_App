import 'package:dio/dio.dart';

///Create DioBase
class DioBase {
  ///GetDio
  static Dio getDio() => Dio(
        BaseOptions(
          connectTimeout: 10000,
          receiveTimeout: 10000,
          headers: {
            'Content-Type': 'application/json',
            'charset': 'utf-8',
            'accept': 'application/json'
          },
        ),
      )..interceptors.add(LogInterceptor(
          request: true,
          responseBody: true,
          requestBody: true,
          requestHeader: true,
        ));

  static Dio addToken(String token) => Dio(BaseOptions(
        connectTimeout: 30000,
        receiveTimeout: 30000,
        headers: {
          'Authorization': 'Bearer $token',
          'token': token,
        },
      ))
        ..interceptors.add(LogInterceptor(
          request: true,
          responseBody: true,
          requestBody: true,
          requestHeader: true,
        ));
}
