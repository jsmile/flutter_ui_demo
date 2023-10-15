import 'package:flutter/material.dart';

import '../../ansi_color.dart';
import 'checkbox_state.dart';
// import 'custom_checkbox_tile.dart';
// import 'custom_group_checkbox_tile.dart';

class CheckBoxDemo extends StatefulWidget {
  static const String routeName = '/CheckBoxDemo';
  const CheckBoxDemo({super.key});

  @override
  State<CheckBoxDemo> createState() => _CheckBoxDemoState();
}

class _CheckBoxDemoState extends State<CheckBoxDemo> {
  bool _checked = false;

  // Group Checkbox 의 상태( CheckboxState )
  final CheckboxState groupCheckboxState = CheckboxState(
    label: 'Checkbox Group',
    value: 'G',
    isChecked: false,
  );

  /// Group 으로 묶고 싶은 CheckboxListTile 들의 CheckboxState List
  final List<CheckboxState> checkboxStates = [
    CheckboxState(label: 'Home', value: 'H', isChecked: false),
    CheckboxState(label: 'Search', value: 'S', isChecked: false),
    CheckboxState(label: 'Warning', value: 'W', isChecked: false),
  ];

  /// checked 이면 activeColor, 아니면 normalColor 반환
  Color getCheckStateColor(
      bool? isChecked, Color normalColor, Color activeColor) {
    // debugPrint(success('### getCheckStateColor isChecked: $isChecked'));
    debugPrint(success('### getCheckStateColor isChecked:'));
    // null 이면 disable
    if (isChecked == null) return Colors.grey[300]!;

    return isChecked ? activeColor : normalColor;
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
      return Colors.red;
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('CheckBox List Demo'),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(12.0),
        children: [
          buildGroupCheckboxTile(
            checkboxState: groupCheckboxState,
            checkboxStates: checkboxStates,
            normalColor: Colors.blue[300]!, // 체크 안된 상태의 색상
            activeColor: Colors.blue, // check 시 색상
            secondary: Icons.group,
          ),
          const Divider(),
          ...checkboxStates.map(
            (checkboxState) => customCheckboxListTile(
              checkboxState: checkboxState,
              normalColor: Colors.blue[300]!, // 체크 안된 상태의 색상
              activeColor: Colors.blue, // check 시 색상
              secondary: Icons.beach_access, // 없으면 checkbox 만 나옴
              // CheckboxListTile 들의 Group
              groupCheckboxState: groupCheckboxState,
              // Group 에 등록할 CheckboxListTile 들의 State List
              checkboxStates: checkboxStates,
            ),
          ),
          const Divider(),
          Theme(
            data: ThemeData(
              unselectedWidgetColor: Colors.purple, // 체크 안된 상태의 색상
            ),
            child: Checkbox(
              value: _checked,
              activeColor: Colors.blue, // check 시 색상
              // fillColor: MaterialStateProperty.resolveWith(getColor),
              onChanged: (newValue) {
                debugPrint(info('### newValue: $newValue'));
                setState(() {
                  _checked = newValue!;
                });
              },
            ),
          ),
        ],
      ),
    );
  }

  Theme customCheckboxListTile({
    required CheckboxState checkboxState, // 외부에 선언된 자신의 CheckboxState
    required Color normalColor, // 체크 안된 상태의 색상
    required Color activeColor, // 체크 된 상태의 색상
    IconData? secondary, // checkbox 이외의 추가된는 아이콘
    CheckboxState? groupCheckboxState, // CheckboxListTile 들의 Group
    List<CheckboxState>? checkboxStates,
  }) {
    return Theme(
      data: ThemeData(
        unselectedWidgetColor: normalColor, // 체크 안된 상태의 색상
      ),
      child: CheckboxListTile(
        value: checkboxState.isChecked,
        title: Text(
          checkboxState.label,
          style: TextStyle(
            color: getCheckStateColor(
                checkboxState.isChecked, normalColor, activeColor),
          ),
        ),
        // 없으면 checkbox 만 나옴
        secondary: Icon(
          secondary ?? Icons.check,
          color: getCheckStateColor(
              checkboxState.isChecked, normalColor, activeColor),
        ),
        controlAffinity: ListTileControlAffinity.leading, // 왼쪽 checkbox
        activeColor: activeColor, // check 시 색상
        // fillColor: MaterialStateProperty.resolveWith(getColor), // WEB 동작
        onChanged: (newValue) {
          setState(() {
            // 외부에 선언된 자신의 CheckboxState 의 isChecked 를 변경
            checkboxState.isChecked = newValue!;
            // 외부에 선언된 groupCheckboxState 변경
            if (groupCheckboxState != null && checkboxStates != null) {
              // 모든 CheckboxListTile 들이 checked 되어야 true
              groupCheckboxState.isChecked = checkboxStates
                  .every((checkboxState) => checkboxState.isChecked!);
            }
          });
        },
      ),
    );
  }

  Theme buildGroupCheckboxTile({
    required CheckboxState checkboxState,
    required List<CheckboxState> checkboxStates,
    required Color normalColor,
    required Color activeColor,
    IconData? secondary,
  }) {
    return Theme(
      data: ThemeData(
        unselectedWidgetColor: normalColor, // 체크 안된 상태의 색상
      ),
      child: CheckboxListTile(
        value: groupCheckboxState.isChecked,
        title: Text(
          checkboxState.label,
          style: TextStyle(
            color: getCheckStateColor(
                checkboxState.isChecked, normalColor, activeColor),
          ),
        ),
        // 없으면 checkbox 만 나옴
        secondary: Icon(
          secondary ?? Icons.check,
          color: getCheckStateColor(
              checkboxState.isChecked, normalColor, activeColor),
        ),
        controlAffinity: ListTileControlAffinity.leading, // 왼쪽 checkbox
        activeColor: activeColor, // check 시 색상
        // fillColor: MaterialStateProperty.resolveWith(getColor), // WEB 동작
        onChanged: toggleCheckboxGroup,
      ),
    );
  }

  void toggleCheckboxGroup(bool? newValue) {
    if (newValue == null) return;

    setState(() {
      groupCheckboxState.isChecked = newValue;
      for (var checkboxState in checkboxStates) {
        debugPrint(info('### group item newValue: $newValue'));
        checkboxState.isChecked = newValue;
      }
    });
  }
}
