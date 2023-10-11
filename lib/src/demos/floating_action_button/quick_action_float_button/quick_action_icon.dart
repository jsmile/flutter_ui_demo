import 'package:flutter/material.dart';

/// Quick Action Icon
class QuickActionIcon extends StatelessWidget {
  final Icon icon; // 버튼에 표시되는 아이콘
  final Color backgroundColor; // 버튼의 배경색

  const QuickActionIcon({
    required this.icon,
    required this.backgroundColor,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: 60,
      decoration: BoxDecoration(
        color: backgroundColor,
        shape: BoxShape.circle, // 원형버튼 모양
      ),
      clipBehavior: Clip.hardEdge,
      child: Center(
        child: icon,
      ),
    );
  }
}
