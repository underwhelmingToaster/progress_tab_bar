import 'dart:ui' as ui;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ButtonPainter extends CustomPainter {
  String label;
  bool isFirst;
  bool filled;
  double strokeWidth;
  Color labelColor;
  Color buttonColor;

  ButtonPainter(
      {this.label = "",
      this.isFirst = false,
      this.filled = false,
      this.strokeWidth = 2,
      this.labelColor = Colors.black,
      required this.buttonColor});

  @override
  void paint(Canvas canvas, Size size) {
    PaintingStyle paintingStyle = PaintingStyle.stroke;

    if (filled) {
      paintingStyle = PaintingStyle.fill;
    }

    Paint arrow = new Paint()
      ..color = buttonColor
      ..style = paintingStyle
      ..strokeWidth = strokeWidth;

    Path arrowPath = Path();
    if (isFirst) {
      arrowPath.moveTo(size.width * 0.08, 0);
      arrowPath.lineTo(size.width * 0.08, size.height);
      arrowPath.lineTo(size.width * 0.85, size.height);
      arrowPath.lineTo(size.width, size.height * 0.5);
      arrowPath.lineTo(size.width * 0.85, 0);
      arrowPath.close();
    } else {
      arrowPath.moveTo(0, 0);
      arrowPath.lineTo(size.width * 0.15, size.height * 0.5);
      arrowPath.lineTo(0, size.height);
      arrowPath.lineTo(size.width * 0.85, size.height);
      arrowPath.lineTo(size.width, size.height * 0.5);
      arrowPath.lineTo(size.width * 0.85, 0);
      arrowPath.close();
    }
    canvas.drawPath(arrowPath, arrow);

    final ui.ParagraphBuilder paragraphBuilder =
        ui.ParagraphBuilder(ui.ParagraphStyle(
      textAlign: TextAlign.start,
      fontSize: 20,
      height: 1,
    ))
          ..pushStyle(ui.TextStyle(color: labelColor))
          ..addText(label);

    final ui.Paragraph paragraph = paragraphBuilder.build()
      ..layout(ui.ParagraphConstraints(
          width: size.width - size.width * (0.15 + 0.15)));
    canvas.drawParagraph(
        paragraph,
        Offset(size.width / 2 - paragraph.longestLine / 2,
            size.height / 2 - paragraph.height / 2));
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
