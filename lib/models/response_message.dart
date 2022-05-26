import 'package:agribank_banking/models/base_entity.dart';

class ResponseMessage extends BaseEntity {
  ResponseMessage(
      {required this.success, required this.message, required this.code});

  final bool success;
  final String message;
  final int code;

  factory ResponseMessage.fromJson(Map<String, dynamic> json) {
    return ResponseMessage(
        success: json['success'], message: json['message'], code: json['code']);
  }
}
