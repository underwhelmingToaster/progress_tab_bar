import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:progress_tab_bar/src/painter.dart';

class ProgressTabButton extends StatelessWidget {
  final double width;
  final double height;
  final VoidCallback onPressed;
  final String label;
  final int position;
  final double outlineWidth;
  final Color labelColor;
  final Color color;
  final bool filled;

  ProgressTabButton(
      {required this.width,
      required this.height,
      required this.onPressed,
      required this.label,
      required this.position,
      required this.outlineWidth,
      required this.labelColor,
      required this.color,
      required this.filled});

  @override
  Widget build(BuildContext context) {
    bool _isFirst = false;
    if (position == 0) {
      _isFirst = true;
    }
    return RawMaterialButton(
      child: CustomPaint(
        isComplex: false,
        size: Size(width, height),
        painter: ButtonPainter(
            label: label,
            isFirst: _isFirst,
            strokeWidth: outlineWidth,
            labelColor: labelColor,
            filled: filled,
            buttonColor: color),
      ),
      onPressed: onPressed,
    );
  }
}
