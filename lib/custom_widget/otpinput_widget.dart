import 'package:flutter/material.dart';

import '../src/app_colors.dart';

class OtpInputWidget extends StatelessWidget {
  final TextEditingController controller;
  final bool autoFocus;

  const OtpInputWidget(this.controller, this.autoFocus, {super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 65,
      width: 55,
      child: TextField(
        autofocus: autoFocus,
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        controller: controller,
        maxLength: 1,
        cursorColor: colorOrange,
          style: const TextStyle(color: textColorBlack, fontSize: 18.0,
            fontWeight: FontWeight.w500,),
        decoration: const InputDecoration(
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(
                  Radius.circular(35)),
              borderSide: BorderSide(color: textFieldBorderColor, width: 1.0),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(
                  Radius.circular(35)),
              borderSide: BorderSide(color: textFieldBorderColor, width: 1.0),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(
                  Radius.circular(35)),
              borderSide: BorderSide(color:  textFieldBorderColor, width: 1.0),
            ),
            counter: Offstage(),
        ),
        onChanged: (value) {
          if (value.length == 1) {
            FocusScope.of(context).nextFocus();
          }else {
            FocusScope.of(context).previousFocus();
          }
        },
      ),
    );
  }
}
