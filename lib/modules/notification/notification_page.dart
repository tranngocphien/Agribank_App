import 'package:agribank_banking/app_theme.dart';
import 'package:agribank_banking/modules/notification/notification_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
              onPress: (index) {
                controller.indexSelected.value = index;
              },
              types: controller.types,
            ),
          ),
        ),
      ),
      body: ListView(
        children: [
          NotificationItem(),
          NotificationItem(),
          NotificationItem(),
          NotificationItem()
        ],
      ),
    );
  }
}

class NotificationItem extends StatelessWidget {
  const NotificationItem({
    Key? key,
  }) : super(key: key);

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
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.red
            ),
          ),
          SizedBox(width: width8,),
          Container(
            width: width - width120,
            // height: height120,
            padding: EdgeInsets.all(width4),
            decoration: BoxDecoration(
                color: white,
                borderRadius: BorderRadius.circular(width8)
            ),
            child: Column(
              children: [
                Image.asset('assets/images/home/banner_1.jpg'),
                const Text('Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum')
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
  final List<String> types;

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
                    text: e, isSelected: types.indexOf(e) == indexSelected)))
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
