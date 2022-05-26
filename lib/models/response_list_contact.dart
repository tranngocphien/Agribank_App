import 'package:agribank_banking/models/base_entity.dart';

class ResponseListContact extends BaseEntity {
  int count;
  List<ContactEntity> rows;
  ResponseListContact({required this.count, required this.rows});

  factory ResponseListContact.fromJson(Map<String, dynamic> json) {
    return ResponseListContact(
        count: json['count'],
        rows: (json['rows'] as List)
            .map((e) => ContactEntity.fromJson(e))
            .toList());
  }
}

class ContactEntity extends BaseEntity {
  ContactEntity(
      {required this.id,
      required this.userId,
      required this.nickName,
      required this.accountNumber,
      required this.typeContact,
      required this.nameBankInterbank,
      required this.createdAt,
      required this.updatedAt});
  String id;
  String userId;
  String nickName;
  String accountNumber;
  String typeContact;
  String? nameBankInterbank;
  DateTime createdAt;
  DateTime updatedAt;

  factory ContactEntity.fromJson(Map<String, dynamic> json) {
    return ContactEntity(
        id: json['id'],
        userId: json['user_id'],
        nickName: json['nick_name'],
        accountNumber: json['account_number'],
        typeContact: json['type_contact'],
        nameBankInterbank: json['name_bank_interbank'],
        createdAt: DateTime.parse(json['createdAt']),
        updatedAt: DateTime.parse(json['updatedAt']));
  }
}
