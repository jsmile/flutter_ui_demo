import 'package:flutter/material.dart';
import 'package:flutter_ui_demo/src/demos/floating_action_button/quick_action_float_button/quick_action.dart';
import 'package:flutter_ui_demo/src/demos/floating_action_button/quick_action_float_button/quick_action_button.dart';
import 'package:flutter_ui_demo/src/demos/floating_action_button/quick_action_float_button/quick_action_menu.dart';

class QuickFloatingActionButtonDemo extends StatelessWidget {
  static const String routeName = '/QuickFloatingActionButtonDemo';

  const QuickFloatingActionButtonDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.amber[300],
        body: const Center(
          child: Text('Quick Floating Action Button Demo'),
        ),
        floatingActionButton: QuickActionMenu(
          onTap: () {
            print('Quick Action Menu Tapped');
          },
          icon: Icons.add,
          backgroundColor: Colors.blue,
          actions: [
            QuickAction(
              icon: Icons.access_alarm_rounded,
              onTap: () {
                print('Alarm Tapped');
              },
            ),
            QuickAction(
              icon: Icons.mail_lock_rounded,
              onTap: () {
                print('Mail Tapped');
              },
            ),
            QuickAction(
              icon: Icons.phone_android_rounded,
              onTap: () {
                print('phone Tapped');
              },
            ),
          ],
          // child: const Text('Quick Action Menu'),
          child: const Text('Quick Action Menu'),
        ));
  }
}
