import 'package:flutter_shapes/flutter_shapes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ButtonPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint arrow = new Paint()
    ..color = Color.fromARGB(255, 33, 150, 243)
    ..style = PaintingStyle.fill
    ..strokeWidth = 1.0;

    Path arrowPath = Path();
    arrowPath.moveTo(0,0);
    arrowPath.lineTo(size.width*0.1538462,size.height*0.5000000);
    arrowPath.lineTo(0,size.height);
    arrowPath.lineTo(size.width*0.8461538,size.height);
    arrowPath.lineTo(size.width,size.height*0.5000000);
    arrowPath.lineTo(size.width*0.8461538,0);

    canvas.drawPath(arrowPath, arrow);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    throw UnimplementedError();
  }
}
