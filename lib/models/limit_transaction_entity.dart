import 'package:agribank_banking/models/base_entity.dart';

class LimitTransactionEntity extends BaseEntity {
  int limitPerTrans;
  int limitPerDay;
  
  LimitTransactionEntity({required this.limitPerTrans,required this.limitPerDay});
  
  factory LimitTransactionEntity.fromJson(Map<String, dynamic> json) {
    return LimitTransactionEntity(limitPerTrans: json['limit_per_trans'], limitPerDay: json['limit_per_day']);
  }
}