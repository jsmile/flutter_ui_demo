import 'package:flutter/material.dart';

import '../../ansi_color.dart';
import 'checkbox_state.dart';

class CustomGroupCheckboxListTile extends StatefulWidget {
  final CheckboxState checkboxState;

  /// 그룹으로 묶을 체크박스 리스트
  final List<CheckboxState> checkboxStates;
  final Color normalColor;
  final Color activeColor;
  final IconData? secondary;

  const CustomGroupCheckboxListTile({
    Key? key,
    required this.checkboxState,
    required this.checkboxStates,
    required this.normalColor,
    required this.activeColor,
    this.secondary,
  }) : super(key: key);

  @override
  State<CustomGroupCheckboxListTile> createState() =>
      _CustomGroupCheckboxListTileState();
}

class _CustomGroupCheckboxListTileState
    extends State<CustomGroupCheckboxListTile> {
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
    // WEB 에서 Mouse 이벤트에 따른 색상 변경을 위한 함수
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
        value: _isChecked,
        title: Text(
          widget.checkboxState.label,
          style: TextStyle(
            color: getCheckStateColor(_isChecked),
          ),
        ),
        // 없으면 checkbox 만 나옴
        secondary: Icon(
          widget.secondary ?? Icons.check,
          color: getCheckStateColor(_isChecked),
        ),
        controlAffinity: ListTileControlAffinity.trailing, // 오른쪽 checkbox
        activeColor: widget.activeColor, // check 시 색상
        // fillColor: MaterialStateProperty.resolveWith(getColor), // WEB 동작
        onChanged: toggleCheckboxGroup,
      ),
    );
  }

  void toggleCheckboxGroup(bool? newValue) {
    setState(() {
      _isChecked = newValue!;
      for (var checkboxState in widget.checkboxStates) {
        checkboxState.isChecked = false;
      }
    });
  }
}
