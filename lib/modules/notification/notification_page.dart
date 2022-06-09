import 'package:agribank_banking/app_theme.dart';
import 'package:agribank_banking/models/notification_entity.dart';
import 'package:agribank_banking/modules/notification/notification_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
                  await controller.getNotifications(type: int.parse(controller.typeNotifications[index].value));
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
                      .map((e) => NotificationItem(notification: e,))
                      .toList(),
                ),
        ));
  }
}

class NotificationItem extends StatelessWidget {
  const NotificationItem({
    required this.notification,
    Key? key,
  }) : super(key: key);
  final NotificationEntity notification;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(width16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: height48,
            width: width48,
            decoration:
                const BoxDecoration(shape: BoxShape.circle, image: DecorationImage(
                  image: AssetImage('assets/images/logo.png'), fit: BoxFit.contain
                )),

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
              children: [
                // Image.asset('assets/images/home/banner_1.jpg'),
                Text(notification.content, style: Styles.baseNotoSansTS.copyWith(
                  fontSize: 15
                ),)
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
                    text: e.title, isSelected: types.indexOf(e) == indexSelected)))
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
