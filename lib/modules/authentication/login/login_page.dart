import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../app_theme.dart';
import '../../../routes/app_routes.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Image.asset(
          'assets/images/agribank_logo.png',
          height: height160,
        ),
        centerTitle: true,
        actions: [
          InkWell(
            onTap: (){
              Get.back();
            },
            child: const Icon(
              Icons.close,
              color: black600,
            ),
          ),
          SizedBox(
            width: width16,
          )
        ],
      ),
      body: SizedBox(
        width: width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: height16,
            ),
            const Text(
              "Đăng nhập",
              style: TextStyle(
                  color: Color(0xFFd46c11),
                  fontWeight: FontWeight.w700,
                  fontSize: 20),
            ),
            SizedBox(
              height: height64,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: width24),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        "Số điện thoại",
                        style: TextStyle(color: black600),
                      ),
                      Text(
                        "037*****54",
                        style: TextStyle(
                            color: black200,
                            fontSize: 18,
                            fontWeight: FontWeight.w700),
                      )
                    ],
                  ),
                  SizedBox(
                    height: height4,
                  ),
                  const Divider(
                    thickness: 1,
                  ),
                  SizedBox(
                    height: height16,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Mật khẩu",
                        style: TextStyle(color: black600),
                      ),
                      Row(
                        children: [
                          SizedBox(width: width100, child: const TextField(
                            textDirection: TextDirection.rtl,
                            decoration: InputDecoration(
                              border: InputBorder.none
                            ),
                          )),
                          SizedBox(
                            width: width8,
                          ),
                          const Icon(
                            Icons.remove_red_eye_outlined,
                            color: black100,
                          )
                        ],
                      )
                    ],
                  ),
                  SizedBox(
                    height: height4,
                  ),
                  const Divider(
                    thickness: 1,
                  )
                ],
              ),
            ),
            SizedBox(
              height: height16,
            ),
            GestureDetector(
              onTap: () {
                Get.toNamed(AppRoutes.updateInformation);
              },
              child: Container(
                padding: EdgeInsets.symmetric(
                    horizontal: width34, vertical: height12),
                decoration: BoxDecoration(
                    color: const Color(0xFFff7700),
                    gradient: const LinearGradient(colors: [
                      Color(0xFFd47c24),
                      Color(0xFFc96a0a),
                    ]),
                    borderRadius: BorderRadius.circular(width24)),
                child: const Text(
                  'Đăng nhập',
                  style: TextStyle(color: white, fontSize: 16),
                ),
              ),
            ),
            SizedBox(
              height: height12,
            ),
            const Text("Quên mật khẩu", style: TextStyle(
              color: Color(0xFFe68840)
            ),)

          ],
        ),
      ),
    );
  }
}
