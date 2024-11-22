import 'package:flutter/material.dart';
import '../base/app_callbacks.dart';
import '../src/app_colors.dart';
import '../src/app_font_size.dart';
import '../src/text_style.dart';
import '../utils/app_constant.dart';


class NoInternetScreen extends StatelessWidget {
  late AppNetworkCallback appNetworkCallback;

  NoInternetScreen(this.appNetworkCallback, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            // SvgPicture.asset(AppImages.noInternetPlaceholderSVG),
            const Text(
              AppConstant.oooH,

            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              AppConstant.couldNotConnect,
              style: MyTxtStyle.textFieldText,
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 30,
            ),
            ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all<Color>(colorOrange),
                  shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                      const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                        Radius.circular(appScreenPaddingSecondBottom)),
                  )),
                ),
                onPressed: () => {appNetworkCallback.onRetry()},
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 8),
                  child: Text(
                    AppConstant.reTry,
                    style: MyTxtStyle.buttonSelected,
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
