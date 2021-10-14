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
            padding: const EdgeInsets.only(top: 16, bottom: 8),
            child: ProgressTabBar(
              tabWidth: 150,
              spacing: 20,
              selectedTab: _selectedTab,
              children: [
                ProgressTab(
                    label: "Label 0",
                    onPressed: () {
                      setState(() {
                        _selectedTab = 0;
                      });
                    }),
                ProgressTab(
                    label: "Label 1",
                    onPressed: () {
                      setState(() {
                        _selectedTab = 1;
                      });
                    }),
                ProgressTab(
                    label: "Label 2",
                    onPressed: () {
                      setState(() {
                        _selectedTab = 2;

                      });
                    }),
              ],
            ),
          ),
          const Divider(),
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
      child: Center(child: Text("This is Page Nr. ${tabNr.toString()}")),
    );
  }
}
