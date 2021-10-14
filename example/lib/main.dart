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
  void _incrementCounter() {
    setState(() {
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(26),
          child: ProgressTabBar(
            spacing: 15,
            children: [
              ProgressTab(
                onPressed: () {}
              ),
              ProgressTab(
                onPressed: () {}
              ),
              ProgressTab(
                onPressed: () {}
              ),
            ]
          ),
        )
      ),
    );
  }
}
