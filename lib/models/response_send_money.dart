import 'package:agribank_banking/models/base_entity.dart';

class ResponseSendMoney extends BaseEntity{
  ResponseSendMoney({
    required this.id,
    required this.transactionHistoryId,
    required this.userIdSender,
    required this.userIdReceiver,
    required this.nameSender,
    required this.nameReceiver,
    required this.content,
    required this.saveContact,
    required this.type,
    required this.nameInterbank,
    required this.codeInterbank,
    required this.updatedAt,
    required this.createdAt,
    required this.bankBranch,
    required this.userId,
    required this.transactionMoney,
    required this.overbalance,
    required this.contentTransaction,
    required this.transactionFee,
    required this.accountNumberTransaction,
    required this.accountNumberDestination,
  });

  String id;
  String transactionHistoryId;
  String userIdSender;
  String? userIdReceiver;
  String nameSender;
  String nameReceiver;
  String content;
  bool saveContact;
  String type;
  String? nameInterbank;
  String? codeInterbank;
  DateTime updatedAt;
  DateTime createdAt;
  String bankBranch;
  String userId;
  int transactionMoney;
  int overbalance;
  String contentTransaction;
  int transactionFee;
  String accountNumberTransaction;
  String accountNumberDestination;

  factory ResponseSendMoney.fromJson(Map<String, dynamic> json) => ResponseSendMoney(
    id: json["id"] ?? '',
    transactionHistoryId: json["transaction_history_id"] ?? '',
    userIdSender: json["user_id_sender"] ?? '',
    userIdReceiver: json["user_id_receiver"],
    nameSender: json["name_sender"] ?? '',
    nameReceiver: json["name_receiver"] ?? '',
    content: json["content"] ?? '',
    saveContact: json["save_contact"] ?? '',
    type: json["type"] ?? '',
    nameInterbank: json["name_interbank"],
    codeInterbank: json["code_interbank"],
    updatedAt:DateTime.parse(json["updatedAt"]),
    createdAt:DateTime.parse(json["createdAt"]),
    bankBranch: json["bank_branch"],
    userId: json["user_id"],
    transactionMoney: json["transaction_money"],
    overbalance: json["overbalance"],
    contentTransaction: json["content_transaction"],
    transactionFee: json["transaction_fee"],
    accountNumberTransaction: json["account_number_transaction"],
    accountNumberDestination: json["account_number_destination"],
  );

}
