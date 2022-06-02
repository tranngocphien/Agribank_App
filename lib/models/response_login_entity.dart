import 'package:agribank_banking/models/base_entity.dart';

class LoginResponse extends BaseEntity {
  LoginResponse({
    required this.success,
    required this.data,
    required this.message,
    required this.code,
  });

  bool success;
  LoginEntity data;
  String message;
  int code;

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return LoginResponse(
        success: json['success'],
        data: LoginEntity.fromJson(json['data']),
        message: json['message'],
        code: json['code']);
  }
}

class LoginEntity {
  LoginEntity({
    required this.token,
    required this.refreshToken,
    required this.user,
  });

  String token;
  String refreshToken;
  UserEntity user;

  factory LoginEntity.fromJson(Map<String, dynamic> json) {
    return LoginEntity(
        token: json['token'],
        refreshToken: json['refreshToken'],
        user: UserEntity.fromJson(json['user']));
  }
}

class UserEntity {
  UserEntity({
    required this.id,
    required this.name,
    required this.phone,
    required this.email,
    required this.avatar,
    required this.accountNumber,
    required this.password,
    required this.rule,
    required this.pinSoftOtp,
    required this.softOtp,
    required this.imageCmnd,
    required this.imageAvatar,
    required this.verified,
    required this.limitPerTrans,
    required this.limitPerDay,
    required this.birthDay,
    required this.address,
    required this.createdAt,
    required this.updatedAt,
  });

  String id;
  String name;
  String phone;
  String email;
  String avatar;
  String accountNumber;
  String password;
  String rule;
  String pinSoftOtp;
  bool softOtp;
  String imageCmnd;
  String imageAvatar;
  bool verified;
  int limitPerTrans;
  int limitPerDay;
  DateTime? birthDay;
  String address;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory UserEntity.fromJson(Map<String, dynamic> json) {
    return UserEntity(
        id: json['id'],
        name: json['name'] ?? '',
        phone: json['phone'] ?? '',
        email: json['email'] ?? '',
        avatar: json['avatar'] ?? '',
        accountNumber: json['account_number'] ?? '',
        password: json['password'],
        rule: json['rule'],
        pinSoftOtp: json['rule'] ?? '',
        softOtp: json['soft_otp'],
        imageCmnd: json['image_cmnd'] ?? '',
        imageAvatar: json['image_avatar'] ?? '',
        verified: json['verified'],
        limitPerTrans: json['limit_per_trans'],
        limitPerDay: json['limit_per_day'],
        birthDay: DateTime.tryParse(json['birth_day'] ?? ''),
        address: json['address'] ?? '',
        createdAt: DateTime.tryParse(json['createdAt']),
        updatedAt: DateTime.tryParse(json['updatedAt']));
  }
}