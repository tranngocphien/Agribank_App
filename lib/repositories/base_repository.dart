import 'dart:async';
import '../models/base_entity.dart';
import '../utils/enums.dart';
import 'package:dio/dio.dart';
import 'package:logger/logger.dart';

abstract class BaseRepositoryInterface {
  int get timeoutInterval;

  Future<T?> queryByPath<T extends BaseEntity>(T Function(dynamic e) convert,
      {dynamic data});

  Future<List<T>> getAll<T extends BaseEntity>(T Function(dynamic e) convert);

  Future<List<T>> queryByKeyValue<T extends BaseEntity>(
      String key, String value, T Function(dynamic e) convert);

  Future<T?> postWithBody<T extends BaseEntity>(
      Map<String, dynamic> data, T Function(dynamic e) convert);

  Future<List<T>> getByOffsetLimit<T extends BaseEntity>(
      int offset, int limit, T Function(dynamic e) convert);

  Future<List<T>> getListByPath<T extends BaseEntity>(
      T Function(dynamic e) convert);

  Future<List<T>> queryList<T extends BaseEntity>(
      T Function(dynamic e) convert);
}

class BaseRepository extends BaseRepositoryInterface {
  BaseRepository({
    required this.url,
    required this.dio,
    required this.method,
    this.keyData,
  });

  late String url;
  String? keyData;
  late HttpMethod method;
  late Dio dio;

  final logger = Logger();

  @override
  Future<List<T>> getAll<T extends BaseEntity>(T Function(dynamic e) convert) {
    // TODO: implement getAll
    final response = dio.get(url);
    return _getDocuments(response, convert);
  }

  @override
  Future<T?> queryByPath<T extends BaseEntity>(T Function(dynamic e) convert,
      {dynamic data}) {
    dynamic response;
    switch (method) {
      case HttpMethod.get:
        response = dio.get(url);
        break;
      case HttpMethod.post:
        response = dio.post(url, data: data);
        break;
      case HttpMethod.put:
        response = dio.put(url, data: data);
        break;
      case HttpMethod.delete:
        response = dio.delete(url, data: data);
        break;
      case HttpMethod.path:
        response = dio.patch(url, data: data);
        break;
    }
    return _getDocument(response, convert);
  }

  @override
  Future<List<T>> queryByKeyValue<T extends BaseEntity>(
      String key, String value, T Function(dynamic e) convert) async {
    dynamic response;
    switch (method) {
      case HttpMethod.get:
        response = dio.get('$url?$key=$value');
        break;
      case HttpMethod.post:
        response = dio.post('$url?$key=$value');
        break;
      case HttpMethod.put:
        response = dio.put('$url?$key=$value');
        break;
      case HttpMethod.delete:
        response = dio.delete('$url?$key=$value');
        break;
      case HttpMethod.path:
        // TODO: Handle this case.
        break;
    }
    return _getDocuments(response, convert);
  }

  @override
  // TODO: implement timeoutInterval
  int get timeoutInterval => 30;

  T _decode<T extends BaseEntity>(Map<String, dynamic> document, T convert(e)) {
    try {
      final json = document;
      return convert(json);
    } on Exception {
      rethrow;
    }
  }

  Future<T?> _getDocument<T extends BaseEntity>(
      Future<dynamic> response, T Function(dynamic e) convert) async {
    try {
      dynamic snapShot;
      if ((keyData ?? '').isNotEmpty && keyData != 'data') {
        snapShot = (await response.timeout(
          Duration(seconds: timeoutInterval),
          onTimeout: () {
            throw TimeoutException(
                'The connection has timed out, Please try again!');
          },
        ))
            .data['data'][keyData];
      } else if (keyData == 'data') {
        snapShot = (await response.timeout(
          Duration(seconds: timeoutInterval),
          onTimeout: () {
            throw TimeoutException(
                'The connection has timed out, Please try again!');
          },
        ))
            .data['data'];
      } else {
        snapShot = (await response.timeout(
          Duration(seconds: timeoutInterval),
          onTimeout: () {
            throw TimeoutException(
                'The connection has timed out, Please try again!');
          },
        ))
            .data;
      }
      if (snapShot == null) {
        return null;
      }
      if (snapShot is String) {
        return null;
      }
      final listObj = _decode<T>(snapShot, convert);
      return listObj;
    } on Exception {
      rethrow;
    }
  }

  Future<List<T>> _getDocuments<T extends BaseEntity>(
      Future<dynamic> response, T Function(dynamic e) convert) async {
    try {
      dynamic snapShot;
      if ((keyData ?? '').isNotEmpty && keyData != 'data') {
        snapShot = (await response.timeout(
          Duration(seconds: timeoutInterval),
          onTimeout: () {
            throw TimeoutException(
                'The connection has timed out, Please try again!');
          },
        ))
            .data['data'][keyData];
      } else if (keyData == 'data') {
        snapShot = (await response.timeout(
          Duration(seconds: timeoutInterval),
          onTimeout: () {
            throw TimeoutException(
                'The connection has timed out, Please try again!');
          },
        ))
            .data['data'];
      } else {
        snapShot = (await response.timeout(
          Duration(seconds: timeoutInterval),
          onTimeout: () {
            throw TimeoutException(
                'The connection has timed out, Please try again!');
          },
        ))
            .data;
      }
      if (snapShot == null) {
        return [];
      }
      (snapShot as List<dynamic>).removeWhere((element) => element == null);
      final listObj =
          snapShot.map<T>((document) => _decode(document, convert)).toList();
      return listObj;
    } on Exception catch (e) {
      rethrow;
    }
  }

  @override
  Future<T?> postWithBody<T extends BaseEntity>(
      Map<String, dynamic> data, T Function(dynamic e) convert) async {
    // TODO: implement postWithBody
    final response = dio.post(url, queryParameters: data);
    return _getDocument(response, convert);
  }

  @override
  Future<List<T>> getByOffsetLimit<T extends BaseEntity>(
      int offset, int limit, T Function(dynamic e) convert) {
    // TODO: implement getByOffsetLimit
    dynamic response;
    switch (method) {
      case HttpMethod.get:
        response = dio.get('$url?page=$offset&limit=$limit');
        break;
      case HttpMethod.post:
        response = dio.post('$url?page=$offset&limit=$limit');
        break;
      case HttpMethod.put:
        response = dio.put('$url?page=$offset&limit=$limit');
        break;
      case HttpMethod.delete:
        response = dio.delete('$url?page=$offset&limit=$limit');
        break;
      case HttpMethod.path:
        // TODO: Handle this case.
        break;
    }
    return _getDocuments(response, convert);
  }

  @override
  Future<List<T>> getListByPath<T extends BaseEntity>(
      T Function(dynamic e) convert) {
    final response = dio.get(url);
    return _getDocuments(response, convert);
  }

  @override
  Future<List<T>> queryList<T extends BaseEntity>(T Function(dynamic e) convert, {dynamic data}) {
    // TODO: implement queryList
    final response = dio.post(url, data: data);
    return _getDocuments(response, convert);
  }
}
