import 'package:agribank_banking/app_theme.dart';
import 'package:agribank_banking/components/information_tile.dart';
import 'package:agribank_banking/modules/transfer/screens/result_transaction/result_transaction_controller.dart';
import 'package:agribank_banking/utils/convert.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';



import '../../../../components/button_border.dart';
import '../../../../routes/app_routes.dart';

class ResultTransactionPage extends GetWidget<ResultTransactionController> {
  const ResultTransactionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: white,
        centerTitle: true,
        title: Text(
          'THANH TOÁN THÀNH CÔNG',
          style: Styles.baseNotoSansTS.copyWith(
              fontSize: 16, color: const Color(0xFFF67D10), fontWeight: FontWeight.w600),
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
              decoration:  const BoxDecoration(
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
                    'Quý khách đã thực hiện thành công chuyển khoản số tiền',
                    style: Styles.baseNotoSansTS.copyWith(fontSize: 14),
                  ),
                  SizedBox(
                    height: height8,
                  ),
                  Text(
                    MoneyFormat.formatMoneyInteger(controller.result.transactionMoney)
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
                    label: 'Số tài khoản thụ hưởng',
                    content: controller.result.accountNumberDestination,
                    isFinal: true,
                  ),
                  SizedBox(
                    height: height16,
                  ),
                  InformationTile(
                    label: 'Tên người thụ hưởng',
                    content: controller.result.nameReceiver.toUpperCase(),
                    isFinal: true,
                    isHighLight: true,
                  ),
                  controller.result.nameInterbank != null
                      ? Column(
                          children: [
                            SizedBox(
                              height: height16,
                            ),
                            InformationTile(
                                label: 'Ngân hàng thụ hưởng',
                                content: controller.result.nameInterbank!),
                          ],
                        )
                      : Container(),
                  SizedBox(
                    height: height16,
                  ),
                  InformationTile(
                    label: 'Phí giao dịch',
                    content: MoneyFormat.formatMoneyInteger(
                            controller.result.transactionFee) +
                        ' VND',
                    isFinal: true,
                  ),
                  SizedBox(height: height16,),
                  InformationTile(
                    label: 'Thời gian giao dịch',
                    content:
                        ConvertDateTime.convertDateTime(controller.result.createdAt),
                    isFinal: true,
                  ),
                  SizedBox(height: height16,),
                  InformationTile(
                    label: 'Nội dung CK',
                    content: controller.result.content,
                    isFinal: true,
                  )
                ],
              ),
            ),
            SizedBox(height: height16,),
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
                        Get.until((route) => Get.currentRoute == AppRoutes.transfer);
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
