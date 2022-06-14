import 'package:agribank_banking/modules/transfer/screens/result_phone/result_phone_controller.dart';
import 'package:agribank_banking/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../app_theme.dart';
import '../../../../components/button_border.dart';
import '../../../../components/information_tile.dart';
import '../../../../routes/app_routes.dart';
import '../../../../utils/convert.dart';

class ResultPhonePage extends GetWidget<ResultPhoneController> {
  const ResultPhonePage({Key? key}) : super(key: key);

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
                    'Quý khách đã thanh toán thành công số tiền',
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
                  Text(
                    controller.result.contentTransaction,
                    style: Styles.baseNotoSansTS.copyWith(fontSize: 14),
                  ),
                  SizedBox(height: height8,),
                  controller.result.type == buyCodePhone ?
                      Column(
                        children: [
                          InformationTile(label: 'Mã thẻ', content: controller.result.codeNumber!, isFinal: true,),
                          SizedBox(height: height8,),
                          InformationTile(label: 'Số serial', content: controller.result.serialNumber!, isFinal: true,),
                          SizedBox(height: height8,),
                          InformationTile(label: 'Nhà cung cấp', content: controller.result.homeNetwork!, isFinal: true,)

                        ],
                      ): Column(
                    children: [
                      InformationTile(label: 'Số điện thoại', content: controller.result.phoneNumber!)
                    ],
                  ),
                  InformationTile(label: 'Phí giao dịch', content: MoneyFormat.formatMoneyInteger(controller.result.transactionFee) + ' VNĐ', isFinal: true,),
                  InformationTile(label: 'Thời gian', content: ConvertDateTime.convertDateTime(controller.result.createdAt), isFinal: true,)


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
                        if(controller.result.type == buyCodePhone){
                          Get.until((route) => Get.currentRoute == AppRoutes.buyPhoneCard);
                        }
                        if(controller.result.type == rechargePhone){
                          Get.until((route) => Get.currentRoute == AppRoutes.rechargePhone);
                        }
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
