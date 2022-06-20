import 'package:agribank_banking/models/base_entity.dart';

class Province {
  final String name;
  final List<District> districts;
  Province({required this.name, required this.districts});
  factory Province.fromJson(Map<String, dynamic> json) {
    return Province(
        name: json['name'],
        districts: (json['districts'] as List)
            .map((e) => District.fromJson(e))
            .toList());
  }
}

class District {
  final String name;
  District({required this.name});
  factory District.fromJson(Map<String, dynamic> json) {
    return District(name: json['name']);
  }
}

class AddressEntity extends BaseEntity {
  AddressEntity({
    required this.id,
    required this.type,
    required this.ward,
    required this.district,
    required this.province,
    required this.description,
    required this.createdAt,
    required this.updatedAt,
  });

  String id;
  String type;
  String ward;
  String district;
  String province;
  String description;
  DateTime createdAt;
  DateTime updatedAt;

  factory AddressEntity.fromJson(Map<String, dynamic> json) => AddressEntity(
    id: json["id"],
    type: json["type"],
    ward: json["ward"],
    district: json["district"],
    province: json["province"],
    description: json["description"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "type": type,
    "ward": ward,
    "district": district,
    "province": province,
    "description": description,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
  };
}
