import 'package:agribank_banking/models/notification_entity.dart';
import 'package:agribank_banking/repositories/base_repository.dart';
import 'package:agribank_banking/services/dio_service.dart';
import 'package:agribank_banking/utils/enums.dart';

import '../data/network/api_constants.dart';

class NotificationService {
  NotificationService._();

  static final NotificationService instance = NotificationService._();

  final _repo = BaseRepository(url: APIConstants.baseURL, dio: DioService.instance.get(), method: HttpMethod.post);

  Future<ResponseListNotification?> getNotifications({required int typeNotification}) async {
    _repo.url = APIConstants.baseURL + APIConstants.getNotifications;
    _repo.keyData = 'data';
    return await _repo.queryByPath((e) => ResponseListNotification.fromJson(e),data: {
      'type_notification': typeNotification
    });
  }
}