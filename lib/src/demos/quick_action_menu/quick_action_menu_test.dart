import 'package:flutter/material.dart';

import '../../ansi_color.dart';
import './quick_action_menu_exports.dart';

class QuickActionMenuTest extends StatelessWidget {
  static const String routeName = 'QuickActionMenuTest';

  const QuickActionMenuTest({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Quick Action Menu Test'),
      ),
      body: const Center(
        child: Text('Quick Action Menu Test'),
      ),
      floatingActionButton: QuickActionMenu(
        onTap: () {
          debugPrint(info('### 메뉴를 선택했습니다.'));
        },
        icon: Icons.add,
        backgroundColor: Colors.blue,
        actions: [
          QuickAction(
            icon: Icons.mail_outline_rounded,
            onTap: () {
              // displayMessage(context, '메일을 선택했습니다.');
              debugPrint(info('### 메일을 선택했습니다.'));
            },
          ),
          QuickAction(
            icon: Icons.phone_android_outlined,
            onTap: () {
              // displayMessage(context, '전화를 선택했습니다.');
              debugPrint(info('### 전화를 선택했습니다.'));
            },
          ),
          QuickAction(
            icon: Icons.settings_applications_outlined,
            onTap: () {
              // displayMessage(context, '설정을 선택했습니다.');
              debugPrint(info('### 설정을 선택했습니다.'));
            },
          ),
        ],
        child: const Text('Quick Action Menu Test'),
      ),
    );
  }

  void displayMessage(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(message),
      duration: const Duration(seconds: 2),
    ));
  }
}
