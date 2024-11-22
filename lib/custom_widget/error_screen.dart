
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../base/app_callbacks.dart';
import '../src/app_colors.dart';
import '../src/app_font_size.dart';
import '../src/text_style.dart';
import '../utils/app_constant.dart';
import '../utils/getx_storage.dart';
import '../utils/image.dart';

class ErrorScreen extends StatefulWidget {
  final String? errorMessage;
  final int? statusCode;
  final AppErrorCallback appErrorCallback;

  const ErrorScreen(this.appErrorCallback, this.errorMessage, this.statusCode, {super.key});

  @override
  State<ErrorScreen> createState() => _ErrorScreenState();
}

class _ErrorScreenState extends State<ErrorScreen> {
  _ErrorScreenState();

  late String image;
  late String buttonText;
  late int? userType;
  bool isLoading = false;
  var box = GetStorageUtil();


  @override
  void initState() {
    super.initState();
    // userType = box.read(PreferencesConstant.userTYPE);
  }

  @override
  Widget build(BuildContext context) {
    if (widget.errorMessage!.compareTo(AppConstant.slowInternet) == 0) {
      image = AppImages.gymOwlBlck;
      buttonText = AppConstant.gotIT;
    } else {
      image = AppImages.gymOwlBlck;
      buttonText = AppConstant.startOver;
    }
    if (widget.statusCode! == 401 || widget.statusCode! == 402) {
      buttonText = AppConstant.logInAgain;
    }
    return Scaffold(
      body: Align(
        alignment: Alignment.center,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            getMainView(),
            getLogoutButton()
          ],
        ),
      ),
    );
  }

  Widget getMainView( ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(image),
            const SizedBox(
              height: 10,
            ),
            Text(
              AppConstant.ooops,
              textAlign: TextAlign.center,
              style: MyTxtStyle.textFieldText,
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              widget.errorMessage != null
                  ? widget.errorMessage!.isNotEmpty
                  ? widget.errorMessage!
                  : AppConstant.someThingWentWrong
                  : AppConstant.someThingWentWrong,
              style: MyTxtStyle.textFieldText,
              textAlign: TextAlign.center,
            ),

          ],
        ),
        const SizedBox(
          height: 30,
        ),
      ],
    );
  }

  Widget getLogoutButton( ) {
    if(isLoading){
      return const Center(
        child: Padding(
          padding: EdgeInsets.only(right: 30,left: 20),
          child: SizedBox(
            height: 30,
            width: 30,
            child: CircularProgressIndicator(
              strokeWidth: 2.5,
            ),
          ),
        ),
      );
    }else{
      return  ElevatedButton(
          style: ButtonStyle(
            foregroundColor: WidgetStateProperty.all<Color>(colorGrayDark),
            backgroundColor:
            WidgetStateProperty.all<Color>(colorOrange),
            shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                      Radius.circular(appScreenPaddingSecondBottom)),
                )),
          ),
          onPressed: () => {
            setState(() {
              isLoading = true;
            }),
            if (widget.statusCode! == 401 || widget.statusCode! == 402)
              {logOutAction()}
            else
              {
                widget.appErrorCallback.onErrorCall(),
              },

          },
          child: Padding(
            padding: const EdgeInsets.symmetric(
                vertical: 10,
                horizontal: 8),
            child: Text(
              buttonText,
              style: MyTxtStyle.buttonSelected,
            ),
          ));
    }
  }


  logOutAction() async {
  //   if (userType!=null&&userType == PreferencesConstant.userTypeCustomer) {
  //     Workmanager().cancelAll();
  //     _googleSignIn.signOut();
  //   }
  //   await FirebaseMessaging.instance.deleteToken();
  //   box.eraseAll();
  //   moveToLoginPage();
  //   setState(() {
  //     isLoading = false;
  //   });
  // }

  moveToLoginPage() {
    Navigator.pushNamedAndRemoveUntil(context, "login", (r) => false);
  }
}
}
