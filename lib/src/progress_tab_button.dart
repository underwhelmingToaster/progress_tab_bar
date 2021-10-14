import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:progress_tab_bar/src/painter.dart';

class ProgressTabButton extends StatelessWidget {
  final double width;
  final double? height;
  final VoidCallback onPressed;
  final String? label;

  ProgressTabButton(
      {required this.width, this.height, required this.onPressed, this.label});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: CustomPaint(
        isComplex: false,
        size: Size(width, (height ?? width * 0.3076923076923077).toDouble()),
        painter: ButtonPainter(),
      ),
      onPressed: onPressed,
    );
  }
}
