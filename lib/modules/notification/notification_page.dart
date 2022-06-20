import 'package:agribank_banking/app_theme.dart';
import 'package:agribank_banking/data/network/api_constants.dart';
import 'package:agribank_banking/models/notification_entity.dart';
import 'package:agribank_banking/modules/notification/notification_controller.dart';
import 'package:agribank_banking/utils/convert.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_html/flutter_html.dart';

import '../../models/static_money.dart';
import '../../utils/enums.dart';

class NotificationPage extends GetWidget<NotificationController> {
  const NotificationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: const Color(0xFFF86F07),
          title: const Text(
            'THÔNG TIN AGRIBANK',
            style: TextStyle(
              fontSize: 18,
            ),
          ),
          centerTitle: true,
          actions: const [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(Icons.menu),
            )
          ],
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(height60),
            child: Obx(
              () => ListNotificationType(
                indexSelected: controller.indexSelected.value,
                onPress: (index) async {
                  controller.indexSelected.value = index;
                  await controller.getNotifications(
                      type:
                          int.parse(controller.typeNotifications[index].value));
                },
                types: controller.typeNotifications,
              ),
            ),
          ),
        ),
        body: Obx(
          () => controller.loadStatus.value == AppLoadStatus.loading
              ? const Center(
                  child: CupertinoActivityIndicator(),
                )
              : ListView(
                  children: controller.notifications
                      .map((e) =>
                      e.type == 2 ? NotificationItemType2(
                            notification: e,
                          ) : Container(
                        padding: EdgeInsets.all(width16),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: height36,
                              width: width36,
                              decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                      image: AssetImage('assets/images/logo.png'),
                                      fit: BoxFit.contain)),
                            ),
                            SizedBox(
                              width: width8,
                            ),
                            Container(
                              width: width - width120,
                              // height: height120,
                              padding: EdgeInsets.all(width8),
                              decoration: BoxDecoration(
                                  color: white, borderRadius: BorderRadius.circular(width8)),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // Image.asset('assets/images/home/banner_1.jpg'),
                                  Image.network(APIConstants.baseURL +'/' + e.image!),
                                  Text(
                                    e.title!,
                                    style: Styles.baseNotoSansTS.copyWith(
                                      fontWeight: FontWeight.w600
                                    ),
                                  ),
                                  Html(data: e.content,),
                                  SizedBox(
                                    height: height2,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      )
                  )
                      .toList(),
                ),
        ));
  }
}

class NotificationItemType2 extends StatelessWidget {
  const NotificationItemType2({
    required this.notification,
    Key? key,
  }) : super(key: key);
  final NotificationEntity notification;

  @override
  Widget build(BuildContext context) {
    bool isNegative = notification.transactionMoney.contains('-');
    int money = int.parse(notification.transactionMoney);
    return Container(
      padding: EdgeInsets.all(width16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: height36,
            width: width36,
            decoration: const BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                    image: AssetImage('assets/images/logo.png'),
                    fit: BoxFit.contain)),
          ),
          SizedBox(
            width: width8,
          ),
          Container(
            width: width - width120,
            // height: height120,
            padding: EdgeInsets.all(width8),
            decoration: BoxDecoration(
                color: white, borderRadius: BorderRadius.circular(width8)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Image.asset('assets/images/home/banner_1.jpg'),
                Text(
                  'BKBank :' + ConvertDateTime.convertDateTime(notification.createdAt!),
                ),
                SizedBox(
                  height: height2,
                ),
                Row(
                  children: [
                    Text(
                      'TK: ',
                      style: Styles.baseNotoSansTS
                          .copyWith(fontWeight: FontWeight.w500),
                    ),
                    Text(
                      notification.accountNumber,
                      style: Styles.baseNotoSansTS
                          .copyWith(fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      'Số tiền GD: ',
                      style: Styles.baseNotoSansTS
                          .copyWith(fontWeight: FontWeight.w500),
                    ),
                    Text(
                      '${!isNegative ? '+' + MoneyFormat.formatMoneyInteger(money) : '-' + MoneyFormat.formatMoneyInteger(-money)} VNĐ ',
                      style: Styles.baseNotoSansTS.copyWith(
                          fontWeight: FontWeight.w600,
                          color:  !isNegative
                              ? Colors.greenAccent
                              : Colors.redAccent),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      'Số dư cuối: ',
                      style: Styles.baseNotoSansTS
                          .copyWith(fontWeight: FontWeight.w500),
                    ),
                    Text(
                      MoneyFormat.formatMoneyInteger(notification.overbalance) + ' VNĐ',
                      style: Styles.baseNotoSansTS.copyWith(
                          fontWeight: FontWeight.w600,
                          color: Colors.blueAccent),
                    )
                  ],
                ),
                Text(
                  notification.content,
                  style: Styles.baseNotoSansTS.copyWith(fontSize: 13),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ListNotificationType extends StatelessWidget {
  const ListNotificationType(
      {Key? key,
      required this.indexSelected,
      required this.onPress,
      required this.types})
      : super(key: key);
  final int indexSelected;
  final Function(int index) onPress;
  final List<Attribute> types;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(width8),
      padding: EdgeInsets.all(width4),
      decoration: BoxDecoration(
        color: const Color(0xFFffc069),
        borderRadius: BorderRadius.circular(width32),
      ),
      height: height48,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: types
            .map((e) => GestureDetector(
                onTap: () {
                  onPress(types.indexOf(e));
                },
                child: TabItem(
                    text: e.title,
                    isSelected: types.indexOf(e) == indexSelected)))
            .toList(),
      ),
    );
  }
}

class TabItem extends StatelessWidget {
  const TabItem({
    Key? key,
    required this.text,
    required this.isSelected,
  }) : super(key: key);
  final String text;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height52,
      decoration: BoxDecoration(
          color: isSelected ? white : const Color(0xFFffc069),
          borderRadius: BorderRadius.circular(width32)),
      padding: EdgeInsets.symmetric(horizontal: width16, vertical: width8),
      child: Center(
          child: Text(
        text,
        style: TextStyle(
            fontSize: 16, color: isSelected ? Colors.deepOrangeAccent : white),
      )),
    );
  }
}
