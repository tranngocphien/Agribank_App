import 'package:agribank_banking/models/base_entity.dart';

class CurrencyEntity extends BaseEntity {
  Map<String, dynamic> data;
  
  CurrencyEntity({required this.data});
  
  factory CurrencyEntity.fromJson(Map<String, dynamic> json){
    return CurrencyEntity(data: json);
  }
}