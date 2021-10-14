library progress_tab_bar;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:progress_tab_bar/src/progress_tab_button.dart';

/// Tab bar which can be used to display a process with multiple sub steps
///
/// Allows the user to better understand process and order of sub steps, as well
/// as progress through and navigate between them easily.
class ProgressTabBar extends StatefulWidget {
  /// [children] contains multiple [ProgressTab]s, which are the individual
  /// tabs inside a ProgressTabBar
  final List<ProgressTab> children;

  /// [tabWidth] controls the width of a singular tab. Gets applied to all
  /// [ProgressTab] in ProgressTabBar
  final double tabWidth;

  /// [height] defines the height of the [ProgressTab] and therefore of the tab
  /// bar as a whole.
  final double height;

  /// [spacing] sets the distance between [ProgressTab]s
  final double spacing;

  const ProgressTabBar({
    Key? key,
    required this.children,
    this.tabWidth = 200,
    double? height,
    this.spacing = 15,
  })  : height = height ?? tabWidth * 0.3076923076923077,
        super(key: key);

  @override
  _ProgressTabBarState createState() => _ProgressTabBarState();
}

class _ProgressTabBarState extends State<ProgressTabBar> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: SizedBox(
          width: _calculateLength(widget),
          height: widget.height,
          child: _stackBuilder(
              _buttonBuilder(widget.children, widget.tabWidth, widget.height),
              widget.spacing),
        ));
  }

  List<ProgressTabButton> _buttonBuilder(
      List<ProgressTab> tabs, double width, double height) {
    List<ProgressTabButton> tabButtons = List.empty(growable: true);
    for (int i = 0; i < tabs.length; i++) {
      tabButtons.add(ProgressTabButton(
        width: width,
        height: height,
        onPressed: tabs[i].onPressed,
        label: tabs[i].label,
        position: i,
      ));
    }
    return tabButtons;
  }

  Stack _stackBuilder(
      List<ProgressTabButton> tabButtons, double buttonSpacing) {
    List<Positioned> positionedTabs = new List.empty(growable: true);
    double xPos = 0;
    for (int i = 0; i < tabButtons.length; i++) {
      positionedTabs.add(Positioned(left: xPos, child: tabButtons[i]));
      xPos += tabButtons[i].width - 31 + buttonSpacing;
    }
    return Stack(
      children: positionedTabs,
    );
  }

  double _calculateLength(ProgressTabBar widget) {
    return widget.children.length * (widget.tabWidth - 25 + widget.spacing);
  }
}

/// The tabs which are inserted into [ProgressTabBar].
///
/// Allows to customize properties that are individual to each tab. Properties
/// that are universal to all tabs inside a [ProgressTabBar] are set there, e.g.
/// button width and height.
class ProgressTab {
  /// [label] customizes the text inside the tab.
  String? label;

  /// [onPressed] defines what happens when pressing one of the tabs.
  VoidCallback onPressed;

  ProgressTab({
    required this.onPressed,
    this.label,
  });
}
