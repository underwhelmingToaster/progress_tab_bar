library progress_tab_bar;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:progress_tab_bar/src/painter.dart';

class ProgressTabBar extends StatefulWidget {
  const ProgressTabBar({Key? key}) : super(key: key);

  @override
  _ProgressTabBarState createState() => _ProgressTabBarState();
}

class _ProgressTabBarState extends State<ProgressTabBar> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}

class ProgressTab extends StatefulWidget {
  const ProgressTab({Key? key}) : super(key: key);

  @override
  _ProgressTabState createState() => _ProgressTabState();

}

class _ProgressTabState extends State<ProgressTab> {
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

