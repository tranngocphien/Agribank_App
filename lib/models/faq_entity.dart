import 'package:agribank_banking/models/base_entity.dart';

class FaqCategoryEntity extends BaseEntity {
  FaqCategoryEntity({
    required this.label,
    required this.value,
  });

  String label;
  String value;

  factory FaqCategoryEntity.fromJson(Map<String, dynamic> json) => FaqCategoryEntity(
    label: json["label"],
    value: json["value"],
  );
}

class FaqEntity extends BaseEntity{
  FaqEntity({
    required this.id,
    required this.question,
    required this.answer,
    required this.category,
    required this.createdAt,
    required this.updatedAt,
  });

  String id;
  String question;
  String answer;
  String category;
  DateTime createdAt;
  DateTime updatedAt;

  factory FaqEntity.fromJson(Map<String, dynamic> json) => FaqEntity(
    id: json["id"],
    question: json["question"],
    answer: json["answer"],
    category: json["category"],
    createdAt: DateTime.parse(json['createdAt']),
    updatedAt: DateTime.parse(json["updatedAt"]),
  );
  
}
