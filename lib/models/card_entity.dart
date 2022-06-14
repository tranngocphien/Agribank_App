
import 'package:agribank_banking/models/base_entity.dart';

class CardEntity extends BaseEntity {
  CardEntity({
    required this.id,
    required this.bankAccountId,
    required this.cardNumber,
    required this.expirationDate,
    required this.limitCash,
    required this.limitInternet,
    required this.block,
    required this.createdAt,
    required this.updatedAt,
  });

  String id;
  String bankAccountId;
  String cardNumber;
  DateTime expirationDate;
  int limitCash;
  int limitInternet;
  bool block;
  DateTime createdAt;
  DateTime updatedAt;

  factory CardEntity.fromJson(Map<String, dynamic> json) => CardEntity(
    id:json["id"],
    bankAccountId: json["bank_account_id"],
    cardNumber: json["card_number"],
    expirationDate: DateTime.parse(json["expiration_date"]),
    limitCash: json["limit_cash"],
    limitInternet: json["limit_internet"],
    block:json["block"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
  );

}
