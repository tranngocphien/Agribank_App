import 'package:agribank_banking/components/information_tile.dart';
import 'package:agribank_banking/modules/info_app/info_app_controller.dart';
import 'package:agribank_banking/utils/enums.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../app_theme.dart';

class InfoAppPage extends GetWidget<InfoAppController> {
  const InfoAppPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xFFF67D10),
          centerTitle: true,
          title: Text(
            'THÔNG TIN ỨNG DỤNG',
            style: Styles.baseNotoSansTS.copyWith(
                fontSize: 16, color: white, fontWeight: FontWeight.w600),
          ),
          elevation: 0,
        ),
        body: Obx(
          () => controller.loadStatus.value == AppLoadStatus.loading
              ? const Center(
                  child: CupertinoActivityIndicator(),
                )
              : SingleChildScrollView(
                  child: Container(
                    padding: EdgeInsets.all(width16),
                    child: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.all(width8),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(width16),
                              color: white),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              InformationTile(label: 'Nhà phát triển', content: controller.infoApp.value!.developers),
                              InformationTile(label: 'Hạng mục', content: controller.infoApp.value!.category),
                              InformationTile(label: 'Phiên bản', content: controller.infoApp.value!.version),
                              InformationTile(label: 'Dung lượng', content: controller.infoApp.value!.capacity),

                            ],
                          ),
                        ),
                        SizedBox(
                          height: height16,
                        ),
                      ],
                    ),
                  ),
                ),
        ));
  }
}
