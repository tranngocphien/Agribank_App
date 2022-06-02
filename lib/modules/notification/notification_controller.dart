import 'package:agribank_banking/services/notification_service.dart';
import 'package:get/get.dart';

import '../../models/notification_entity.dart';
import '../../utils/enums.dart';

class NotificationController extends GetxController {
  final indexSelected = 0.obs;
  final types = ['Tất cả', 'Biến động số dự', 'Tin khác'];

  final _notificationService = NotificationService.instance;
  final notifications = List<NotificationEntity>.empty(growable: true).obs;

  final loadStatus = AppLoadStatus.loading.obs;

  @override
  Future<void> onInit() async {
    // TODO: implement onInit
    loadStatus(AppLoadStatus.loading);
    await getNotifications();
    loadStatus(AppLoadStatus.success);
    super.onInit();
  }

  Future<void> getNotifications() async {
    final response = await _notificationService.getNotifications(typeNotification: 0);
    notifications
      ..clear()
      ..addAll(response!.rows);
  }
}
