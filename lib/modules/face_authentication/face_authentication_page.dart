import 'package:agribank_banking/app_theme.dart';
import 'package:agribank_banking/routes/app_routes.dart';
import 'package:agribank_banking/utils/enums.dart';
import 'package:camera/camera.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'face_authentication_controller.dart';

class FaceAuthenticationPage extends GetWidget<FaceAuthenticationController> {
  const FaceAuthenticationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: black,
        appBar: AppBar(
          backgroundColor: black,
          leading: GestureDetector(
            child: const Icon(
              Icons.arrow_back,
              color: white,
            ),
            onTap: () {
              Get.offAndToNamed(AppRoutes.home);
            },
          ),
          centerTitle: true,
          title: const Text("Xác thực khuôn mặt"),
        ),
        body: Obx(() => controller.loadStatus.value == AppLoadStatus.loading
            ? const Center(
                child: CupertinoActivityIndicator(),
              )
            : SizedBox(
                width: width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                        width: width * 0.8,
                        child: const Text(
                          "Hãy điều chỉnh sao cho khuôn mặt nằm trong hình tròn",
                          style: TextStyle(color: white),
                          textAlign: TextAlign.center,
                        )),
                    SizedBox(
                      height: height8,
                    ),
                    SizedBox(
                      width: width * 0.8,
                      child: AspectRatio(
                        aspectRatio: 1,
                        child: ClipOval(
                          child: Transform.scale(
                            scale:
                                controller.controllerCamera!.value.aspectRatio,
                            child: Center(
                              child:
                                  CameraPreview(controller.controllerCamera!),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: height8,
                    ),
                    SizedBox(
                        width: width * 0.8,
                        child: Obx(() => Text(
                              controller.instructions[controller.step.value],
                              style: const TextStyle(color: white),
                              textAlign: TextAlign.center,
                            ))),
                  ],
                ),
              )));
  }
}
