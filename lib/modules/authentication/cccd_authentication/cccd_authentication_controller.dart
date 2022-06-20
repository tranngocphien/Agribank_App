import 'dart:io';

import 'package:agribank_banking/routes/app_routes.dart';
import 'package:agribank_banking/utils/compare.dart';
import 'package:camera/camera.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:google_ml_kit/google_ml_kit.dart';
import 'package:image_picker/image_picker.dart';

import '../../../app_theme.dart';
import '../../../utils/enums.dart';

class CccdAuthenticationController extends GetxController {
  String inputName = '';
  String inputIdentity = '';

  CameraController? controllerCamera;

  final loadStatus = AppLoadStatus.idle.obs;
  XFile? image;

  final textDetector = GoogleMlKit.vision.textDetector();

  @override
  void onInit() async {
    // TODO: implement onInit
    loadStatus(AppLoadStatus.loading);
    await _initializeCamera();
    inputName = Get.arguments[0];
    inputIdentity = Get.arguments[1];
    loadStatus(AppLoadStatus.success);
    super.onInit();
  }

  @override
  void onClose() async {
    await controllerCamera!.dispose();
    super.onClose();
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
      await extractData();
    }
  }

  Future<void> pickImage() async {
    final ImagePicker _picker = ImagePicker();
    image = await _picker.pickImage(source: ImageSource.gallery);
    await extractData();
  }

  Future<void> extractData() async {
    RegExp regExp = RegExp(r'^[0-9]*$');
    String numberIdentify = '';
    String name = '';

    final inputImage = InputImage.fromFilePath(image!.path);
    final RecognisedText recognisedText =
        await textDetector.processImage(inputImage);
    print(recognisedText.text);
    for (TextBlock block in recognisedText.blocks) {
      for (TextLine line in block.lines) {
        if (line.text.toUpperCase() == line.text) {
          name = line.text;
        }
        for (TextElement element in line.elements) {
          if (element.text.length == 12 && regExp.hasMatch(element.text)) {
            numberIdentify = element.text;
          }
        }
      }
    }


    bool check = checkData(inputName, name, inputIdentity, numberIdentify);
    if(check){
        showMessage('Đăng ký tài khoản thành công');
        Get.back();
        Get.toNamed(AppRoutes.faceAuthentication, arguments: image);
    }
    else {
      if(await getBrightNess() < 40){
        showMessage('Ảnh quá tối');
      }
      else {
        if( !await detectObject() ){
          showMessage('Ảnh chụp bị méo hoặc mất góc');
        }
        else {
          showMessage('Thông tin đăng ký không giống với CCCD');
        }

      }
    }
  }

  Future<void> _initializeCamera() async {
    final camera = await _getCamera(CameraLensDirection.back);
    controllerCamera = CameraController(
      camera,
      defaultTargetPlatform == TargetPlatform.iOS
          ? ResolutionPreset.low
          : ResolutionPreset.medium,
    );
    await controllerCamera?.initialize();
  }

  bool checkData(String inputName, String recogName, String inputCCCD, String recogCCCd){
    return LongestCommonSubString.getSimilarity(inputName, recogName) > 0.9 && LongestCommonSubString.getSimilarity(inputCCCD, recogCCCd) > 0.9;
  }

  void showMessage(String message){
    Get.dialog(
      CupertinoAlertDialog(
        content: Container(
          width: width * 0.8,
          color: white,
          padding: EdgeInsets.all(width16),
          child: Center(
            child: Text(
              message,
              style: Styles.baseNotoSansTS.copyWith(
                fontSize: 18,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ),
      ),
    );

  }

  Future<double> getBrightNess() async{
    final img = File(image!.path);

    final pixels = img.readAsBytesSync();
    double colorSum = 0;

    for (int i = 0; i < pixels.length; i++) {
      int pixel = pixels[i];
      int b = (pixel & 0x00FF0000) >> 16;
      int g = (pixel & 0x0000FF00) >> 8;
      int r = (pixel & 0x000000FF);
      final avg = (r + g + b) / 3;
      colorSum += avg;
    }
    return colorSum/ pixels.length;
  }

  Future<bool> detectObject() async {
    final options = ObjectDetectorOptions(trackMutipleObjects: false);
    final objectDetector = GoogleMlKit.vision.objectDetector(options);

    final inputImage = InputImage.fromFilePath(image!.path);

    final List<DetectedObject> objects = await objectDetector.processImage(inputImage);

    bool res = false;

    for(DetectedObject detectedObject in objects){
      final rect = detectedObject.getBoundinBox();
      double ratio = (rect.topLeft - rect.topRight).distance / (rect.bottomLeft - rect.bottomRight).distance ;
      if(rect.width/ rect.height > 1.4 && rect.width/rect.height < 1.8 &&  ratio < 1.1 && ratio > 0.9){
        res = true;
      }
    }

    return res;
  }
}
