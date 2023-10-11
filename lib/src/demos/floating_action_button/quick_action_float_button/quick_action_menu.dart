import 'package:flutter/material.dart';

import 'quick_action_menu_floating_action_button.dart';

/// Quick Action Menu Floating Action Button
class QuickActionMenu extends StatefulWidget {
  final Function() onTap; // Tap 정의
  final IconData icon;
  final Color backgroundColor;
  final Widget child; // 버튼 아래에 표시하는 위젯

  const QuickActionMenu({
    required this.onTap,
    required this.icon,
    required this.backgroundColor,
    required this.child,
    super.key,
  });

  @override
  State<QuickActionMenu> createState() => _QuickActionMenuState();
}

class _QuickActionMenuState extends State<QuickActionMenu> {
  var _isOpen = false; // 메뉴가 열려있는지 여부

  // open close 에 따른 상태변화 반영
  _open() {
    setState(() {
      _isOpen = true;
    });
  }

  _close() {
    setState(() {
      _isOpen = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        widget.child,
        Padding(
          padding: const EdgeInsets.all(16.0).copyWith(
            bottom: MediaQuery.of(context).padding.bottom + 16.0,
          ),
          child: QuickActionMenuFloatingActionButton(
            open: _open,
            close: _close,
            onTap: widget.onTap,
            isOpen: _isOpen,
            icon: widget.icon,
            backgroundColor: widget.backgroundColor,
          ),
        ),
      ],
    );
  }
}
