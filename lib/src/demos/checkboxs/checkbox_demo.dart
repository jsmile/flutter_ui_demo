import 'package:flutter/material.dart';

import '../../ansi_color.dart';

class CheckBoxDemo extends StatefulWidget {
  static const String routeName = '/CheckBoxDemo';
  const CheckBoxDemo({super.key});

  @override
  State<CheckBoxDemo> createState() => _CheckBoxDemoState();
}

class _CheckBoxDemoState extends State<CheckBoxDemo> {
  bool _checked = false;
  bool _tileChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CheckBox List Demo'),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(12.0),
        children: [
          Checkbox(
            value: _checked,
            activeColor: Colors.blue, // check 시 색상
            onChanged: (newValue) {
              debugPrint(info('### newValue: $newValue'));
              setState(() {
                _checked = newValue!;
              });
            },
          ),
          CheckboxListTile(
            value: _tileChecked,
            title: Text(
              'river ?',
              style:
                  TextStyle(color: _tileChecked ? Colors.blue : Colors.black),
            ),
            // 없으면 checkbox 만 나옴
            secondary: Icon(Icons.beach_access,
                color: _tileChecked ? Colors.blue : Colors.black),
            controlAffinity: ListTileControlAffinity.trailing, // 오른쪽 checkbox
            activeColor: Colors.blue, // check 시 색상
            onChanged: (newValue) {
              debugPrint(info('### newValue: $newValue'));
              setState(() {
                _tileChecked = newValue!;
              });
            },
          ),
        ],
      ),
    );
  }
}
