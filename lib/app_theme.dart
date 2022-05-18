import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

/// Styles
class Styles {
  Styles._();

  /// baseNotoSansTS
  static final baseNotoSansTS = GoogleFonts.inter(
      locale: const Locale('ja', 'JP'),
      fontWeight: FontWeight.normal,
      color: bodyTextColor);

  /// baseRobotoTS
  static final baseRobotoTS = GoogleFonts.roboto(
      locale: const Locale('ja', 'JP'),
      fontWeight: FontWeight.normal,
      color: bodyTextColor);

  /// baseInterTS
  static final baseInterTS = GoogleFonts.inter(
      locale: const Locale('ja', 'JP'),
      fontWeight: FontWeight.normal,
      color: bodyTextColor);

  /// roboto45TS
  static final roboto45TS = baseRobotoTS.copyWith(fontSize: width48);

  /// roboto40TS
  static final roboto40TS = baseRobotoTS.copyWith(fontSize: width40);

  /// roboto28TS
  static final roboto28TS = baseRobotoTS.copyWith(fontSize: width28);

  ///
  static final largeTitleNotoSanTS = baseNotoSansTS.copyWith(fontSize: width26);

  ///
  static final titleRobotoTS = baseRobotoTS.copyWith(fontSize: width24);

  ///
  static final titleNotoSansTS = baseNotoSansTS.copyWith(fontSize: width22);

  ///
  static final subTitleNotoTS = baseNotoSansTS.copyWith(fontSize: width20);

  ///
  static final subTitleRobotoTS = baseRobotoTS.copyWith(fontSize: width20);

  ///
  static final subTitleNotoSansTS = baseNotoSansTS.copyWith(fontSize: width18);

  ///
  static final largeBodyRobotoTS = baseRobotoTS.copyWith(fontSize: width18);

  ///
  static final largeBodyNotoSansTS = baseNotoSansTS.copyWith(fontSize: width16);

  ///
  static final body1RobotoTS = baseRobotoTS.copyWith(fontSize: width16);

  ///
  static final body1NotoSansTS = baseNotoSansTS.copyWith(fontSize: width14);

  ///
  static final body2RobotoTS = baseRobotoTS.copyWith(fontSize: width14);

  ///
  static final body2NotoSansTS = baseNotoSansTS.copyWith(fontSize: width12);

  ///
  static final secondaryBodyRobotoTS = baseRobotoTS.copyWith(fontSize: width12);

  ///
  static final secondaryBodyNotoSansTS =
      baseNotoSansTS.copyWith(fontSize: width10);

  ///
  static final commentBodyRobotoTS = baseRobotoTS.copyWith(fontSize: width10);

  ///
  static final buttonTopRobotoTS =
      baseRobotoTS.copyWith(fontSize: width18, fontWeight: FontWeight.w500);

  ///
  static final buttonTopNotoSansTS =
      baseNotoSansTS.copyWith(fontSize: width16, fontWeight: FontWeight.bold);

  ///
  static final buttonLRobotoTS =
      baseRobotoTS.copyWith(fontSize: width16, fontWeight: FontWeight.w500);

  ///
  static final buttonLNotoSansTS =
      baseNotoSansTS.copyWith(fontSize: width14, fontWeight: FontWeight.bold);

  ///
  static final buttonMRobotoTS =
      baseRobotoTS.copyWith(fontSize: width14, fontWeight: FontWeight.w500);

  ///
  static final buttonMNotoSansTS =
      baseNotoSansTS.copyWith(fontSize: width12, fontWeight: FontWeight.bold);

  ///
  static final buttonSRobotoTS =
      baseRobotoTS.copyWith(fontSize: width12, fontWeight: FontWeight.w500);

  ///
  static final buttonSNotoSansTS =
      baseNotoSansTS.copyWith(fontSize: width10, fontWeight: FontWeight.bold);

  ///
  static final buttonSSRobotoTS =
      baseRobotoTS.copyWith(fontSize: width10, fontWeight: FontWeight.w500);
}

/// Color
///
const Color primary100 = Color(0xFFFEF0D2);
///
const Color primary200 = Color(0xFFFEDDA5);
///
const Color primary300 = Color(0xFFFCC477);
///
const Color primary400 = Color(0xFFF9Ac55);
///
const Color primary500 = Color(0xFFF6851F);
///
const Color primary600 = Color(0xFFD36616);
///
const Color primary700 = Color(0xFFB14B0F);
///
const Color primary800 = Color(0xFF8E3409);
///
const Color primary900 = Color(0xFF762305);

///
const Color orangePrimary = Color(0xFFF6851F);

///
const Color orangeLight = Color(0xFFFFBB52);

///
const Color orangeExtraLight = Color(0xFFFFF7EB);

///
const Color successGreen = Color(0xFF2ECD89);

///
const Color failPink = Color(0xFFF4485D);

/// Gradation Styles
///
const Color warningRed = Color(0xFFF4485D);

///
const Color bodyTextColor = Color(0xFF333333);

///
const Color labelGrey = Color(0xFFaaaaaa);

///
const Color labelDarkGrey = Color(0xFF7C7C7C);

///
const Color unselectedGrey = Color(0xFFD8D8D8);

///
const Color textBack = Color(0xFF3C394F);

///
const EdgeInsets edgeInsetsSymmetric15 = EdgeInsets.symmetric(horizontal: 15);

///　広島PASS
const Color iconBlueColor = Color(0xFF4A95EC);
///
const Color black = Color(0xFF000000);

///
const Color black900 = Color(0xFF1a1a1a);

///
const Color black800 = Color(0xFF333333);

///
const Color black700 = Color(0xFF4d4d4d);

///
const Color black600 = Color(0xFF666666);

///
const Color black500 = Color(0xFF808080);

///
const Color black400 = Color(0xFF999999);

///
const Color black300 = Color(0xFFb3b3b3);

///
const Color black200 = Color(0xFFCCCCCC);

///
const Color black100 = Color(0xFFE5E5E5);

///
const Color black50 = Color(0xFFF2F2F2);

///
const Color black25 = Color(0xFFF9F9F9);

///
const Color white = Color(0xFFFFFFFF);

///
const Color systemBlue = Color(0xFF00FAFF);

///
const Color systemOrangeBrown = Color(0xFFD0763A);

///
const Color systemGreen = Color(0xFF26A212);

///
const Color systemGreen800 = Color(0xFF1B850A);

///
const Color systemRed = Color(0xFFFF3B30);

///
const Color systemOrange = Color(0xFFFF8C00);

final double width = Get.size.width;

final double height = width * 884 / 390;

/// height
const width0 = 0;
final width1 = width / 390;
final width2 = 2 * width1;
final width3 = 3 * width1;
final width4 = 4 * width1;
final width5 = 5 * width1;
final width6 = 6 * width1;
final width7 = 7 * width1;
final width8 = 8 * width1;
final width9 = 9 * width1;
final width10 = 10 * width1;
final width11 = 11 * width1;
final width12 = 12 * width1;
final width13 = 13 * width1;
final width14 = 14 * width1;
final width15 = 15 * width1;
final width16 = 16 * width1;
final width17 = 17 * width1;
final width18 = 18 * width1;
final width20 = 20 * width1;
final width22 = 22 * width1;
final width24 = 24 * width1;
final width25 = 25 * width1;
final width26 = 26 * width1;
final width27 = 27 * width1;
final width28 = 28 * width1;
final width30 = 30 * width1;
final width32 = 32 * width1;
final width34 = 34 * width1;
final width36 = 36 * width1;
final width38 = 38 * width1;
final width40 = 40 * width1;
final width45 = 45 * width1;
final width46 = 46 * width1;
final width48 = 48 * width1;
final width50 = 50 * width1;
final width52 = 52 * width1;
final width56 = 56 * width1;
final width58 = 58 * width1;
final width60 = 60 * width1;
final width61 = 61 * width1;
final width64 = 64 * width1;
final width65 = 65 * width1;
final width66 = 66 * width1;
final width70 = 70 * width1;
final width75 = 75 * width1;
final width78 = 78 * width1;
final width80 = 80 * width1;
final width82 = 82 * width1;
final width84 = 84 * width1;
final width85 = 85 * width1;
final width88 = 88 * width1;
final width90 = 90 * width1;
final width92 = 92 * width1;
final width96 = 96 * width1;
final width95 = 95 * width1;
final width97 = 97 * width1;
final width100 = 100 * width1;
final width101 = 101 * width1;
final width104 = 104 * width1;
final width105 = 105 * width1;
final width108 = 108 * width1;
final width109 = 109 * width1;
final width110 = 110 * width1;
final width113 = 113 * width1;
final width116 = 116 * width1;
final width118 = 118 * width1;
final width120 = 120 * width1;
final width124 = 124 * width1;
final width132 = 132 * width1;
final width134 = 134 * width1;
final width138 = 138 * width1;
final width137 = 137 * width1;
final width140 = 140 * width1;
final width142 = 142 * width1;
final width144 = 144 * width1;
final width150 = 150 * width1;
final width154 = 154 * width1;
final width155 = 155 * width1;
final width162 = 162 * width1;
final width164 = 164 * width1;
final width168 = 168 * width1;
final width180 = 180 * width1;
final width195 = 195 * width1;
final width200 = 200 * width1;
final width210 = 210 * width1;
final width230 = 230 * width1;
final width240 = 240 * width1;
final width255 = 255 * width1;
final width278 = 278 * width1;
final width284 = 284 * width1;
final width343 = 343 * width1;

/// height
const height0 = 0;
final height1 = height / 844;
final height2 = 2 * height1;
final height3 = 3 * height1;
final height4 = 4 * height1;
final height5 = 5 * height1;
final height6 = 6 * height1;
final height7 = 7 * height1;
final height8 = 8 * height1;
final height9 = 9 * height1;
final height10 = 10 * height1;
final height12 = 12 * height1;
final height13 = 13 * height1;
final height14 = 14 * height1;
final height15 = 15 * height1;
final height16 = 16 * height1;
final height17 = 17 * height1;
final height18 = 18 * height1;
final height20 = 20 * height1;
final height22 = 22 * height1;
final height24 = 24 * height1;
final height25 = 25 * height1;
final height26 = 26 * height1;
final height28 = 28 * height1;
final height29 = 29 * height1;
final height32 = 32 * height1;
final height30 = 30 * height1;
final height34 = 34 * height1;
final height35 = 35 * height1;
final height36 = 36 * height1;
final height37 = 37 * height1;
final height40 = 40 * height1;
final height44 = 44 * height1;
final height46 = 46 * height1;
final height48 = 48 * height1;
final height50 = 50 * height1;
final height51 = 51 * height1;
final height52 = 52 * height1;
final height54 = 54 * height1;
final height56 = 56 * height1;
final height57 = 57 * height1;
final height58 = 58 * height1;
final height60 = 60 * height1;
final height62 = 62 * height1;
final height64 = 64 * height1;
final height68 = 68 * height1;
final height70 = 70 * height1;
final height75 = 75 * height1;
final height76 = 76 * height1;
final height77 = 77 * height1;
final height78 = 78 * height1;
final height80 = 80 * height1;
final height82 = 82 * height1;
final height84 = 84 * height1;
final height86 = 86 * height1;
final height88 = 88 * height1;
final height90 = 90 * height1;
final height92 = 92 * height1;
final height95 = 95 * height1;
final height96 = 96 * height1;
final height100 = 100 * height1;
final height108 = 108 * height1;
final height109 = 109 * height1;
final height110 = 110 * height1;
final height116 = 116 * height1;
final height120 = 120 * height1;
final height124 = 124 * height1;
final height130 = 130 * height1;
final height135 = 135 * height1;
final height136 = 136 * height1;
final height144 = 144 * height1;
final height146 = 146 * height1;
final height150 = 150 * height1;
final height153 = 153 * height1;
final height157 = 157 * height1;
final height160 = 160 * height1;
final height164 = 164 * height1;
final height168 = 168 * height1;
final height171 = 171 * height1;
final height175 = 175 * height1;
final height176 = 176 * height1;
final height180 = 180 * height1;
final height190 = 190 * height1;
final height192 = 192 * height1;
final height194 = 194 * height1;
final height196 = 196 * height1;
final height200 = 200 * height1;
final height208 = 208 * height1;
final height212 = 212 * height1;
final height223 = 223 * height1;
final height225 = 225 * height1;
final height236 = 236 * height1;
final height241 = 241 * height1;
final height262 = 262 * height1;
final height280 = 280 * height1;
final height284 = 284 * height1;
final height300 = 300 * height1;
final height320 = 320 * height1;
final height400 = 400 * height1;
