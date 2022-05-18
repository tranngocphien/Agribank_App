import 'package:agribank_banking/modules/history_transaction/history_transaction_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../app_theme.dart';

class HistoryTransactionPage extends GetWidget<HistoryTransactionController> {
  const HistoryTransactionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6F6F6),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF67D10),
        centerTitle: true,
        title: Text(
          'LỊCH SỬ GIAO DỊCH',
          style: Styles.baseNotoSansTS.copyWith(
              fontSize: 16, color: white, fontWeight: FontWeight.w600),
        ),
        elevation: 0,
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(width16),
            child: Container(
              width: width,
              // height: height25*10,
              padding:
                  EdgeInsets.symmetric(vertical: height16, horizontal: width8),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(width16), color: white),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                          decoration: BoxDecoration(
                              color: const Color(0xFFF67D10),
                              borderRadius: BorderRadius.circular(width4)),
                          child: const Icon(
                            Icons.bar_chart,
                            color: white,
                          )),
                      SizedBox(
                        width: width8,
                      ),
                      Text(
                        'Tra cứu giao dịch',
                        style: Styles.baseNotoSansTS.copyWith(
                          fontSize: 16,
                          color: black,
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: height16,
                  ),
                  const Divider(
                    color: black,
                    height: 2,
                  ),
                  SizedBox(
                    height: height16,
                  ),
                  Text(
                    'Tài khoản',
                    style: Styles.baseNotoSansTS
                        .copyWith(fontSize: 14, color: black600),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '150428102440',
                        style: Styles.baseNotoSansTS.copyWith(
                            color: black,
                            fontSize: 16,
                            fontWeight: FontWeight.w500),
                      ),
                      const Icon(
                        Icons.arrow_drop_down,
                        color: black600,
                      )
                    ],
                  ),
                  SizedBox(
                    height: height8,
                  ),
                  const Divider(
                    color: black500,
                    height: 2,
                  ),
                  SizedBox(
                    height: height16,
                  ),
                  Text(
                    'Loại giao dịch',
                    style: Styles.baseNotoSansTS
                        .copyWith(fontSize: 14, color: black600),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Tất cả giao dịch',
                        style: Styles.baseNotoSansTS.copyWith(
                            color: black,
                            fontSize: 16,
                            fontWeight: FontWeight.w500),
                      ),
                      const Icon(
                        Icons.arrow_drop_down,
                        color: black600,
                      )
                    ],
                  ),
                  SizedBox(
                    height: height8,
                  ),
                  const Divider(
                    color: black500,
                    height: 2,
                  ),
                  SizedBox(
                    height: height4,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Từ ngày',
                            style: Styles.baseNotoSansTS
                                .copyWith(fontSize: 14, color: black700),
                          ),
                          SizedBox(
                            height: height8,
                          ),
                          Row(
                            children: [
                              Text(
                                '04/04/2022',
                                style: Styles.baseNotoSansTS
                                    .copyWith(fontSize: 16, color: black),
                              ),
                              SizedBox(
                                width: width16,
                              ),
                              Icon(Icons.arrow_drop_down)
                            ],
                          )
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Đến ngày',
                            style: Styles.baseNotoSansTS
                                .copyWith(fontSize: 14, color: black700),
                          ),
                          SizedBox(
                            height: height8,
                          ),
                          Row(
                            children: [
                              Text(
                                '04/05/2022',
                                style: Styles.baseNotoSansTS
                                    .copyWith(fontSize: 16, color: black),
                              ),
                              SizedBox(
                                width: width16,
                              ),
                              Icon(Icons.arrow_drop_down)
                            ],
                          ),
                        ],
                      ),
                      Container(
                        child: const Icon(
                          Icons.search,
                          color: Color(0xFFF67D10),
                        ),
                        padding: EdgeInsets.all(width4),
                        decoration: const BoxDecoration(
                            color: Color(0xFFF9F9F9), shape: BoxShape.circle),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: width16),
            child: Text('Lưu ý: Báo cáo chỉ bao gồm các giao dịch trên ứng dụng Agribank E-Mobile Banking',
              style: Styles.baseNotoSansTS.copyWith(
                fontSize: 14,
                fontStyle: FontStyle.italic,
                color: black500,
                height: 1.7
              ),
            ),
          )
        ],
      ),
    );
  }
}
