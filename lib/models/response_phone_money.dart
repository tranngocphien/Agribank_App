import 'package:agribank_banking/models/base_entity.dart';

class ResponsePhoneMoney extends BaseEntity {
  ResponsePhoneMoney({
    required this.id,
    required this.transactionHistoryId,
    required this.phoneNumber,
    required this.homeNetwork,
    required this.codeNumber,
    required this.serialNumber,
    required this.updatedAt,
    required this.createdAt,
    required this.bankBranch,
    required this.transactionFee,
    required this.userId,
    required this.transactionMoney,
    required this.overbalance,
    required this.contentTransaction,
    required this.type,
  });

  String id;
  String transactionHistoryId;
  String? phoneNumber;
  String? homeNetwork;
  String? codeNumber;
  String? serialNumber;
  DateTime updatedAt;
  DateTime createdAt;
  String bankBranch;
  int transactionFee;
  String userId;
  int transactionMoney;
  int overbalance;
  String contentTransaction;
  String type;

  factory ResponsePhoneMoney.fromJson(Map<String, dynamic> json) => ResponsePhoneMoney(
    id: json["id"],
    transactionHistoryId: json["transaction_history_id"],
    phoneNumber: json["phone_number"],
    homeNetwork: json["home_network"],
    codeNumber: json["code_number"],
    serialNumber: json["serial_number"],
    updatedAt: DateTime.parse(json["updatedAt"]),
    createdAt: DateTime.parse(json["createdAt"]),
    bankBranch: json["bank_branch"],
    transactionFee: json["transaction_fee"],
    userId: json["user_id"],
    transactionMoney: json["transaction_money"],
    overbalance: json["overbalance"],
    contentTransaction: json["content_transaction"],
    type: json["type"],
  );
}
