import 'package:flutter/material.dart';
import 'package:flutter_ui_demo/src/demos/floating_action_button/quick_action_float_button/quick_action_button.dart';

import 'quick_action.dart';
import 'quick_action_menu_floating_action_button.dart';

/// Quick Action Menu Floating Action Button
class QuickActionMenu extends StatefulWidget {
  final Function() onTap; // Tap 정의
  final IconData icon;
  final Color backgroundColor;
  final Widget child; // 버튼 아래에 표시하는 위젯
  final List<QuickAction> actions; // 메뉴에 표시할 버튼들

  const QuickActionMenu({
    Key? key,
    required this.onTap,
    required this.icon,
    required this.backgroundColor,
    required this.child,
    required this.actions,
  })  : assert(actions.length == 3, 'actions must have 3 items'),
        super(key: key);

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
      alignment: Alignment.bottomRight,
      children: [
        widget.child,
        // quick action button 들을 추가
        ...widget.actions.map(
          (action) => QuickActionButton(
            action: action,
            isOpen: _isOpen,
            totalButtons: 3,
            index: widget.actions.indexOf(action),
            close: _close,
          ),
        ),
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
