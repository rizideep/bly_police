import 'package:flutter/material.dart';

class CustomLoading extends StatelessWidget {
  const CustomLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
        // color:  greyDrkExLight,
        width: double.infinity,
        height: double.infinity,
        child: Center(
            child: CircularProgressIndicator(
          strokeWidth: 2.5,
        )));
  }
}
