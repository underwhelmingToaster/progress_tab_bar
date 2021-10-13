import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:progress_tab_bar/src/painter.dart';
import '../progress_tab_bar.dart';

class ProgressTabState extends State<ProgressTab> {
  @override
  Widget build(BuildContext context) {
    double size = 200;
    return RawMaterialButton(
      child: CustomPaint(
        size: Size(size,(size*0.3076923076923077).toDouble()),
        painter: ButtonPainter(),
      ),
      onPressed: () { },
    );
  }
}
