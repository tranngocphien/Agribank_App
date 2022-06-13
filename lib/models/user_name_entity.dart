import 'package:agribank_banking/models/base_entity.dart';

class UserNameEntity extends BaseEntity {
  String? id;
  String? name;
  String? phone;

  UserNameEntity({required this.id, required this.name, required this.phone});

  factory UserNameEntity.fromJson(Map<String, dynamic> json) {
    return UserNameEntity(
        id: json['id'], name: json['name'], phone: json['phone']);
  }
}
