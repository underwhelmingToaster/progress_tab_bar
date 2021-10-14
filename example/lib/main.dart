import 'package:flutter/material.dart';
import 'package:progress_tab_bar/progress_tab_bar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Progress Tabs Demo',
      theme: ThemeData(),
      home: const MyHomePage(title: 'Progress Tabs Demo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedTab = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: ProgressTabBar(
              spacing: 16,
              children: [
                ProgressTab(onPressed: () {
                  setState(() {
                    _selectedTab = 0;
                  });
                }),
                ProgressTab(onPressed: () {
                  setState(() {
                    _selectedTab = 1;
                  });
                }),
                ProgressTab(onPressed: () {
                  setState(() {
                    _selectedTab = 2;
                  });
                }),
              ],
            ),
          ),
          Container(
            child: content(_selectedTab),
          ),
        ],
      ),
    );
  }

  Widget content(int tabNr) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 32),
      child: Center(child: Text("This is Tab Nr. ${tabNr.toString()}")),
    );
  }
}
