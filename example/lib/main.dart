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
      theme: ThemeData(primarySwatch: Colors.red),
      home: const MyHomePage(title: 'Progress Tabs Demo'),
      debugShowCheckedModeBanner: false,
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
  bool _disabled = false;

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
              tabWidth: 125,
              height: 64,
              spacing: 20,
              selectedTab: _selectedTab,
              autoScrollOffset: 135,
              disabled: _disabled,
              children: [
                ProgressTab(
                    label: "Step 1",
                    onPressed: () {
                      setState(() {
                        _selectedTab = 0;
                      });
                    }),
                ProgressTab(
                    label: "Step 2",
                    onPressed: () {
                      setState(() {
                        _selectedTab = 1;
                      });
                    }),
                ProgressTab(
                    label: "Step 3",
                    onPressed: () {
                      setState(() {
                        _selectedTab = 2;
                      });
                    }),
                ProgressTab(
                    label: "Step 4",
                    onPressed: () {
                      setState(() {
                        _selectedTab = 3;
                      });
                    }),
                ProgressTab(
                    label: "Step 5",
                    onPressed: () {
                      setState(() {
                        _selectedTab = 4;
                      });
                    }),
                ProgressTab(
                    label: "Step 6",
                    onPressed: () {
                      setState(() {
                        _selectedTab = 5;
                      });
                    }),
                ProgressTab(
                    label: "Step 7",
                    onPressed: () {
                      setState(() {
                        _selectedTab = 6;
                      });
                    }),
                ProgressTab(
                    label: "Step 8",
                    onPressed: () {
                      setState(() {
                        _selectedTab = 7;
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
    return Column(
      children: [
        Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Disable tab progress bar"),
              Checkbox(
                value: _disabled,
                onChanged: (bool? value) {
                  setState(() {
                    _disabled = value ?? false;
                  });
                },
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 32),
          child:
              Center(child: Text("This is Page Nr. ${(++tabNr).toString()}")),
        )
      ],
    );
  }
}
