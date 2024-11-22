import 'package:flutter/material.dart';

import '../utils/app_constant.dart';
import 'app_colors.dart';
import 'app_font_size.dart';

class MyTxtStyle {

  static TextStyle textFieldText = const TextStyle(
      color: textColorBlack,
      fontSize: 14,
      fontWeight: FontWeight.w500,
      fontFamily: AppConstant.appFontInter);

  static TextStyle textFieldHint = const TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w500,
      color: hintGreyColor,
      fontFamily: AppConstant.appFontInter);

  static TextStyle buttonSelected = const TextStyle(
      fontSize: fontSize16,
      fontWeight: FontWeight.w500,
      color: colorWhite,
      fontFamily: AppConstant.appFontInter);

  static TextStyle buttonUnSelected = const TextStyle(
      fontSize: fontSize16,
      fontWeight: FontWeight.w500,
      color: textColorBlack,
      fontFamily: AppConstant.appFontInter);



  static LinearGradient greyGradient = const LinearGradient(
    colors: <Color>[orangeLight, orangeLight],
  );


  static LinearGradient orangeGradient = const LinearGradient(
    colors: <Color>[colorWhite, colorDrkOrange, colorOrange],
  );



  static TextStyle font48Bold = const TextStyle(
      fontWeight: FontWeight.w600,
      fontFamily: AppConstant.appFontInter,
      fontSize: 24);

  static TextStyle font48Medium = const TextStyle(
      fontWeight: FontWeight.w500,
      fontFamily: AppConstant.appFontInter,
      fontSize: 24);

  static TextStyle font48Regular = const TextStyle(
      fontWeight: FontWeight.w400,
      fontFamily: AppConstant.appFontInter,
      fontSize: 24);

  static TextStyle font18GenW600 = const TextStyle(
      fontWeight: FontWeight.w600,
      fontFamily: AppConstant.appFontInter,
      color: colorsGeneral100,
      fontSize: 18);

  static TextStyle font32Medium = const TextStyle(
      fontWeight: FontWeight.w500,
      fontFamily: AppConstant.appFontInter,
      fontSize: 18);

  static TextStyle font32Regular = const TextStyle(
      fontWeight: FontWeight.w400,
      fontFamily: AppConstant.appFontInter,
      fontSize: 18);

  static TextStyle font24Bold = const TextStyle(
      fontWeight: FontWeight.w600,
      fontFamily: AppConstant.appFontInter,
      fontSize: 16);

  static TextStyle font16w600Gen100 = const TextStyle(
      fontWeight: FontWeight.w600,
      color: colorsGeneral100,
      fontFamily: AppConstant.appFontInter,
      fontSize: 16);

  static TextStyle font16w600Gen10 = const TextStyle(
      fontWeight: FontWeight.w600,
      color: colorsGeneral10,
      fontFamily: AppConstant.appFontInter,
      fontSize: 16);

  static TextStyle font24Medium = const TextStyle(
      fontWeight: FontWeight.w500,
      fontFamily: AppConstant.appFontInter,
      fontSize: 16);

  static TextStyle font20Bold = const TextStyle(
      fontWeight: FontWeight.w600,
      fontFamily: AppConstant.appFontInter,
      fontSize: 15);

  static TextStyle font12w6Gen100 = const TextStyle(
      fontWeight: FontWeight.w600,
      color: colorsGreen100,
      fontFamily: AppConstant.appFontInter,
      fontSize: 12);

  static TextStyle font16BoldGn100 = const TextStyle(
      fontWeight: FontWeight.w600,
      fontFamily: AppConstant.appFontInter,
      color: colorsGeneral100,
      fontSize: 16);

  static TextStyle font20Medium = const TextStyle(
      fontWeight: FontWeight.w500,
      fontFamily: AppConstant.appFontInter,
      fontSize: 15);

  static TextStyle font15GenW500 = const TextStyle(
      fontWeight: FontWeight.w500,
      fontFamily: AppConstant.appFontInter,
      color: colorsGeneral20,
      fontSize: 15);

  static TextStyle font20Regular = const TextStyle(
      fontWeight: FontWeight.w400,
      fontFamily: AppConstant.appFontInter,
      fontSize: 15);

  static TextStyle font13w400Gen70 = const TextStyle(
      fontWeight: FontWeight.w400,
      color: colorsGeneral70,
      fontFamily: AppConstant.appFontInter,
      fontSize: 13);


  static TextStyle font16w400Gen500 = const TextStyle(
      fontWeight: FontWeight.w500,
      color: colorsGeneral70,
      fontFamily: AppConstant.appFontInter,
      fontSize: 16);

  static TextStyle font18Bold = const TextStyle(
      fontWeight: FontWeight.w600,
      fontFamily: AppConstant.appFontInter,
      fontSize: 14);

  static TextStyle font14BoldGen100 = const TextStyle(
      fontWeight: FontWeight.w600,
      color: colorsGeneral100,
      fontFamily: AppConstant.appFontInter,
      fontSize: 14);

  static TextStyle font14BoldPr100 = const TextStyle(
      fontWeight: FontWeight.w400,
      color: colorsPrimary100_2,
      fontFamily: AppConstant.appFontInter,
      fontSize: 14);

  static TextStyle font18Medium = const TextStyle(
      fontWeight: FontWeight.w500,
      fontFamily: AppConstant.appFontInter,
      fontSize: 14);

  static TextStyle font14w500Gen100 = const TextStyle(
      fontWeight: FontWeight.w500,
      color: colorsGeneral100,
      fontFamily: AppConstant.appFontInter,
      fontSize: 14);



  static TextStyle font18Regular = const TextStyle(
      fontWeight: FontWeight.w400,
      fontFamily: AppConstant.appFontInter,
      fontSize: 14);

  static TextStyle font18RegularG4 = const TextStyle(
      fontWeight: FontWeight.w400,
      color: colorsGeneral40,
      fontFamily: AppConstant.appFontInter,
      fontSize: 14);

  static TextStyle font18Gen6G4 = const TextStyle(
      fontWeight: FontWeight.w400,
      color: colorsGeneral60,
      fontFamily: AppConstant.appFontInter,
      fontSize: 14);

  static TextStyle font18RegularG100 = const TextStyle(
      fontWeight: FontWeight.w400,
      color: colorsGeneral100,
      fontFamily: AppConstant.appFontInter,
      fontSize: 14);

  static TextStyle font1Blu4W400 = const TextStyle(
      fontWeight: FontWeight.w400,
      color: colorsBlue100,
      fontFamily: AppConstant.appFontInter,
      fontSize: 14);

  static TextStyle font14Blu4W500 = const TextStyle(
      fontWeight: FontWeight.w500,
      color: colorsBlue100,
      fontFamily: AppConstant.appFontInter,
      fontSize: 14);

  static TextStyle font16Bold = const TextStyle(
      fontWeight: FontWeight.w600,
      fontFamily: AppConstant.appFontInter,
      fontSize: 13);

  static TextStyle font16Medium = const TextStyle(
      fontWeight: FontWeight.w500,
      fontFamily: AppConstant.appFontInter,
      fontSize: 13);

  static TextStyle font13w5Gen100 = const TextStyle(
      fontWeight: FontWeight.w500,
      fontFamily: AppConstant.appFontInter,
      color: colorsGeneral100,
      fontSize: 13);

  static TextStyle font10w5Gen100 = const TextStyle(
      fontWeight: FontWeight.w500,
      fontFamily: AppConstant.appFontInter,
      color: colorsGeneral100,
      fontSize: 10);

  static TextStyle font16Regular = const TextStyle(
      fontWeight: FontWeight.w400,
      fontFamily: AppConstant.appFontInter,
      fontSize: 13);



  static TextStyle font14Bold = const TextStyle(
      fontWeight: FontWeight.w600,
      color: colorsGeneral100,
      fontFamily: AppConstant.appFontInter,
      fontSize: 12);

  static TextStyle font14Medium = const TextStyle(
      fontWeight: FontWeight.w500,
      fontFamily: AppConstant.appFontInter,
      fontSize: 12);

  static TextStyle font14Regular = const TextStyle(
      fontWeight: FontWeight.w400,
      fontFamily: AppConstant.appFontInter,
      fontSize: 12);

  static TextStyle font14GenW400 = const TextStyle(
      fontWeight: FontWeight.w400,
      color: colorsGeneral90,
      fontFamily: AppConstant.appFontInter,
      fontSize: 12);

  static TextStyle font12Bold = const TextStyle(
      fontWeight: FontWeight.w600,
      fontFamily: AppConstant.appFontInter,
      fontSize: 11);

  static TextStyle font12Medium = const TextStyle(
      fontWeight: FontWeight.w500,
      fontFamily: AppConstant.appFontInter,
      fontSize: 11);

  static TextStyle font12Regular = const TextStyle(
      fontWeight: FontWeight.w400,
      fontFamily: AppConstant.appFontInter,
      fontSize: 11);



  static TextStyle font11Bold = const TextStyle(
      fontWeight: FontWeight.w600,
      fontFamily: AppConstant.appFontInter,
      fontSize: 10);



  static TextStyle font13w500Gen100 = const TextStyle(
      fontWeight: FontWeight.w500,
      fontFamily: AppConstant.appFontInter,
      color: colorsGeneral100,
      fontSize: 13);

  static TextStyle font11Regular = const TextStyle(
      fontWeight: FontWeight.w400,
      fontFamily: AppConstant.appFontInter,
      fontSize: 10);

  static TextStyle font10RegularG7 = const   TextStyle(
      fontWeight: FontWeight.w400,
      color: colorsGeneral70,
      fontFamily: AppConstant.appFontInter,
      fontSize: 10);
}
