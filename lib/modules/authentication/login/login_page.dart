import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../app_theme.dart';
import '../../../routes/app_routes.dart';
import 'login_controller.dart';

class LoginPage extends GetWidget<LoginController> {
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
      body: SingleChildScrollView(
        child: SizedBox(
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
                      children: [
                        const Text(
                          "Số điện thoại",
                          style: TextStyle(color: black600),
                        ),
                        Obx(() => SizedBox(width: width200, child: Directionality(
                          textDirection: TextDirection.rtl,
                          child: TextField(
                            textDirection: TextDirection.rtl,
                            controller: controller.controllerPhone,
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                errorText: controller.phoneError.value
                            ),
                            style: Styles.baseNotoSansTS.copyWith(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                color: const Color(0xFFd46c11)
                            ),
                          ),
                        )))
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
                            Obx(() => SizedBox(width: width120, child: Directionality(
                              textDirection: TextDirection.rtl,
                              child: TextField(
                                textDirection: TextDirection.rtl,
                                controller: controller.controllerPassword,
                                obscureText: !controller.isShowPassword.value,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  errorText: controller.passwordError.value
                                ),
                                style: Styles.baseNotoSansTS.copyWith(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500
                                ),
                              ),
                            ))),
                            SizedBox(
                              width: width8,
                            ),
                            Obx(() => GestureDetector(
                              onTap: (){
                                controller.isShowPassword.value = !controller.isShowPassword.value;
                              },
                              child: Icon(
                                controller.isShowPassword.value ? Icons.visibility : Icons.visibility_off,
                                color: black100,
                              ),
                            ))
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
              GestureDetector(
                onTap: (){
                  Get.dialog(CupertinoAlertDialog(
                    title: const Text('Thông báo'),
                    content: const Text('Quý khách vui lòng đến điểm giao dịch gần nhất để lấy lại mật khẩu.'),
                    actions: [
                      CupertinoDialogAction(
                        onPressed: () {
                          Get.offAndToNamed(AppRoutes.home);
                        },
                        child: const Text('Đồng ý'),
                      )
                    ],
                  ));
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const Text("Quên mật khẩu", style: TextStyle(
                        color: Color(0xFFe68840)
                    ),),
                    SizedBox(width: width24,)
                  ],
                ),
              ),
              SizedBox(
                height: height16,
              ),
              GestureDetector(
                onTap: () async{
                  await controller.login();
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
              GestureDetector(
                onTap: (){
                  Get.toNamed(AppRoutes.register);
                },
                child: const Text("Đăng ký tài khoản", style: TextStyle(
                  color: Color(0xFFe68840)
                ),),
              )

            ],
          ),
        ),
      ),
    );
  }
}
