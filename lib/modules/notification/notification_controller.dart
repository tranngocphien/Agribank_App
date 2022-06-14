import 'package:agribank_banking/models/static_money.dart';
import 'package:agribank_banking/services/notification_service.dart';
import 'package:get/get.dart';

import '../../models/notification_entity.dart';
import '../../utils/enums.dart';

class NotificationController extends GetxController {
  final indexSelected = 0.obs;
  final types = ['Tất cả', 'Biến động số dự', 'Tin khác'];
  final typeNotifications = [Attribute(title: 'Tất cả', value: '0'), Attribute(title: 'Biến động số dư', value: '2'), Attribute(title: 'Tin khác', value: '1')];

  final _notificationService = NotificationService.instance;
  final notifications = List<NotificationEntity>.empty(growable: true).obs;

  final loadStatus = AppLoadStatus.loading.obs;

  @override
  Future<void> onInit() async {
    // TODO: implement onInit
    loadStatus(AppLoadStatus.loading);
    await getNotifications(type: 0);
    loadStatus(AppLoadStatus.success);
    super.onInit();
  }

  Future<void> getNotifications({required int type}) async {
    final response = await _notificationService.getNotifications(typeNotification: type);
    notifications
      ..clear()
      ..addAll(response!.rows);
  }
}
