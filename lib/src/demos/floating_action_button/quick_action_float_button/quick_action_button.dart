import 'dart:math';

import 'package:flutter/material.dart';

import 'quick_action.dart';
import 'quick_action_icon.dart';

class QuickActionButton extends StatefulWidget {
  final QuickAction action;
  final bool isOpen;
  final int totalButtons; // 버튼의 총 개수
  final int index; //  action button 의 index
  final Function() close; // 버튼을 누르면 다시 닫히도록 함.

  const QuickActionButton({
    Key? key,
    required this.action,
    required this.isOpen,
    required this.totalButtons,
    required this.index,
    required this.close,
  }) : super(key: key);

  @override
  State<QuickActionButton> createState() => _QuickActionButtonState();
}

class _QuickActionButtonState extends State<QuickActionButton> {
  final _radius = 130.0; // 버튼까지의 반지름
  final _offset = 10.0; // 축선에 대한 offset
  // final _toalButtons = 4; // 버튼의 총 개수

  double degreeToRadian(double degree) {
    return pi * degree / 90.0;
    // return pi * degree / 180.0;
  }

  double get _range => 90.0 - _offset; // 버튼이 펼쳐지는 범위
  // double get _alpha =>
  //     (_offset / 2) + // 2 : 축선이 2개이므로
  //     (widget.index *
  //         _range /
  //         (widget.totalButtons - 2)); // 버튼의 각도( 2개의 축선을 제외한 버튼의 개수만큼 나눔)
  double get _alpha => _offset / 2 + widget.index * _range / -2; // 버튼의 각도
  double get _radian => degreeToRadian(_alpha); // 버튼의 각도를 라디안으로 변환

  double get _x => cos(_radian) * _radius; // 버튼의 x 좌표
  double get _y => sin(_radian) * _radius; // 버튼의 y 좌표

  final Duration _duration = const Duration(milliseconds: 250);
  var _isPressed = false;

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
    return AnimatedPositioned(
      // 열면서 버튼을 해당 위치로 이동시킴.
      duration: _duration,
      bottom: widget.isOpen ? _y : 0,
      right: widget.isOpen ? _x : 0,
      curve: Curves.easeOut,
      child: Padding(
        // QuickActionMenu 의 padding 과 일치시키기 위함.
        padding: const EdgeInsets.all(16.0).copyWith(
          bottom: MediaQuery.of(context).padding.bottom + 16.0,
        ),
        child: AnimatedRotation(
          // 버튼이 열리는 동안에 약간의 회전 효과를 줌.
          turns: widget.isOpen ? 0 : 0.1,
          alignment: Alignment.center,
          curve: Curves.easeOut,
          duration: _duration * 1.5,
          child: AnimatedOpacity(
            // 버튼이 열려있을 때만 보이도록 함.
            opacity: widget.isOpen ? 1.0 : 0.0,
            duration: _duration,
            child: AnimatedScale(
              // 버튼이 눌렸을 때 크기가 줄어들도록 함.
              scale: _isPressed ? 0.95 : 1.0,
              duration: _duration,
              child: GestureDetector(
                onTapDown: (_) => _pressDown(),
                onTapUp: (_) => _pressUp(),
                onTapCancel: () => _pressUp(),
                onTap: () {
                  widget.close();
                  widget.action.onTap();
                },
                child: Container(
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        offset: Offset(0, 2),
                        blurRadius: 2,
                      )
                    ],
                  ),
                  child: QuickActionIcon(
                    icon: Icon(
                      widget.action.icon,
                      color: widget.action.iconColor ?? Colors.black,
                      size: 28,
                    ),
                    backgroundColor: widget.action.backgroundColor,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
