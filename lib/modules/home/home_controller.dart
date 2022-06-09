import 'package:agribank_banking/data/storage/store_global.dart';
import 'package:agribank_banking/services/user_service.dart';
import 'package:get/get.dart';

import '../../utils/enums.dart';

class HomeController extends GetxController {
  final banners = [
    'assets/images/home/banner_1.jpg',
    'assets/images/home/banner_2.jpg',
    'assets/images/home/banner_3.jpg',
    'assets/images/home/banner_4.png',
    'assets/images/home/banner_5.jpg'
  ];

  final _userService = UserService.instance;

  final loadStatus = AppLoadStatus.idle.obs;


  @override
  Future<void> onInit() async {
    // TODO: implement onInit'
    loadStatus(AppLoadStatus.loading);
    // await getAccounts();
    loadStatus(AppLoadStatus.success);
    super.onInit();
  }


}
