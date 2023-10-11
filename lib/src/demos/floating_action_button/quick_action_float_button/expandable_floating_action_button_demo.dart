import 'package:flutter/material.dart';
import 'package:flutter_ui_demo/src/demos/floating_action_button/quick_action_float_button/quick_action_menu.dart';

class QuickFloatingActionButtonDemo extends StatelessWidget {
  static const String routeName = '/QuickFloatingActionButtonDemo';

  const QuickFloatingActionButtonDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.amber,
        body: const Center(
          child: Text('Quick Floating Action Button Demo'),
        ),
        floatingActionButton: QuickActionMenu(
          onTap: () {
            print('Quick Action Menu Tapped');
          },
          icon: Icons.add,
          backgroundColor: Colors.blue,
          child: const Text('Quick Action Menu'),
        ));
  }
}
