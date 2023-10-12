import 'package:flutter/material.dart';

import 'export_demos.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter UI Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        textTheme: const TextTheme(
          bodyMedium: TextStyle(
            fontSize: 16.0,
            color: Colors.black,
          ),
        ),
      ),
      home: const Home(),
      routes: {
        Home.routeName: (context) => const Home(),
        ExpandablePanelDemo.routeName: (context) => ExpandablePanelDemo(),
        MultiExpandablePanelDemo.routeName: (context) =>
            const MultiExpandablePanelDemo(),
        BasicSliver.routeName: (context) => const BasicSliver(),
        TabBarSliver.routeName: (context) => const TabBarSliver(),
        AdvancedSliver.routeName: (context) => const AdvancedSliver(),
        QuickFloatingActionButtonDemo.routeName: (context) =>
            const QuickFloatingActionButtonDemo(),
        QuickActionMenuTest.routeName: (context) => const QuickActionMenuTest(),
        FabCircularMenuButtonDemo.routeName: (context) =>
            const FabCircularMenuButtonDemo(),
      },
    );
  }
}
