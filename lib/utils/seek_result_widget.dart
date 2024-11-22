import 'dart:ui' as UI;
import 'package:flutter/material.dart';

import '../src/app_colors.dart';

class SeekResultWidget extends CustomPainter{
  late int thumbHeight,thumbWidth;
  late double progressTrackHeight= 50;
  double thumbOverLap = .2;
 // late List<ResultProgressItem> progressItemList;
 var progressPaint=Paint()
    ..color = Colors.teal
    ..strokeWidth = 1
    ..strokeCap = StrokeCap.round;

   Paint txtPaint =  Paint()
  ..color = textColorBlack
  ..strokeWidth = 1
  ..strokeCap = StrokeCap.round;
   double totalSpam = 28, min=2, max=30;
  int txtTrackGap = 0;
  double fontSize = 12;
  double currentProgress=18;

 late UI.Image thumb;

 @override
  void paint(Canvas canvas, Size size) {
    thumbHeight = thumb.height;
    thumbWidth = thumb.width;
    double trackerTopY =  double.parse(thumbHeight.toString());
    double trackerBottomY = progressTrackHeight + thumbHeight;
    double lastProgressX = 0;
    double progressItemWidth=0, progressItemRight=0;
    // for (int i = 0; i < progressItemList.length; i++) {
    //   ResultProgressItem progressItem = progressItemList[i];
    //   progressPaint.color=progressItem.color;
    //   progressItemWidth = (progressItem.progressItemPercentage * (size.width / totalSpam));
    //   progressItemRight = lastProgressX + progressItemWidth;
    //   Rect progressRect =  Rect.fromLTRB(lastProgressX, trackerTopY,
    //       progressItemRight, trackerBottomY);
    //   canvas.drawRect(progressRect, progressPaint);
    //   drawText(canvas, progressItem.txtValue, lastProgressX,
    //       trackerBottomY + fontSize + txtTrackGap);
    //   lastProgressX = progressItemRight;
    // }
    double value;
    if(currentProgress<min)
      {
        value=min;
      }else if(currentProgress>max)
    {
      value=max;
    }else {
      value=currentProgress;
    }
    Offset offset=Offset((((value - min) * (size.width / totalSpam)) - thumbWidth / 2)
        , trackerTopY-thumbHeight+(thumbHeight*thumbOverLap));

    canvas.drawImage(thumb ,offset,txtPaint);

  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
  void drawText(Canvas context, String name, double x, double y)
  {
    TextSpan span = TextSpan(
        style: TextStyle(color: colorBlack, fontSize: fontSize,
            fontFamily: 'Roboto'),
        text: name);
    TextPainter tp = TextPainter(
        text: span, textAlign: TextAlign.left, textDirection: TextDirection.ltr);
    tp.layout();
    tp.paint(context, Offset(x, y));
  }

  
}