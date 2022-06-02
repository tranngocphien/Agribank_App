import 'package:agribank_banking/models/base_entity.dart';

class CycleEntity extends BaseEntity{
  CycleEntity({
    required this.id,
    required this.title,
    required this.month,
    required this.interestRate,
    this.createdAt,
    this.updatedAt,
  });

  String id;
  String title;
  int month;
  double interestRate;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory CycleEntity.fromJson(Map<String, dynamic> json) => CycleEntity(
    id: json["id"] ?? '',
    title: json["title"] ?? '',
    month: json["month"] ?? '',
    interestRate: json["interest_rate"] ?? 0,
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
  );

}
