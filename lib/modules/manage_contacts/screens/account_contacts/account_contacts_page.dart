import 'package:agribank_banking/modules/manage_contacts/screens/account_contacts/account_contacts_controller.dart';
import 'package:agribank_banking/routes/app_routes.dart';
import 'package:agribank_banking/utils/enums.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import '../../../../app_theme.dart';

class AccountContactsPage extends GetWidget<AccountContactsController> {
  const AccountContactsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFF67D10),
        centerTitle: true,
        title: Text(
          'DANH BẠ TÀI KHOẢN/THẺ',
          style: Styles.baseNotoSansTS.copyWith(
              fontSize: 16, color: white, fontWeight: FontWeight.w600),
        ),
        actions: [
          IconButton(
              onPressed: () {
                Get.toNamed(AppRoutes.createContact);
              },
              icon: const Icon(Icons.add))
        ],
        elevation: 0,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(height40),
          child: Container(
            height: height40,
            margin: EdgeInsets.all(width8),
            decoration: BoxDecoration(
                color: white.withOpacity(0.3),
                borderRadius: BorderRadius.circular(width20)),
            child: Obx(() => ListTypeAccountContacts(
                  types: const ["CK Nội bộ", "CK Liên ngân hàng"],
                  onPress: (value) {
                    controller.indexSelected.value = value;
                  },
                  indexSelected: controller.indexSelected.value,
                )),
          ),
        ),
      ),
      body: Container(
        width: width,
        height: height,
        margin: EdgeInsets.all(width16),
        padding: EdgeInsets.all(width16),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(width16),
            border: Border.all(color: black200)),
        child: Obx(() => controller.loadStatus.value == AppLoadStatus.loading
            ? const Center(
                child: CupertinoActivityIndicator(),
              )
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Icon(
                        Icons.contact_page,
                        color: Color(0xFFF67D10),
                      ),
                      SizedBox(
                        width: width16,
                      ),
                      Text(
                        controller.indexSelected.value == 0
                            ? 'Chuyển khoản nội bộ'
                            : 'Chuyển khoản liên ngân hàng',
                        style: Styles.baseNotoSansTS.copyWith(
                            fontSize: 14, fontWeight: FontWeight.w500),
                      )
                    ],
                  ),
                  const Divider(
                    thickness: 1,
                  ),
                  controller.indexSelected.value == 0
                      ? Column(
                          children: [
                            ...controller.internalContacts
                                .map((element) => InkWell(
                                      onTap: () {
                                        Get.toNamed(AppRoutes.detailContact,
                                            arguments: element);
                                      },
                                      child: Slidable(
                                        key: const ValueKey(0),
                                        endActionPane: ActionPane(
                                          motion: const ScrollMotion(),
                                          children: [
                                            SlidableAction(
                                              flex: 1,
                                              onPressed: (context){
                                                Get.dialog(CupertinoAlertDialog(
                                                  title: const Text('Thông báo'),
                                                  content: const Text('Quý khách có muốn chắc chắn xóa tài khoản này khỏi danh bạ?'),
                                                  actions: [
                                                    CupertinoDialogAction(
                                                      onPressed: () {
                                                        Get.back();
                                                      },
                                                      child: const Text('Hủy'),
                                                    ),
                                                    CupertinoDialogAction(
                                                      onPressed: () async {
                                                        Get.back();
                                                        await controller.deleteContact(element.id);
                                                      },
                                                      child: const Text('Đồng ý'),
                                                    )
                                                  ],
                                                ));
                                              },
                                              backgroundColor: Colors.red,
                                              foregroundColor: Colors.white,
                                              label: 'Xóa',
                                            ),
                                          ],
                                        ),
                                        child: Container(
                                          width: width,
                                          decoration: const BoxDecoration(
                                              border: Border(
                                                  bottom: BorderSide(
                                                      color: black100))),
                                          child: Row(
                                            children: [
                                              Image.asset(
                                                'assets/images/logo.png',
                                                width: width30,
                                                fit: BoxFit.cover,
                                              ),
                                              SizedBox(
                                                width: width8,
                                              ),
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    element.nickName,
                                                    style: Styles.baseNotoSansTS
                                                        .copyWith(
                                                            fontSize: 16,
                                                            color: const Color(
                                                                0xFFF67D10),
                                                            fontWeight:
                                                                FontWeight.w600),
                                                  ),
                                                  SizedBox(
                                                    height: height4,
                                                  ),
                                                  Text(
                                                    element.accountNumber,
                                                    style: Styles.baseNotoSansTS
                                                        .copyWith(
                                                            fontSize: 14,
                                                            color: black400),
                                                  ),
                                                  SizedBox(
                                                    height: height2,
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ))
                          ],
                        )
                      : Column(
                          children: [
                            ...controller.externalContacts
                                .map((element) => InkWell(
                                      onTap: () {
                                        Get.toNamed(AppRoutes.detailContact,
                                            arguments: element);
                                      },
                                      child: Container(
                                        width: width,
                                        decoration: const BoxDecoration(
                                            border: Border(
                                                bottom: BorderSide(
                                                    color: black100))),
                                        child: Row(
                                          children: [
                                            Image.asset(
                                              'assets/images/logo.png',
                                              width: width30,
                                              fit: BoxFit.cover,
                                            ),
                                            SizedBox(
                                              width: width8,
                                            ),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  element.nickName,
                                                  style: Styles.baseNotoSansTS
                                                      .copyWith(
                                                          fontSize: 16,
                                                          color: const Color(
                                                              0xFFF67D10),
                                                          fontWeight:
                                                              FontWeight.w600),
                                                ),
                                                SizedBox(
                                                  height: height4,
                                                ),
                                                Text(
                                                  element.accountNumber,
                                                  style: Styles.baseNotoSansTS
                                                      .copyWith(
                                                          fontSize: 14,
                                                          color: black400),
                                                ),
                                                SizedBox(
                                                  height: height2,
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ))
                          ],
                        ),
                ],
              )),
      ),
    );
  }
}

class ListTypeAccountContacts extends StatelessWidget {
  const ListTypeAccountContacts({
    required this.types,
    required this.onPress,
    required this.indexSelected,
    Key? key,
  }) : super(key: key);
  final List<String> types;
  final Function(int) onPress;
  final int indexSelected;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: types
          .map((e) => Expanded(
                child: GestureDetector(
                  onTap: () {
                    onPress(types.indexOf(e));
                  },
                  child: ListTypeItem(
                    title: e,
                    isClicked: types.indexOf(e) == indexSelected,
                  ),
                ),
              ))
          .toList(),
    );
  }
}

class ListTypeItem extends StatelessWidget {
  const ListTypeItem({
    Key? key,
    required this.title,
    required this.isClicked,
  }) : super(key: key);
  final String title;
  final bool isClicked;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(width4),
      decoration: BoxDecoration(
          color: isClicked ? white : null,
          borderRadius: BorderRadius.circular(width20)),
      child: Center(
        child: Text(
          title,
          style: Styles.baseNotoSansTS.copyWith(
              fontSize: 16, color: isClicked ? const Color(0xFFF67D10) : white),
        ),
      ),
    );
  }
}
