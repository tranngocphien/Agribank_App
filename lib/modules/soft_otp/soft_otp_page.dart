import 'package:agribank_banking/modules/soft_otp/soft_otp_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../app_theme.dart';

class SoftOPTPage extends GetWidget<SoftOTPController> {
  const SoftOPTPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFF67D10),
        centerTitle: true,
        title: Text(
          'CÀI ĐẶT SOFT OTP',
          style: Styles.baseNotoSansTS.copyWith(
              fontSize: 16, color: white, fontWeight: FontWeight.w600),
        ),
        elevation: 0,
      ),
      body: SingleChildScrollView(
          child: Column(
        children: [
          Container(
            margin: EdgeInsets.all(width16),
            padding: EdgeInsets.all(width16),
            decoration: BoxDecoration(
                color: white, borderRadius: BorderRadius.circular(width10)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Xác thực giao dịch bằng Soft OTP',
                  style: Styles.baseNotoSansTS.copyWith(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                        child: Text(
                      'Bảo mật và thuận tiện hơn khi xác thực giao dịch qua Soft OTP',
                      style: Styles.baseNotoSansTS.copyWith(color: black500),
                    )),
                    CupertinoSwitch(
                        value: controller.turnOnOTP.value,
                        onChanged: (value) {})
                  ],
                ),
                const Divider(
                  thickness: 1,
                ),
                SizedBox(
                  height: height8,
                ),
                Row(
                  children: [
                    const Icon(
                      Icons.warning,
                      color: Color(0xFFF67D10),
                    ),
                    SizedBox(
                      width: width8,
                    ),
                    Text(
                      'Lưu ý',
                      style: Styles.baseNotoSansTS.copyWith(
                        fontSize: 15,
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: height8,
                ),
                Text(
                  'Để đảm bảo an toàn, ứng dụng chỉ cho phép sử dụng chức năng Soft OTP khi Quý khách đã thực hiện 3'
                  ' giao dịch tài chính thành công bằng SMS OTP sau khi kích hoạt ứng dụng.',
                  style: Styles.baseNotoSansTS.copyWith(fontSize: 13),
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: width16),
            padding: EdgeInsets.all(width16),
            decoration: BoxDecoration(
                color: white, borderRadius: BorderRadius.circular(width10)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Đổi PIN',
                  style: Styles.baseNotoSansTS.copyWith(
                      fontSize: 16,
                      color: const Color(0xFFF67D10),
                      fontWeight: FontWeight.w600),
                ),
                const Icon(
                  Icons.arrow_forward_ios,
                  color: Color(0xFFF67D10),
                  size: 16,
                )
              ],
            ),
          ),
          SizedBox(
            height: height8,
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: width16),
            padding: EdgeInsets.all(width16),
            decoration: BoxDecoration(
                color: white, borderRadius: BorderRadius.circular(width10)),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Quên PIN',
                      style: Styles.baseNotoSansTS.copyWith(
                          fontSize: 16,
                          color: const Color(0xFFF67D10),
                          fontWeight: FontWeight.w600),
                    ),
                    const Icon(
                      Icons.arrow_forward_ios,
                      color: Color(0xFFF67D10),
                      size: 16,
                    )
                  ],
                ),
                SizedBox(
                  height: height8,
                ),
                Text(
                  'Quý khách sẽ được yêu cầu kích hoạt Soft OTP trong trường hợp sử dụng tính năng quên PIN.',
                  style: Styles.baseNotoSansTS
                      .copyWith(fontSize: 13, color: black500),
                )
              ],
            ),
          )
        ],
      )),
    );
  }
}
