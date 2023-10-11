import 'package:flutter/material.dart';
import 'quick_action_icon.dart';

/// Menu Floating Action Button
class QuickActionMenuFloatingActionButton extends StatefulWidget {
  final Function() open; // 메뉴를 열 때 호출되는 함수
  final Function() close; // 메뉴를 닫을 때 호출되는 함수
  final Function() onTap; // 메뉴 버튼을 눌렀을 때 호출되는 함수
  final bool isOpen; // 메뉴가 열려있는지 여부

  final IconData icon; // 메뉴 버튼에 표시되는 아이콘
  final Color backgroundColor; // 메뉴 버튼의 배경색

  const QuickActionMenuFloatingActionButton({
    required this.open,
    required this.close,
    required this.onTap,
    required this.isOpen,
    required this.icon,
    required this.backgroundColor,
    super.key,
  });

  @override
  State<QuickActionMenuFloatingActionButton> createState() =>
      _QuickActionMenuFloatingActionButtonState();
}

class _QuickActionMenuFloatingActionButtonState
    extends State<QuickActionMenuFloatingActionButton> {
  final Duration _duration = const Duration(milliseconds: 200); // 애니메이션 시간
  bool _isPressed = false; // 메뉴 버튼이 눌렸는지 여부

  _pressDown() {
    setState(() {
      _isPressed = true;
    });
  }

  _pressUp() {
    setState(() {
      _isPressed = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) => _pressDown(),
      onTapUp: (_) => _pressUp(),
      onTapCancel: () => _pressUp(),
      onTap: () =>
          widget.isOpen ? widget.close() : widget.open(), // menu button toggle
      onLongPress: () {
        if (!widget.isOpen) {
          widget.open();
          _pressUp();
        }
      },
      // AnimatedScale 을 이용하여 메뉴 버튼을 눌렀을 때 크기가 줄어들도록 함.
      child: AnimatedScale(
        scale: _isPressed || widget.isOpen ? 0.8 : 1.0,
        duration: _duration,
        // Menu 버튼 전체에 BoxShadow 효과 추가
        child: Container(
          decoration: const BoxDecoration(
            boxShadow: [
              BoxShadow(
                blurRadius: 2,
                offset: Offset(0, 2),
                color: Colors.black26,
              )
            ],
          ),
          child: getMenuStack(),
        ),
      ),
    );
  }

  // Stack getMenuStack() {
  Widget getMenuStack() {
    return Stack(
      children: [
        // 하위 layer Icon
        QuickActionIcon(
          icon: Icon(
            Icons.close_rounded,
            color: widget.backgroundColor,
            size: 28,
          ),
          backgroundColor: Colors.white,
        ),
        // 상위 layer Icon
        Opacity(
          opacity: widget.isOpen ? 0.0 : 1.0, // open 이면 하위레벨을 가려라
          child: QuickActionIcon(
            icon: Icon(
              widget.icon,
              color: Colors.white,
              size: 28,
            ),
            // 배경색이 하위 버튼의 전경색과 동일하므로 하위 버튼이 숨겨짐.
            backgroundColor: widget.backgroundColor, //
          ),
        ),
      ],
    );
  }
}
