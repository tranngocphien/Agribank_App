import 'package:agribank_banking/modules/information_lookup/screens/lookup_rate/lookup_rate_controller.dart';
import 'package:agribank_banking/utils/enums.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../app_theme.dart';

class LookupRatePage extends GetWidget<LookupRateController> {
  const LookupRatePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xFFF67D10),
          centerTitle: true,
          title: Text(
            'TRA CỨU LÃI SUẤT',
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
                    width: width,
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              height: height60,
                              width: width * 0.4,
                              padding: EdgeInsets.all(width16),
                              child: Center(
                                  child: Text(
                                'Kỳ hạn',
                                style: Styles.baseNotoSansTS
                                    .copyWith(fontSize: 14, color: black600),
                              )),
                            ),
                            Container(
                              width: width * 0.4,
                              height: height60,
                              padding: EdgeInsets.all(width16),
                              child: Center(
                                  child: Text('Lãi suất',
                                      style: Styles.baseNotoSansTS.copyWith(
                                          fontSize: 14, color: black600))),
                            )
                          ],
                        ),
                        const Divider(
                          height: 1,
                        ),
                        ...controller.cycles.map(
                          (element) => Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                height: height60,
                                width: width * 0.4,
                                padding: EdgeInsets.all(width16),
                                child: Center(
                                    child: Text(
                                  '${element.month} tháng',
                                  style: Styles.baseNotoSansTS
                                      .copyWith(fontSize: 15, color: black),
                                )),
                              ),
                              Container(
                                width: width * 0.4,
                                height: height60,
                                padding: EdgeInsets.all(width16),
                                child: Center(
                                    child: Text('${element.interestRate} %',
                                        style: Styles.baseNotoSansTS.copyWith(
                                            fontSize: 14,
                                            color: Colors.greenAccent))),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
        ));
  }
}
