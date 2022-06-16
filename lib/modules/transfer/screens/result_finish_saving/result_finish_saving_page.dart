import 'package:agribank_banking/modules/transfer/screens/result_finish_saving/result_finish_saving_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../app_theme.dart';
import '../../../../components/button_border.dart';
import '../../../../components/information_tile.dart';
import '../../../../routes/app_routes.dart';
import '../../../../utils/convert.dart';

class ResultFinishSavingPage extends GetWidget<ResultFinishSavingController> {
  const ResultFinishSavingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: white,
        centerTitle: true,
        title: Text(
          'THANH TOÁN THÀNH CÔNG',
          style: Styles.baseNotoSansTS.copyWith(
              fontSize: 16,
              color: const Color(0xFFF67D10),
              fontWeight: FontWeight.w600),
        ),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.all(width16),
              width: width,
              padding: EdgeInsets.all(width16),
              decoration: const BoxDecoration(
                color: white,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset(
                        'assets/images/agribank_logo.png',
                        width: width150,
                        height: height60,
                        fit: BoxFit.fitWidth,
                      ),
                      const Icon(
                        Icons.home,
                        color: Color(0xFFF67D10),
                      )
                    ],
                  ),
                  Text(
                    'Quý khách đã thực hiện tất toán tài khoản tiền gửi trực tuyến thành công',
                    style: Styles.baseNotoSansTS.copyWith(fontSize: 14),
                  ),
                  SizedBox(
                    height: height8,
                  ),
                  Text(
                    MoneyFormat.formatMoneyInteger(controller
                        .result.money)
                        .replaceAll('-', '') +
                        ' VND',
                    style: Styles.baseNotoSansTS.copyWith(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: const Color(0xFFF67D10)),
                  ),
                  SizedBox(
                    height: height16,
                  ),
                  InformationTile(
                    label: 'Kỳ hạn',
                    content: '${controller.result.cycleMonth } tháng',
                    isFinal: true,
                  ),
                  SizedBox(
                    height: height4,
                  ),
                  InformationTile(
                    label: 'Lãi suất',
                    content: '${controller.result.cycleInterestRate} %',
                    isFinal: true,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: height16,
            ),
            Container(
              padding: EdgeInsets.all(width8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: width * 0.4,
                    height: height48,
                    child: ButtonPrimaryText(
                      onTab: () {
                        Get.until((route) => Get.currentRoute == AppRoutes.onlineSavingMoney);
                      },
                      margin: EdgeInsets.zero,
                      padding: EdgeInsets.all(width8),
                      radius: width30,
                      fontWeightText: FontWeight.w500,
                      sizeText: 16,
                      colorBackground: Colors.deepOrangeAccent,
                      colorText: white,
                      textPrimary: 'Giao dịch mới',
                      colorBorder: const Color(0xFFF67D10),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
