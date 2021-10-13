library progress_tab_bar;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:progress_tab_bar/src/progress_tab.dart';
import 'package:progress_tab_bar/src/tab_bar.dart';

class ProgressTabBar extends StatefulWidget {
  final List<ProgressTab> children;

  const ProgressTabBar({
    Key? key,
    required this.children,
  }) : super(key: key);
  @override
  ProgressTabBarState createState() => ProgressTabBarState();
}


class ProgressTab extends StatefulWidget {
  final double width;

  const ProgressTab({
    Key? key,
    this.width = 200,
  }) : super(key: key);
  @override
  ProgressTabState createState() => ProgressTabState();
}


