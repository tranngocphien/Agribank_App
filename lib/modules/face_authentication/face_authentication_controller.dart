import 'package:agribank_banking/routes/app_routes.dart';
import 'package:agribank_banking/utils/enums.dart';
import 'package:camera/camera.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

class FaceAuthenticationController extends GetxController {
  CameraController? controllerCamera;

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
      Get.offAllNamed(AppRoutes.home);
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
}
