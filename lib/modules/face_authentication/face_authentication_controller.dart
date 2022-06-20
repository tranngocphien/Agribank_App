import 'package:agribank_banking/models/response_message.dart';
import 'package:agribank_banking/routes/app_routes.dart';
import 'package:agribank_banking/services/auth_service.dart';
import 'package:agribank_banking/utils/enums.dart';
import 'package:camera/camera.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

class FaceAuthenticationController extends GetxController {
  CameraController? controllerCamera;
  XFile? idImage = Get.arguments;

  final _authService = AuthService.instance;

  final loadStatus = AppLoadStatus.idle.obs;
  XFile? image;


  @override
  void onInit() async {
    // TODO: implement onInit
    loadStatus(AppLoadStatus.loading);
    await _initializeCamera();
    loadStatus(AppLoadStatus.success);
    super.onInit();
  }

  @override
  void onClose() async {
    await controllerCamera!.dispose();
  }

  Future<CameraDescription> _getCamera(CameraLensDirection dir) async {
    return await availableCameras().then(
      (List<CameraDescription> cameras) => cameras.firstWhere(
        (CameraDescription camera) => camera.lensDirection == dir,
      ),
    );
  }

  Future<void> takePicture() async {
    if (controllerCamera != null) {
      image = await controllerCamera!.takePicture();
      await verifyFace();
    }
  }

  Future<void> _initializeCamera() async {
    final camera = await _getCamera(CameraLensDirection.front);
    controllerCamera = CameraController(
      camera,
      defaultTargetPlatform == TargetPlatform.iOS
          ? ResolutionPreset.low
          : ResolutionPreset.medium,
    );
    await controllerCamera?.initialize();
  }

  Future<void> verifyFace() async {
    try {
      final ResponseMessage? response = await _authService.verifyFace(idImage: idImage!, faceImage: image!);
      if(response!.success == true){
        Get.dialog(CupertinoAlertDialog(
          title: const Text('Thông báo'),
          content: const Text('Đăng ký thành công'),
          actions: [
            CupertinoDialogAction(
              onPressed: () {
                Get.offAllNamed(AppRoutes.home);
              },
              child: const Text('Đồng ý'),
            )
          ],
        ));
      }
      else {
        Get.dialog(CupertinoAlertDialog(
          title: const Text('Thông báo'),
          content:  Text(response.message),
          actions: [
            CupertinoDialogAction(
              onPressed: () {
                Get.back();
              },
              child: const Text('Đồng ý'),
            )
          ],
        ));
      }


    }
    on DioError catch(e){
      final message = (e.response!.data as Map)['message'];
      Get.dialog(CupertinoAlertDialog(
        title: const Text('Thông báo'),
        content: Text(message),
        actions: [
          CupertinoDialogAction(
            onPressed: () {
              Get.back();
            },
            child: const Text('Đồng ý'),
          )
        ],
      ));
    }


  }
}
