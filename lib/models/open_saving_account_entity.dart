import 'package:agribank_banking/models/base_entity.dart';
import 'package:agribank_banking/models/cycle_entity.dart';
import 'package:agribank_banking/models/history_transaction.dart';

class OpenSavingAccountEntity extends BaseEntity{
  OpenSavingAccountEntity({
    required this.accountSaving,
    required this.transactionHistory,
    required this.bankAccountSource,
    this.cycle,
  });

  AccountSaving? accountSaving;
  OpenSavingHistoryTransaction? transactionHistory;
  BankAccountSource? bankAccountSource;
  CycleEntity? cycle;

  factory OpenSavingAccountEntity.fromJson(Map<String, dynamic> json) => OpenSavingAccountEntity(
    accountSaving: json["accountSaving"] == null ? null : AccountSaving.fromJson(json["accountSaving"]),
    transactionHistory: json["transactionHistory"] == null ? null : OpenSavingHistoryTransaction.fromJson(json["transactionHistory"]),
    bankAccountSource: json["bankAccountSource"] == null ? null : BankAccountSource.fromJson(json["bankAccountSource"]),
    cycle: json["cycle"] == null ? null : CycleEntity.fromJson(json["cycle"]),
  );
}

class OpenSavingHistoryTransaction extends BaseEntity {
  OpenSavingHistoryTransaction({
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

  factory OpenSavingHistoryTransaction.fromJson(Map<String, dynamic> json) => OpenSavingHistoryTransaction(
    id: json["id"],
    userId: json["user_id"],
    transactionMoney: json["transaction_money"],
    type: json["type"],
    overbalance: json["overbalance"],
    bankBranch: json["bank_branch"],
    contentTransaction: json["content_transaction"],
    accountNumberTransaction: json["account_number_transaction"] ?? '',
    accountNumberDestination: json["account_number_destination"] ?? '',
    transactionFee: json["transaction_fee"],
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
  );
}


class AccountSaving extends BaseEntity{
  AccountSaving({
    required this.id,
    required this.typeSaving,
    required this.close,
    required this.userId,
    required this.typeRenew,
    required this.money,
    required this.accountNumber,
    required this.sourceAccountNumber,
    required this.dateOpenAccount,
    required this.startDate,
    required this.endDate,
    required this.cycleId,
    required this.cycleInterestRate,
    required this.cycleMonth,
    required this.updatedAt,
    required this.createdAt,
  });

  String id;
  String typeSaving;
  bool close;
  String userId;
  String typeRenew;
  int money;
  String accountNumber;
  String sourceAccountNumber;
  DateTime? dateOpenAccount;
  DateTime? startDate;
  DateTime? endDate;
  String cycleId;
  double cycleInterestRate;
  int cycleMonth;
  DateTime? updatedAt;
  DateTime? createdAt;

  factory AccountSaving.fromJson(Map<String, dynamic> json) => AccountSaving(
    id: json["id"] ?? '',
    typeSaving: json["type_saving"] ?? '',
    close: json["close"],
    userId: json["user_id"] ?? '',
    typeRenew: json["type_renew"] ?? '',
    money: json["money"] ?? 0,
    accountNumber: json["account_number"] ?? '',
    sourceAccountNumber: json["source_account_number"] ?? '',
    dateOpenAccount: json["date_open_account"] == null ? null : DateTime.parse(json["date_open_account"]),
    startDate: json["start_date"] == null ? null : DateTime.parse(json["start_date"]),
    endDate: json["end_date"] == null ? null : DateTime.parse(json["end_date"]),
    cycleId: json["cycle_id"] ?? '',
    cycleInterestRate: double.parse(json["cycle_interest_rate"].toString()),
    cycleMonth: json["cycle_month"] ?? 0,
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
  );

}

class BankAccountSource {
  BankAccountSource({
    required this.id,
    required this.userId,
    required this.accountNumber,
    required this.money,
    required this.typeAccount,
    required this.createdAt,
    required this.updatedAt,
  });

  String id;
  String userId;
  String accountNumber;
  int money;
  String typeAccount;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory BankAccountSource.fromJson(Map<String, dynamic> json) => BankAccountSource(
    id: json["id"] ?? '',
    userId: json["user_id"] ?? '',
    accountNumber: json["account_number"] ?? '',
    money: json["money"] ?? 0,
    typeAccount: json["type_account"] ?? '',
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
  );

}

class MoneySaving extends BaseEntity {
  MoneySaving({
    required this.money,
    required this.cycleInterestRate,
    required this.cycleMonth,
  });

  int money;
  double cycleInterestRate;
  int cycleMonth;

  factory MoneySaving.fromJson(Map<String, dynamic> json) => MoneySaving(
    money: json["money"] ?? 0,
    cycleInterestRate: double.parse(json["cycle_interest_rate"].toString()),
    cycleMonth: json["cycle_month"] ?? 0,
  );

  Map<String, dynamic> toJson() => {
    "money": money == null ? null : money,
    "cycle_interest_rate": cycleInterestRate == null ? null : cycleInterestRate,
    "cycle_month": cycleMonth == null ? null : cycleMonth,
  };
}


