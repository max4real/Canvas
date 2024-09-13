import 'dart:math';

import 'package:flutter/material.dart';
import 'package:vector_math/vector_math.dart' as math;

class TicTakToe extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint hashPaint = Paint();
    hashPaint.color = Colors.greenAccent;
    hashPaint.style = PaintingStyle.stroke;
    hashPaint.strokeWidth = 8;
    Paint signPaint = Paint();
    signPaint.color = Colors.blue;
    signPaint.style = PaintingStyle.stroke;
    signPaint.strokeWidth = 3;
    //draw #
    final hash = Path();
    hash.moveTo(100, 0);
    hash.relativeLineTo(0, 300);
    hash.moveTo(200, 0);
    hash.relativeLineTo(0, 300);
    hash.moveTo(0, 100);
    hash.relativeLineTo(300, 0);
    hash.moveTo(0, 200);
    hash.relativeLineTo(300, 0);

    //draw X
    final cross = Path();
    cross.moveTo(25, 25);
    cross.relativeLineTo(50, 50);
    cross.moveTo(75, 25);
    cross.relativeLineTo(-50, 50);

    //draw circle
    const circleRadius = 30.0;
    const circleCenter = Offset(150, 150);

    canvas.drawPath(hash, hashPaint);
    canvas.drawPath(cross, signPaint);
    canvas.drawCircle(circleCenter, circleRadius, signPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    throw UnimplementedError();
  }
}

class Battery extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint blackPaint = Paint();
    blackPaint.color = Colors.black;
    blackPaint.style = PaintingStyle.stroke;
    blackPaint.strokeWidth = 2;
    Paint blackPaintFill = Paint();
    blackPaintFill.color = Colors.black;
    blackPaintFill.style = PaintingStyle.fill;
    blackPaintFill.strokeWidth = 2;
     Paint greenPaint = Paint();
    greenPaint.color = Colors.green;
    greenPaint.style = PaintingStyle.fill;
    greenPaint.strokeWidth = 2;

    var body = RRect.fromLTRBAndCorners(
      50,
      50,
      200,
      130,
      topLeft: const Radius.circular(10),
      topRight: const Radius.circular(10),
      bottomLeft: const Radius.circular(10),
      bottomRight: const Radius.circular(10),
    );
    canvas.drawRRect(body, blackPaint);

    const center = Offset(205, 90);
    final arcRect = Rect.fromCircle(center: center, radius: 13);

    final startAngel = math.radians(90);
    final sweepAngel = math.radians(-180);

    canvas.drawArc(arcRect, startAngel, sweepAngel, true, blackPaintFill);
    
    canvas.drawRRect(_chargeRRect(body), greenPaint);
  }
  double charge = 0.7;
  ValueNotifier <double> chare1 = ValueNotifier(0);

  RRect _chargeRRect(RRect bdr) {
    final left = bdr.left + 5;
    final top = bdr.top + 5;
    final right = bdr.right - 5;
    final bottom = bdr.bottom - 5;
    final height = bottom - top;
    final width = right - left;
    final radius = Radius.circular(height * 0.15);
    final rect = Rect.fromLTWH(left, top, width * charge, height);
    return RRect.fromRectAndRadius(rect, radius);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class FancyPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint myPaint = Paint();
    myPaint.strokeWidth = 3;
    myPaint.color = Colors.blue;
    myPaint.style = PaintingStyle.stroke;

    Paint myPaint_Fill = Paint();
    myPaint_Fill.strokeWidth = 5;
    myPaint_Fill.color = Colors.yellow;
    myPaint_Fill.style = PaintingStyle.fill;

    final path = Path();
    path.moveTo(size.width * 0.5, size.height * 0.2);
    path.relativeLineTo(size.width * 0.3, size.height * 0.4);
    path.relativeLineTo(-size.width * 0.6, 0);
    path.close();

    final square1 = Path();
    // 1
    square1.moveTo(50, 150);
    // 2
    square1.relativeLineTo(100, 0);
    // 3
    square1.relativeLineTo(0, 100);
    // 4
    square1.relativeLineTo(-100, 0);
    // 5
    square1.close();

    const square2 = Rect.fromLTWH(200, 150, 100, 100);

    //draw oval
    const ovalCenter = Offset(250, 250);
    var oval = Rect.fromCenter(center: ovalCenter, width: 50, height: 60);

    // canvas.drawOval(oval, myPaint);
    // canvas.drawPath(hash, myPaint_2);
    // canvas.drawPath(cross, myPaint);

    // //concentric circle
    // var concentricCircleRadius = 50.0;
    // const center = Offset(250, 50);
    // while (concentricCircleRadius > 0) {
    //   canvas.drawCircle(center, concentricCircleRadius, myPaint);
    //   concentricCircleRadius -= 10;
    // }

    //arc
    const center = Offset(150, 150);
    final arcRect = Rect.fromCircle(center: center, radius: 100);

    final startAngel = math.radians(30);
    final sweepAngel = math.radians(300);

    // canvas.drawArc(arcRect, startAngel, sweepAngel, true, myPaint_Fill);

    // const snackCeter =Offset(200, 150);
    // // final snackRect= Rect
    // canvas.drawCircle(snackCeter, 10, myPaint_Fill);
    // canvas.drawCircle(Offset(240, 150), 10, myPaint_Fill);
    // canvas.drawCircle(Offset(280, 150), 10, myPaint_Fill);

    final qCurve1 = Path()
      ..moveTo(50, 150)
      ..relativeQuadraticBezierTo(150, 200, 50, -50);

    final qCurve2 = Path();
    qCurve2.moveTo(140, 250);
    qCurve2.relativeQuadraticBezierTo(100, -300, 70, 50);
    // canvas.drawPath(qCurve1, myPaint);
    // canvas.drawPath(qCurve2, myPaint);

    final cCurve1 = Path()
      ..moveTo(100, 150)
      ..relativeCubicTo(500, -100, -50, -100, 300, 0);
    canvas.drawPath(cCurve1, myPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
