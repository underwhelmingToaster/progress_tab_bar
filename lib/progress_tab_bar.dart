library progress_tab_bar;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:progress_tab_bar/src/progress_tab_button.dart';

class ProgressTabBar extends StatefulWidget {
  final List<ProgressTab> children;
  final double buttonWidth;
  final double? height;
  final double spacing;

  const ProgressTabBar({
    Key? key,
    required this.children,
    this.buttonWidth = 200,
    double? height,
    this.spacing = 15,
  }) : height = height ?? buttonWidth * 0.3076923076923077, super(key: key);

  @override
  _ProgressTabBarState createState() => _ProgressTabBarState();
}

class _ProgressTabBarState extends State<ProgressTabBar> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: SizedBox(
            child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: SizedBox(
                  width: calculateLength(widget),
                  height: widget.height,
                  child: stackBuilder(buttonBuilder(widget.children, widget.buttonWidth, widget.height), widget.spacing),
                )

            )
        )

    );
  }

  List<ProgressTabButton> buttonBuilder (List<ProgressTab> tabs, double width, double? height) {
    List<ProgressTabButton> tabButtons = List.empty(growable: true);
    for(ProgressTab tab in tabs){
      tabButtons.add(
        ProgressTabButton(
          width: width,
          height: height,
          onPressed: tab.onPressed,
          label: tab.label,
        )
      );
    }
    return tabButtons;
  }

  Stack stackBuilder (List<ProgressTabButton> tabButtons, double buttonSpacing) {
    List<Positioned> positionedTabs = new List.empty(growable: true);
    double xPos = 0;
    for (int i = 0; i < tabButtons.length; i++) {
      positionedTabs.add(
          Positioned(
              left: xPos,
              child: tabButtons[i]
          )
      );
      xPos += tabButtons[i].width - 31 + buttonSpacing;
    }
    return Stack(
      children: positionedTabs,
    );
  }

  double calculateLength (ProgressTabBar widget) {
    return widget.children.length * (widget.buttonWidth - 25 + widget.spacing);
  }


}

class ProgressTab {
  String? label;
  VoidCallback onPressed;

  ProgressTab({
    required this.onPressed,
    this.label,
  });
}


