import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';

import '../../src/text_style.dart';

class NoDataWidget extends StatelessWidget {
  final String imagePath, headerText, subString;

  const NoDataWidget(this.imagePath, this.headerText, this.subString,
      {super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(
              imagePath,
              width: 65,
              height: 65,
            ),
            const SizedBox(
              height: 18,
            ),
            Text(
              headerText,
              style: MyTxtStyle.font16w600Gen100,
            ),
            Text(
              subString,
              style: MyTxtStyle.font13w400Gen70,
            ),
          ],
        ),
      ),
    );
  }
}
