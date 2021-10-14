library progress_tab_bar;

import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
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

  /// [outlineWidth] sets the size of the outline when a tab is not selected
  final double outlineWidth;

  /// [color] sets the color of the tab-outline as well as the tab color when tab
  /// is selected.
  final Color? color;

  /// [labelColor] defines the color of the text in a not selected tab.
  final Color? labelColor;

  /// [selectedLabelColor] defines the color of the text in a selected tab. Only
  /// has a effect when [selectedTab] is provided.
  final Color selectedLabelColor;

  /// When [selectedTab] is given, the currently selected tab is displayed with
  /// a elevated style.
  final int? selectedTab;

  /// Using [scrollPhysics], the behaviour for scrolling through the tab bar can be configured.
  final ScrollPhysics? scrollPhysics;

  /// Set to false to turn off automatic centering of a tab when it is clicked.
  /// Defaults to true.
  final bool autoCenter;

  /// Sets the duration of the centering animation.
  /// Set to 0 for instant centering. Only takes effect when [autoCenter] is true.
  /// Defaults to 0.6 seconds
  final Duration animationDuration;

  /// Set a [Curve] for the auto center animation.
  /// Only takes effect when [autCenter] is true. Defaults to [Curves.fastOutSlowIn].
  final Curve animationCurve;

  const ProgressTabBar(
      {Key? key,
      required this.children,
      this.tabWidth = 200,
      double? height,
      this.spacing = 15,
      this.outlineWidth = 2,
      this.color,
      this.labelColor,
      this.selectedLabelColor = Colors.white,
      this.selectedTab,
      this.scrollPhysics,
      this.autoCenter = true,
      this.animationDuration = const Duration(milliseconds: 600),
      this.animationCurve = Curves.fastOutSlowIn
      })
      : height = height ?? tabWidth * 0.3076923076923077,
        super(key: key);

  @override
  _ProgressTabBarState createState() => _ProgressTabBarState();
}

class _ProgressTabBarState extends State<ProgressTabBar> {
  ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    if(_scrollController.hasClients){
      if(widget.autoCenter && widget.selectedTab != null && widget.animationDuration != Duration.zero){
        _scrollController.animateTo(_calculateScrollOffset(widget), duration: widget.animationDuration, curve: widget.animationCurve);
      } else if(widget.animationDuration == Duration.zero){
        _scrollController.jumpTo(_calculateScrollOffset(widget));
      }
    }

    return SingleChildScrollView(
        physics: widget.scrollPhysics,
        controller: _scrollController,
        scrollDirection: Axis.horizontal,
        child: SizedBox(
            width: _calculateLength(widget),
            height: widget.height + widget.outlineWidth + 1,
            child: Padding(
              padding: EdgeInsets.only(top: widget.outlineWidth / 2),
              child: _stackBuilder(
                  _buttonBuilder(
                      tabs: widget.children,
                      width: widget.tabWidth,
                      height: widget.height,
                      outlineWidth: widget.outlineWidth,
                      selectedTab: widget.selectedTab,
                      color: widget.color,
                      labelColor: widget.labelColor,
                      selectedLabelColor: widget.selectedLabelColor,
                      context: context),
                  widget.spacing),
            )));
  }

  List<ProgressTabButton> _buttonBuilder(
      {required List<ProgressTab> tabs,
      required double width,
      required double height,
      required double outlineWidth,
      int? selectedTab,
      Color? color,
      Color? labelColor,
      Color? selectedLabelColor,
      required BuildContext context}) {
    List<ProgressTabButton> tabButtons = List.empty(growable: true);
    for (int i = 0; i < tabs.length; i++) {
      bool _filled = false;
      Color _tabLabelColor = labelColor ?? Colors.black;
      if (selectedTab == i) {
        _tabLabelColor = selectedLabelColor ?? _tabLabelColor;
        _filled = true;
      }
      tabButtons.add(ProgressTabButton(
        width: width,
        height: height,
        onPressed: tabs[i].onPressed,
        label: tabs[i].label ?? "",
        position: i,
        outlineWidth: outlineWidth,
        labelColor: _tabLabelColor,
        color: color ?? Theme.of(context).primaryColor,
        filled: _filled,
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
    return widget.children.length * (widget.tabWidth - 20) // Space for tabs
        +
        (widget.children.length - 1) * widget.spacing // Space for spacing
        +
        (widget.tabWidth / 200) * 12; // Space for padding at end
  }

  double _calculateScrollOffset (ProgressTabBar widget){
    return (widget.tabWidth - 31 + widget.spacing) * (widget.selectedTab! - 1);
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
