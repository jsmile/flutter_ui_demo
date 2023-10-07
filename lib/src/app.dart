import 'package:flutter/material.dart';

import 'export_demos.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter UI Demo',
      theme: ThemeData(),
      home: const Home(),
      routes: {
        Home.routeName: (context) => const Home(),
        ExpandablePanelDemo.routeName: (context) => const ExpandablePanelDemo(),
      },
    );
  }
}
