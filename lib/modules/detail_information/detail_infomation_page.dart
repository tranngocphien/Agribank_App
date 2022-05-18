import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../app_theme.dart';
import 'detail_information_controller.dart';

class DetailInformationPage extends GetWidget<DetailInformationController> {
  const DetailInformationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xFFF67D10),
          centerTitle: true,
          title: Text('TÀI KHOẢN THANH TOÁN', style: Styles.baseNotoSansTS.copyWith(
              fontSize: 16,
              color: white,
              fontWeight: FontWeight.w600
          ),),
          elevation: 0,
        ),
      body: Container(
        padding: EdgeInsets.all(width16),
        child: Column(
          children: [
            Container(
              width: width,
              padding: EdgeInsets.symmetric(horizontal: width8, vertical: width16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(width16),
                color: white,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Icon(Icons.credit_card, color: Color(0xFFF67D10),),
                      SizedBox(width: width16,),
                      Text('Chi tiết tài khoản', style: Styles.baseNotoSansTS.copyWith(
                        fontSize: 16,
                        color: black,
                      ),)
                    ],
                  ),
                  SizedBox(height: height16,),
                  Text('150428102424', style: Styles.baseNotoSansTS.copyWith(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: const Color(0xFFF67D10)
                  ),),
                  SizedBox(height: height16,),
                  Text('Số dư: 0 VND', style: Styles.baseNotoSansTS.copyWith(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: black700
                  ),),
                  SizedBox(height: height16,),
                  const Divider(height: 2, color: black,),
                  SizedBox(height: height16,),
                  Text('Chủ tài khoản', style: Styles.baseNotoSansTS.copyWith(
                    fontSize: 16,
                    color: black500,
                  ),),
                  SizedBox(height: height8,),
                  Text('TRAN NGOC PHIEN', style: Styles.baseNotoSansTS.copyWith(
                    fontSize: 18,
                    color: black,
                  ),),
                  SizedBox(height: height8,),
                  const Divider(color: black, height: 2,),
                  SizedBox(height: height16,),
                  Text('Chi nhánh mở', style: Styles.baseNotoSansTS.copyWith(
                    fontSize: 16,
                    color: black500,
                  ),),
                  SizedBox(height: height8,),
                  Text('Chi nhanh Dong Da', style: Styles.baseNotoSansTS.copyWith(
                    fontSize: 18,
                    color: black,
                  ),),
                  SizedBox(height: height8,),
                ],
              ),
            ),
            SizedBox(height: height16,),
            Container(
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
          ],
        ),
      ),
    );
  }
}
