import 'package:flutter/material.dart';

import '../../ansi_color.dart';
import 'checkbox_state.dart';

class CustomCheckboxListTile extends StatefulWidget {
  final CheckboxState checkboxState;
  final Color normalColor;
  final Color activeColor;
  final IconData? secondary;

  const CustomCheckboxListTile({
    Key? key,
    required this.checkboxState,
    required this.normalColor,
    required this.activeColor,
    this.secondary,
  }) : super(key: key);

  @override
  State<CustomCheckboxListTile> createState() => _CustomCheckboxListTileState();
}

class _CustomCheckboxListTileState extends State<CustomCheckboxListTile> {
  bool? _isChecked;

  @override
  void initState() {
    super.initState();
    _isChecked = widget.checkboxState.isChecked;
    debugPrint(info('###  init _isChecked: $_isChecked'));
    // debugPrint(info('###  init _isChecked: '));
  }

  Color getCheckStateColor(bool? isChecked) {
    // debugPrint(success('### getCheckStateColor isChecked: $isChecked'));
    debugPrint(success('### getCheckStateColor isChecked:'));
    // null 이면 disable
    if (isChecked == null) return Colors.grey[300]!;

    return isChecked ? widget.activeColor : widget.normalColor;
  }

  @override
  Widget build(BuildContext context) {
    // WEB 에서 마우스 이벤트에 따라서 색상을 변경하는 함수
    Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed, // pressed 상태
        MaterialState.hovered, // hover 상태
        MaterialState.focused, // focused 상태
      };
      if (states.any(interactiveStates.contains)) {
        return Colors.blue;
      }
      return Colors.purple;
    }

    return Theme(
      data: ThemeData(
        unselectedWidgetColor: widget.normalColor, // 체크 안된 상태의 색상
      ),
      child: CheckboxListTile(
        value: widget.checkboxState.isChecked,
        title: Text(
          widget.checkboxState.label,
          style: TextStyle(
            color: getCheckStateColor(widget.checkboxState.isChecked),
          ),
        ),
        // 없으면 checkbox 만 나옴
        secondary: Icon(
          widget.secondary ?? Icons.check,
          color: getCheckStateColor(widget.checkboxState.isChecked),
        ),
        controlAffinity: ListTileControlAffinity.leading, // 왼쪽 checkbox
        activeColor: widget.activeColor, // check 시 색상
        // fillColor: MaterialStateProperty.resolveWith(getColor), // WEB 동작
        onChanged: (newValue) {
          setState(() {
            widget.checkboxState.isChecked = newValue!;
            _isChecked = newValue;
          });
        },
      ),
    );
  }
}
