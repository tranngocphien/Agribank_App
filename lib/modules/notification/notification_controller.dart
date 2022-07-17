import 'package:agribank_banking/models/static_money.dart';
import 'package:agribank_banking/services/notification_service.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../models/notification_entity.dart';
import '../../utils/enums.dart';

class NotificationController extends GetxController {
  final indexSelected = 0.obs;
  var indexPage = 0;

  final types = ['Tất cả', 'Biến động số dự', 'Tin khác'];
  final typeNotifications = [Attribute(title: 'Tất cả', value: '0'), Attribute(title: 'Biến động số dư', value: '2'), Attribute(title: 'Tin khác', value: '1')];

  final _notificationService = NotificationService.instance;
  final notifications = List<NotificationEntity>.empty(growable: true).obs;

  final loadStatus = AppLoadStatus.loading.obs;
  RefreshController refreshController = RefreshController(initialRefresh: false);


  @override
  Future<void> onInit() async {
    // TODO: implement onInit
    loadStatus(AppLoadStatus.loading);
    await getNotifications();
    loadStatus(AppLoadStatus.success);
    super.onInit();
  }

  Future<void> getNotifications() async {
    final response = await _notificationService.getNotifications(typeNotification: int.parse(typeNotifications[indexSelected.value].value), index: indexPage * 5);
    notifications.addAll(response!.rows);
    if(response.rows.isNotEmpty) {
      indexPage = indexPage + 1;
    }
  }

  Future<void> loadMore() async {
    await getNotifications();
    refreshController.loadComplete();
  }

  Future<void> onRefresh() async {
    notifications.clear();
    indexPage = 0;
    await getNotifications();
    refreshController.refreshCompleted();

  }


}
