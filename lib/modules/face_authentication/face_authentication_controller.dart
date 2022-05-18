import 'dart:math';
import 'dart:ui';

import 'package:agribank_banking/utils/enums.dart';
import 'package:camera/camera.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:google_ml_kit/google_ml_kit.dart';
import 'package:get/get.dart';

class FaceAuthenticationController extends GetxController {
  CameraController? controllerCamera;

  final loadStatus = AppLoadStatus.idle.obs;
  bool isLookedLeft = false;
  bool isOpenedEye = false;

  final instructions = ['Hãy mở mắt ra nào', 'Vùi lòng nhìn sang bên trái', 'Vui lòng nhìn sang bên phải', 'Hãy cười lên nào'];
  final step = 0.obs;

  final faceDetector = GoogleMlKit.vision.faceDetector(
      const FaceDetectorOptions(
          enableLandmarks: true, enableClassification: true));

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

  Future<void> _initializeCamera() async {
    final camera = await _getCamera(CameraLensDirection.front);
    controllerCamera = CameraController(
      camera,
      defaultTargetPlatform == TargetPlatform.iOS
          ? ResolutionPreset.low
          : ResolutionPreset.medium,
    );
    await controllerCamera?.initialize();
    controllerCamera?.startImageStream((CameraImage image) async {
      // WriteBuffer allBytes;
      // InputImageFormat inputImageFormat;
      // InputImageData inputImageData;
      // if (!isLookedLeft && !isOpenedEye) {
      //   allBytes = WriteBuffer();
      //   for (Plane plane in image.planes) {
      //     allBytes.putUint8List(plane.bytes);
      //   }
      //   final bytes = allBytes.done().buffer.asUint8List();
      //   final planeData = image.planes.map(
      //     (Plane plane) {
      //       return InputImagePlaneMetadata(
      //         bytesPerRow: plane.bytesPerRow,
      //         height: plane.height,
      //         width: plane.width,
      //       );
      //     },
      //   ).toList();
      //
      //   inputImageFormat =
      //       InputImageFormatMethods.fromRawValue(image.format.raw) ??
      //           InputImageFormat.NV21;
      //   inputImageData = InputImageData(
      //     size: Size(image.width.toDouble(), image.height.toDouble()),
      //     imageRotation: InputImageRotation.Rotation_0deg,
      //     inputImageFormat: inputImageFormat,
      //     planeData: planeData,
      //   );
      //   InputImage inputImage =
      //       InputImage.fromBytes(bytes: bytes, inputImageData: inputImageData);
      //   List<Face> faces = await faceDetector.processImage(inputImage);
      //
      //   if(faces.length == 1){
      //     switch (step.value){
      //       case 0: {
      //         if(isOpenEye(faces.first)){
      //           step.value ++;
      //           isOpenedEye = true;
      //         }
      //         break;
      //       }
      //       case 1: {
      //         if(isLookingLeft(faces.first)){
      //           step.value ++;
      //           isLookedLeft = true;
      //         }
      //         break;
      //       }
      //       case 2: {
      //
      //       }
      //     }
      //
      //   }
      // } else {
      //   return;
      // }
    });
  }

  bool isLookingLeft(Face face) {
    // FaceLandmark? noseBase = face.getLandmark(FaceLandmarkType.noseBase);
    // FaceLandmark? leftCheek = face.getLandmark(FaceLandmarkType.leftCheek);
    // FaceLandmark? leftMouth = face.getLandmark(FaceLandmarkType.leftMouth);
    // FaceLandmark? bottomMouth = face.getLandmark(FaceLandmarkType.bottomMouth);
    // print('width' + face.boundingBox.width.toString());
    // print('compare' + (isNearby(noseBase!, leftCheek!, 0.1, face.boundingBox.width)).toString());
    // return (isNearby(noseBase!, leftCheek!, 0.1, face.boundingBox.width)) && (isNearby(leftMouth!, bottomMouth!, 0.1, face.boundingBox.width)) ;
    return (face.headEulerAngleY! > 36);
  }

  bool isLookingRight(Face face) {
    // FaceLandmark? noseBase = face.getLandmark(FaceLandmarkType.noseBase);
    // FaceLandmark? leftCheek = face.getLandmark(FaceLandmarkType.rightCheek);
    // FaceLandmark? leftMouth = face.getLandmark(FaceLandmarkType.rightCheek);
    // FaceLandmark? bottomMouth = face.getLandmark(FaceLandmarkType.bottomMouth);
    // print('width' + face.boundingBox.width.toString());
    // print('compare' + (isNearby(noseBase!, leftCheek!, 0.1, face.boundingBox.width)).toString());
    // return (isNearby(noseBase!, leftCheek!, 0.1, face.boundingBox.width)) && (isNearby(leftMouth!, bottomMouth!, 0.1, face.boundingBox.width)) ;
    return (face.headEulerAngleY! < -36);
  }

  bool isNearby(FaceLandmark obj1, FaceLandmark obj2, double errorTolerance,
      double width) {
    double x = (obj1.position.dx - obj2.position.dx) *
        (obj1.position.dx - obj2.position.dx);
    double y = (obj1.position.dy - obj2.position.dy) *
        (obj1.position.dy - obj2.position.dy);
    double distance = sqrt(x + y);
    print('distance' + distance.toString());
    return (distance < errorTolerance * 1.50 * width);
  }

  bool isOpenEye(Face face){
    return (face.leftEyeOpenProbability! > 0.7) && (face.rightEyeOpenProbability! > 0.7);
  }

  bool isSmile(Face face){
    return (face.smilingProbability! > 0.7);
  }
}
