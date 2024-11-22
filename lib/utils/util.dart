import 'dart:developer' as developer;
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import '../src/app_colors.dart';
import '../src/app_font_size.dart';
import 'app_constant.dart';
import 'getx_storage.dart';
import 'logger.dart';
import 'preferences_constant.dart';

class MyUtil {
  static showToast(String message) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: textColorBlack,
        textColor: colorWhite,
        fontSize: 16.0);
  }

  static showCenterToast(String message) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: textColorBlack,
        textColor: colorWhite,
        fontSize: 16.0);
  }

  static Future<bool> checkConnectivityStatus() async {
    bool activeConnection = false;
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        activeConnection = true;
      }
    } on SocketException catch (_) {
      activeConnection = false;
    }
    return activeConnection;
  }

/*  static initFireBaseToken() async {
    var box = GetStorageUtil();
    String? currentToken = await FirebaseMessaging.instance.getToken();
    if (currentToken != null) {
      debugPrint('token refresh: $currentToken');
      box.wrightBox(PreferencesConstant.fireBaseToken, currentToken);
    }

    FirebaseMessaging.instance.onTokenRefresh.listen((token) async {
      final String? currentToken = box.read(PreferencesConstant.fireBaseToken);
      if (currentToken != token) {
        box.wrightBox(PreferencesConstant.fireBaseToken, token);
      }
    });
  }*/

  static void removeFocus(BuildContext context) {
    FocusScope.of(context).requestFocus(FocusNode());
  }

  static String convertDateFromString(String strDate, String formate) {
    DateTime dateTime = DateTime.parse(strDate);
    return DateFormat(formate).format(dateTime).toString();
  }

  static String convertDateFromStringForServer(String strDate, String format) {
    DateTime date = DateFormat(format, "en_US").parse(strDate);
    final df = DateFormat('yyyy-MM-dd');
    return df.format(date);
  }

  static String convertDateFromStringFormServer(String strDate, String format) {
    DateTime date = DateFormat(format, "en_US").parse(strDate);
    final df = DateFormat('dd MMM yyyy');
    return df.format(date);
  }

  static DateTime dateFromStringForDatePicker(String text) {
    if (text.isEmpty) {
      return DateTime.now();
    }
    DateTime dateTime = DateTime.parse(text);
    return dateTime;
  }

  static String stringForDate(DateTime? dateTime) {
    DateTime date = dateTime!;
    final df = DateFormat('dd MMM yyyy');
    return df.format(date);
  }

  static printWW(String text) {
    if (kDebugMode) {
      // color yellow
      MyLogger.warning(
          "<<<<<<<<<<<<<<<<<<<<<<<<<<<<< MyDebugger >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>");
      MyLogger.warning(text);
    }
  }

  static printV(String text) {
    if (kDebugMode) {
      // color blue
      MyLogger.debug(
          "<<<<<<<<<<<<<<<<<<<<<<<<<<<<< MyDebugger >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>");
      MyLogger.debug(text);
    }
  }

  static printW(String text) {
    if (kDebugMode) {
      // color green
      MyLogger.info(
          "<<<<<<<<<<<<<<<<<<<<<<<<<<<<< Api Response >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>");
      developer.log(text, level: 500);
    }
  }

  static printE(String text) {
    if (kDebugMode) {
      // color red
      MyLogger.info(
          "<<<<<<<<<<<<<<<<<<<<<<<<<<<<< MyDebugger >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>");
      MyLogger.info(text);
    }
  }

  static printI(String text) {
    if (kDebugMode) {
      // color blue
      MyLogger.error(
          "<<<<<<<<<<<<<<<<<<<<<<<<<<<<< MyDebugger >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>");
      MyLogger.error(text);
    }
  }

  static printD(String text) {
    if (kDebugMode) {
      MyLogger.info(
          "<<<<<<<<<<<<<<<<<<<<<<<<<<<<< MyDebugger >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>");
      MyLogger.info(text);
    }
  }

  static showSnackBar(BuildContext context, String text) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          text,
          style: const TextStyle(
              color: colorWhite,
              fontFamily: AppConstant.appFontInter,
              fontWeight: FontWeight.w400,
              fontSize: fontSize13),
        ),
        backgroundColor: colorGrayDark,
      ),
    );
  }

  static hideKeyBoard(BuildContext context) {
    FocusScope.of(context).unfocus();
  }

  static void showSnackBarr(BuildContext context, String msg) {
    MyUtil.showSnackBar(context, msg);
  }

  static moveToDashBoard(
      GetStorageUtil box, BuildContext context, int userType) {
    Navigator.pushNamedAndRemoveUntil(
        context, "common_dashboard", (r) => false);
    box.wrightBox(PreferencesConstant.isUserLogin, true);
  }

  static loadTrainerDashBoard(BuildContext context, String moveScreen) {
    Navigator.pushNamedAndRemoveUntil(context, moveScreen, (r) => false);
  }

  static Future<String> loadImage(String userImageUrl) async {
    // Simulate an asynchronous operation
    await Future.delayed(const Duration(seconds: 4));
    return userImageUrl;
  }

  static String? modifiedPhone(String? phone) {
    if (phone == null || phone.length < 10) {
      return phone;
    }
    return "${phone.substring(0, 4)}XXXX${phone.substring(8, 10)}";
  }

  static String timeAgo(DateTime d) {
    Duration diff = DateTime.now().difference(d);
    if (diff.inDays > 365) {
      return "${(diff.inDays / 365).floor()} ${(diff.inDays / 365).floor() == 1 ? "y" : "ys"}";
    }
    if (diff.inDays > 30) {
      return "${(diff.inDays / 30).floor()} ${(diff.inDays / 30).floor() == 1 ? "m" : "ms"}";
    }
    if (diff.inDays > 7) {
      return "${(diff.inDays / 7).floor()} ${(diff.inDays / 7).floor() == 1 ? "w" : "ws"}";
    }
    if (diff.inDays > 0) {
      return "${diff.inDays} ${diff.inDays == 1 ? "d" : "ds"}";
    }
    if (diff.inHours > 0) {
      return "${diff.inHours} ${diff.inHours == 1 ? "h" : "hs"}";
    }
    if (diff.inMinutes > 0) {
      return "${diff.inMinutes} ${diff.inMinutes == 1 ? "m" : "ms"}";
    }
    return "just now";
  }

  static Widget showNetworkImageWithLoadingErrorWithoutBorder(String? imageUrl,
      double? height, double? width, String placeHolder, BoxFit boxFit) {
    if (imageUrl != null) {
      return getBigImage(imageUrl, height, width, placeHolder, boxFit);
    } else {
      return Image.asset(
        placeHolder,
        isAntiAlias: true,
        height: height,
        width: width,
        fit: boxFit,
      );
    }
  }

  static String getDayWish() {
    String wish;
    DateTime cal = DateTime.now();
    int hour = cal.hour;
    if (hour >= 16) {
      wish = "Good Evening!";
    } else if (hour >= 12) {
      wish = "Good Afternoon!";
    } else {
      wish = "Good Morning!";
    }
    return wish;
  }

  static bool isLogin() {
    var box = GetStorageUtil();
    if (box.read(PreferencesConstant.isUserLogin) &&
        box.read(PreferencesConstant.selectedGymId).toString().isNotEmpty) {
      return true;
    } else {
      return false;
    }
  }

  static String dateFormate(String? s, String current, String required) {
    var formattedDate = "";
    if (s == null) {
      formattedDate = "";
    }
    try {
      formattedDate =
          DateFormat(required).format(DateFormat(current).parse(s!));
    } catch (e) {
      MyUtil.printW("Exceptions in the: $s");
      MyUtil.printW(e.toString());
      formattedDate = "";
    }
    return formattedDate;
  }

  static DateTime getDateTimeFromStringDate(
    String s,
    String dateFormate,
  ) {
    return DateFormat(dateFormate).parse(s);
  }

/*  static Future<void> onTapNotification(NotificationResponse? response) async {
    if (response?.payload == null) return;
    MyUtil.navigateByPayLoad(response!.payload!);
  }*/

/*  static void navigateByNotification(RemoteMessage remoteMessageServer) {
    final box = GetStorageUtil();
    late int userType;
    Map<String, dynamic> notificationData = remoteMessageServer.data;
    String type = notificationData["type"];
    if (notificationData.isNotEmpty && notificationData.containsKey("type")) {
      late Widget movingScreen;
      if (MyUtil.isLogin()) {
        userType = box.read(PreferencesConstant.userTYPE);
        switch (type) {
          case AppConstant.loadDashBoard:
            switch (userType) {
              case PreferencesConstant.userTypeCustomer:
                movingScreen = const UserNotification();
                break;
              case PreferencesConstant.userTypeTrainer:
                movingScreen = const TrainerNotification();
                break;
              case PreferencesConstant.userTypeAdmin:
                movingScreen = const TrainerNotification();
                break;
              default:
                movingScreen = const Splash();
            }
            break;
          case AppConstant.loadFeedBack:
            movingScreen = const FeedbackWidget();
            break;
          default:
            movingScreen = const Splash();
        }
      } else {
        movingScreen = const Splash();
      }
      Navigator.of(NavigationService.navigatorKey.currentContext!)
          .push(MaterialPageRoute(builder: (context) => movingScreen));
    }
  }*/

  static getBigImage(String? imageUrl, double? height, double? width,
      String placeHolder, BoxFit boxFit) {
    if (imageUrl != null && imageUrl.contains("http")) {
      return Image.network(
        imageUrl,
        height: height,
        width: width,
        isAntiAlias: true,
        fit: boxFit,
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) {
            return child;
          } else {
            return SizedBox(
              height: height,
              width: width,
              child: Center(
                child: CircularProgressIndicator(
                  strokeWidth: 2.5,
                  value: loadingProgress.expectedTotalBytes != null
                      ? loadingProgress.cumulativeBytesLoaded /
                          (loadingProgress.expectedTotalBytes ?? 1)
                      : null,
                ),
              ),
            );
          }
        },
        errorBuilder: (context, error, stackTrace) {
          return Image.asset(
            placeHolder,
            height: height,
            width: width,
            isAntiAlias: true,
            fit: boxFit,
          );
        },
      );
    } else {
      return Image.file(
        File(imageUrl!),
        height: height,
        width: width,
        fit: boxFit,
        isAntiAlias: true,
        errorBuilder: (context, error, stackTrace) {
          return Image.asset(
            placeHolder,
            height: height,
            width: width,
            isAntiAlias: true,
            fit: boxFit,
          );
        },
      );
    }
  }
}
