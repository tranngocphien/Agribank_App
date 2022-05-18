import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../app_theme.dart';
import '../../../routes/app_routes.dart';
import '../../../utils/enums.dart';
import 'cccd_authentication_controller.dart';

class CccdAuthenticationPage extends GetWidget<CccdAuthenticationController> {
  const CccdAuthenticationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const double previewAspectRatio = 0.7;

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
          title: const Text("Chụp mặt trước"),
        ),
        body: Obx(() => controller.loadStatus.value == AppLoadStatus.loading
            ? const Center(
                child: CupertinoActivityIndicator(),
              )
            : SizedBox(
                width: width,
                child: Column(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                              width: width * 0.8,
                              child: const Text(
                                "Vui lòng điều chỉnh thiết bị để thấy rõ giấy tờ tùy thân và nhấn chụp ảnh",
                                style: TextStyle(color: white),
                                textAlign: TextAlign.center,
                              )),
                          SizedBox(
                            height: height8,
                          ),
                          SizedBox(
                            width: width * 0.8,
                            child: AspectRatio(
                              aspectRatio: 1 / previewAspectRatio,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(width16),
                                child: Transform.scale(
                                  scale:
                                  controller.controllerCamera!.value.aspectRatio / previewAspectRatio,
                                  child: Center(
                                    child:
                                    CameraPreview(controller.controllerCamera!),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: height32,
                          ),
                          // controller.image != null ? Image.file(File(controller.image!.path)) : Container()
                          GestureDetector(
                            onTap: () async {
                              print('aaaaaaaaaaaaaaaaaaaaaaaaa');
                              await controller.pickImage();
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                border: Border.all(color: white),
                                borderRadius: BorderRadius.circular(width8)
                              ),
                              padding: EdgeInsets.all(width8),
                              child: const Text('Chọn ảnh từ thiết bị', style: TextStyle(
                                color: white
                              ),),
                            ),
                          )
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: () async {
                        await controller.takePicture();
                      },
                      child: Container(
                        margin: EdgeInsets.only(bottom: height40),
                        padding: EdgeInsets.all(width16),
                        child: Icon(Icons.camera_alt_rounded, size: width32,),
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                          boxShadow: [BoxShadow(color: white, spreadRadius: 6, blurRadius: 15)]
                        ),
                      ),
                    )
                  ],
                ),
              )));
  }
}
