import 'package:flutter/material.dart';

/// Quick Action Icon Info
class QuickAction {
  final IconData icon;
  final Color backgroundColor;
  final Color? iconColor;
  final Function() onTap;

  const QuickAction({
    required this.icon,
    this.backgroundColor = Colors.white,
    this.iconColor,
    required this.onTap,
  });
}
