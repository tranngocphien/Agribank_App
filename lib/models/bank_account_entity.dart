import 'package:agribank_banking/models/base_entity.dart';

class BankAccountEntity extends BaseEntity {
  BankAccountEntity(
      {required this.id,
      required this.userId,
      required this.accountNumber,
      required this.money,
      required this.typeAccount,
      required this.createdAt,
      required this.updatedAt});
  String id;
  String userId;
  String accountNumber;
  int money;
  String typeAccount;
  DateTime createdAt;
  DateTime updatedAt;

  factory BankAccountEntity.fromJson(Map<String, dynamic> json) {
    return BankAccountEntity(
        id: json['id'],
        userId: json['user_id'],
        accountNumber: json['account_number'],
        money: json['money'],
        typeAccount: json['type_account'],
        createdAt: DateTime.tryParse(json['createdAt']) ?? DateTime.now(),
        updatedAt: DateTime.tryParse(json['updatedAt']) ?? DateTime.now());
  }
}
