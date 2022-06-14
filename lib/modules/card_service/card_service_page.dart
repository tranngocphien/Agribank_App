import 'package:agribank_banking/modules/card_service/card_service_controller.dart';
import 'package:agribank_banking/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../app_theme.dart';
import '../../components/function_service_item.dart';

class CardServicePage extends GetWidget<CardServiceController> {
  const CardServicePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFF67D10),
        centerTitle: true,
        title: Text(
          'DỊCH VỤ THẺ',
          style: Styles.baseNotoSansTS.copyWith(
              fontSize: 16, color: white, fontWeight: FontWeight.w600),
        ),
        elevation: 0,
      ),
      body: Container(
        padding: EdgeInsets.all(width16),
        width: width,
        child: Column(
          children: [
            Text(
              'Dịch vụ áp dụng cho khách hàng có sử dụng',
              style: Styles.baseNotoSansTS.copyWith(
                fontSize: 16,
              ),
            ),
            Text(
              'Thẻ Agribank',
              style: Styles.baseNotoSansTS
                  .copyWith(fontSize: 16, fontWeight: FontWeight.w600),
            ),
            SizedBox(
              height: height16,
            ),
            Expanded(
              child: GridView.count(
                crossAxisCount: 3,
                mainAxisSpacing: width16,
                crossAxisSpacing: width16,
                childAspectRatio: 0.8,
                children: [
                  FunctionServiceItem(
                    icon: Image.asset('assets/icons/ic_credit_card.png'),
                    text: 'Truy vấn thông tin thẻ',
                    onPress: (){
                      Get.toNamed(AppRoutes.cardInfo);
                    },
                  ),
                  FunctionServiceItem(
                    icon: Image.asset('assets/icons/ic_credit_card.png'),
                    text: 'CK liên NH qua số tài khoản',
                    onPress: (){
                      Get.toNamed(AppRoutes.transferExAccNumber);
                    },
                  ),
                  FunctionServiceItem(
                    icon: Image.asset('assets/icons/ic_credit_card.png'),
                    text: 'CK liên NH qua số thẻ',
                    onPress: (){
                      Get.toNamed(AppRoutes.transferExCardNumber);
                    },
                  ),
                  FunctionServiceItem(
                    icon: Image.asset('assets/icons/ic_credit_card.png'),
                    text: 'Phát hành thẻ phi vật lý',
                    onPress: (){},
                  ),
                  FunctionServiceItem(
                    icon: Image.asset('assets/icons/ic_credit_card.png'),
                    text: 'Thanh toán thẻ tín dụng',
                    onPress: (){},
                  ),
                  FunctionServiceItem(
                    icon: Image.asset('assets/icons/ic_credit_card.png'),
                    text: 'Kích hoạt thẻ',
                    onPress: (){},
                  ),
                  FunctionServiceItem(
                    icon: Image.asset('assets/icons/ic_credit_card.png'),
                    text: 'Cấp/Đổi mã PIN',
                    onPress: (){},
                  ),
                  FunctionServiceItem(
                    icon: Image.asset('assets/icons/ic_credit_card.png'),
                    text: 'Khóa thẻ',
                    onPress: (){
                      Get.toNamed(AppRoutes.lockCard);
                    },
                  ),

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}


