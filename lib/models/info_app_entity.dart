import 'package:agribank_banking/models/base_entity.dart';

class InfoAppEntity extends BaseEntity {
  InfoAppEntity(
      {required this.developers,
      required this.capacity,
      required this.category,
      required this.version});
  String developers;
  String category;
  String version;
  String capacity;

  factory InfoAppEntity.fromJson(Map<String, dynamic> json) {
    return InfoAppEntity(
        developers: json['developers'],
        capacity: json['category'],
        category: json['version'],
        version: json['capacity']);
  }
}
