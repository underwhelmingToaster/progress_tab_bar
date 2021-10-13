import 'package:flutter/cupertino.dart';
import '../progress_tab_bar.dart';

class ProgressTabBarState extends State<ProgressTabBar> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
        width: 600,
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: SizedBox(
            width: 3000,
            height: 100,
            child: stackBuilder(widget.children),
          )

        )
      )

    );
  }

  Stack stackBuilder (List<ProgressTab> tabs) {
    List<Positioned> positionedTabs = new List.empty(growable: true);
    double xPos = 0;
    for (int i = 0; i < tabs.length; i++) {
      positionedTabs.add(
        Positioned(
          left: xPos,
          child: tabs[i]
        )
      );
      xPos += tabs[i].width - 10;
    }

    return Stack(
      children: positionedTabs,
    );
  }
}