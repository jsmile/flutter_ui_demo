import 'package:flutter/material.dart';

import '../../ansi_color.dart';
import 'checkbox_state.dart';
import 'custom_checkbox_tile.dart';
// import 'custom_group_checkbox_tile.dart';

class CheckBoxDemo extends StatefulWidget {
  static const String routeName = '/CheckBoxDemo';
  const CheckBoxDemo({super.key});

  @override
  State<CheckBoxDemo> createState() => _CheckBoxDemoState();
}

class _CheckBoxDemoState extends State<CheckBoxDemo> {
  bool _checked = false;

  // final bool _isChecked = false;
  final CheckboxState groupCheckboxState = CheckboxState(
    label: 'Checkbox Group',
    value: 'G',
    isChecked: false,
  );

  // CheckboxListTile 들의 Group 으로 묶을 CheckboxState List
  final List<CheckboxState> checkboxStates = [
    CheckboxState(label: 'Home', value: 'H', isChecked: false),
    CheckboxState(label: 'Search', value: 'S', isChecked: false),
    CheckboxState(label: 'Warning', value: 'W', isChecked: false),
  ];

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
          ...checkboxStates.map(
            (checkboxState) => CustomCheckboxListTile(
              checkboxState: checkboxState,
              normalColor: Colors.blue[300]!, // 체크 안된 상태의 색상
              activeColor: Colors.blue, // check 시 색상
              secondary: Icons.beach_access, // 없으면 checkbox 만 나옴
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
