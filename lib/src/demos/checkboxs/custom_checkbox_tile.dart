import 'package:flutter/material.dart';

import '../../ansi_color.dart';
import 'checkbox_state.dart';

/// 미완의 Test 용 CheckboxListTile
/// - 외부 groupCheckboxState 의 상태가 변경되지 않음.
class CustomCheckboxListTile extends StatefulWidget {
  final CheckboxState checkboxState;
  final Color normalColor; // 체크 안된 상태의 색상
  final Color activeColor; // 체크 된 상태의 색상
  final IconData? secondary; // checkbox 이외의 추가된는 아이콘
  final CheckboxState? groupCheckboxState; // CheckboxListTile 들의 Group
  // Group 에 등록할 CheckboxListTile 들의 State List
  final List<CheckboxState>? checkboxStates;

  const CustomCheckboxListTile({
    Key? key,
    required this.checkboxState,
    required this.normalColor,
    required this.activeColor,
    this.secondary,
    this.groupCheckboxState,
    this.checkboxStates,
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
            // 외부에 선언된 CheckboxState 의 isChecked 를 변경
            widget.checkboxState.isChecked = newValue!;
            // 자신의 isChecked 를 변경
            _isChecked = newValue;
            // 외부에 선언된 groupCheckboxState 변경
            if (widget.groupCheckboxState != null &&
                widget.checkboxStates != null) {
              widget.groupCheckboxState!.isChecked = widget.checkboxStates!
                  .every((checkboxState) => checkboxState.isChecked!);
              debugPrint(warn(
                  '### groupCheckboxState.isChecked: ${widget.groupCheckboxState!.isChecked}'));
            }
          });
        },
      ),
    );
  }
}
