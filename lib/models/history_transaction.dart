import 'package:agribank_banking/models/base_entity.dart';

class HistoryTransactionEntity extends BaseEntity {
  HistoryTransactionEntity({
    required this.id,
    required this.userId,
    required this.transactionMoney,
    required this.type,
    required this.overbalance,
    required this.bankBranch,
    required this.contentTransaction,
    required this.accountNumberTransaction,
    required this.accountNumberDestination,
    required this.transactionFee,
    required this.createdAt,
    required this.updatedAt,
    required this.detail,
  });

  String id;
  String userId;
  int transactionMoney;
  String type;
  int overbalance;
  String bankBranch;
  String contentTransaction;
  String accountNumberTransaction;
  String accountNumberDestination;
  int transactionFee;
  DateTime? createdAt;
  DateTime? updatedAt;
  DetailHistoryTransactionEntity? detail;

  factory HistoryTransactionEntity.fromJson(Map<String, dynamic> json) => HistoryTransactionEntity(
    id: json["id"],
    userId: json["user_id"],
    transactionMoney: json["transaction_money"],
    type: json["type"],
    overbalance: json["overbalance"],
    bankBranch: json["bank_branch"],
    contentTransaction: json["content_transaction"],
    accountNumberTransaction: json["account_number_transaction"],
    accountNumberDestination: json["account_number_destination"],
    transactionFee: json["transaction_fee"],
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    detail: json["detail"] == null ? null : DetailHistoryTransactionEntity.fromJson(json["detail"]),
  );
}

class DetailHistoryTransactionEntity extends BaseEntity {
  DetailHistoryTransactionEntity({
    required this.id,
    required this.userIdSender,
    required this.transactionHistoryId,
    required this.userIdReceiver,
    required this.nameSender,
    required this.nameReceiver,
    required this.content,
    required this.saveContact,
    required this.nameInterbank,
    required this.codeInterbank,
    required this.type,
    this.createdAt,
    this.updatedAt,
  });

  String id;
  String userIdSender;
  String transactionHistoryId;
  String userIdReceiver;
  String nameSender;
  String nameReceiver;
  String content;
  bool saveContact;
  String nameInterbank;
  String codeInterbank;
  String type;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory DetailHistoryTransactionEntity.fromJson(Map<String, dynamic> json) => DetailHistoryTransactionEntity(
    id: json["id"],
    userIdSender: json["user_id_sender"],
    transactionHistoryId: json["transaction_history_id"],
    userIdReceiver: json["user_id_receiver"],
    nameSender: json["name_sender"],
    nameReceiver: json["name_receiver"],
    content: json["content"],
    saveContact: json["save_contact"],
    nameInterbank: json["name_interbank"] ?? '',
    codeInterbank: json["code_interbank"] ?? '',
    type: json["type"],
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
  );
}
