import 'package:agribank_banking/models/base_entity.dart';

class ResponseListNotification extends BaseEntity {
  int count;
  List<NotificationEntity> rows;
  ResponseListNotification({required this.count, required this.rows});

  factory ResponseListNotification.fromJson(Map<String, dynamic> json) {
    return ResponseListNotification(
        count: json['count'],
        rows: (json['rows'] as List)
            .map((e) => NotificationEntity.fromJson(e))
            .toList());
  }
}

class NotificationEntity extends BaseEntity {
  NotificationEntity({
    required this.type,
    required this.id,
    required this.userId,
    required this.accountNumber,
    required this.transactionMoney,
    required this.content,
    required this.overbalance,
    required this.createdAt,
    required this.updatedAt,
    this.title,
    this.image
  });

  int type;
  String id;
  String userId;
  String accountNumber;
  String transactionMoney;
  String content;
  int overbalance;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? title;
  String? image;

  factory NotificationEntity.fromJson(Map<String, dynamic> json) =>
      NotificationEntity(
        type: json["type"] ?? 0,
        id: json["id"] ?? '',
        userId: json["user_id"] ?? '',
        accountNumber: json["account_number"] ?? '',
        transactionMoney: json["transaction_money"] ?? '',
        content: json["content"] ?? '',
        overbalance: json["overbalance"] ?? 0,
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        title: json['title'],
        image: json['image']
      );
}
