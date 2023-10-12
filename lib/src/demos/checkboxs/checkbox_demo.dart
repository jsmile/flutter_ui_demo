import 'package:flutter/material.dart';

import '../../ansi_color.dart';
import 'custom_checkbox_tile.dart';

class CheckBoxDemo extends StatefulWidget {
  static const String routeName = '/CheckBoxDemo';
  const CheckBoxDemo({super.key});

  @override
  State<CheckBoxDemo> createState() => _CheckBoxDemoState();
}

class _CheckBoxDemoState extends State<CheckBoxDemo> {
  bool _checked = false;
  // final bool _isChecked = false;

  @override
  Widget build(BuildContext context) {
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
          CustomCheckBoxListTile(
            titleText: 'River ?',
            normalColor: Colors.blue[300]!, // 체크 안된 상태의 색상
            activeColor: Colors.blue, // check 시 색상
            // secondary: Icons.beach_access, // 없으면 checkbox 만 나옴
          ),
        ],
      ),
    );
  }
}
