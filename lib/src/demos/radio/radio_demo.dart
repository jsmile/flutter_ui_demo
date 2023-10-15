import 'package:flutter/material.dart';

import '../../ansi_color.dart';

class RadioDemo extends StatefulWidget {
  static const String routeName = '/RadioDemo';

  const RadioDemo({super.key});

  @override
  State<RadioDemo> createState() => _RadioDemoState();
}

class _RadioDemoState extends State<RadioDemo> {
  // int selectedValue = 0; // Radio Group 에서 선택된 Radio 의 value
  int selectedValue = 0; // Radio Group 에서 선택된 Radio 의 value
  var selectRadioTileValue = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Radio Demo')),
        body: Theme(
          data: ThemeData(
            unselectedWidgetColor: Colors.grey[400],
            // data: Theme.of(context).copyWith(
            //   unselectedWidgetColor: Colors.grey[400],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              // 단일 Radio 버튼
              Transform.scale(
                scale: 1.5,
                child: Radio<int>(
                  value: 1, // 개별 Radio 의 value
                  groupValue: selectedValue, // 선택된 Radio 의 value
                  onChanged: (value) {
                    debugPrint(success('### onChanged: $value'));
                    // Radio 의 value 와 groupValue 가 같으면 선택 표시 다르면 비선택 표시
                    setState(() {
                      selectedValue = (selectedValue == value) ? 0 : 1;
                      debugPrint(info('### selectedValue: $selectedValue'));
                    });
                  },
                ),
              ),
              const Divider(),
              // 복수개 RadioListTile Group
              RadioListTile<int>(
                value: 1, // 개별 Radio 의 value
                groupValue: selectRadioTileValue, // 선택된 Radio 의 value
                title: const Text('Mike'),
                onChanged: (value) {
                  // Radio 의 value 와 groupValue 가 같으면 선택 표시 다르면 비선택 표시
                  setState(() {
                    selectRadioTileValue = value!; // 선택된 Radio 의 value 반영
                    showSnackBarMessage(selectRadioTileValue.toString());
                  });
                },
              ),
              RadioListTile<int>(
                value: 2, // 개별 Radio 의 value
                groupValue: selectRadioTileValue, // 선택된 Radio 의 value
                title: const Text('Emma'),
                subtitle: const Text('Creative Director, Photo Stylist'),
                onChanged: (value) {
                  // Radio 의 value 와 groupValue 가 같으면 선택 표시 다르면 비선택 표시
                  setState(() {
                    selectRadioTileValue = value!; // 선택된 Radio 의 value 반영
                    showSnackBarMessage(selectRadioTileValue.toString());
                  });
                },
              ),
              RadioListTile<int>(
                value: 3, // 개별 Radio 의 value
                groupValue: selectRadioTileValue, // 선택된 Radio 의 value
                title: const Text(
                  'Jamee',
                  style: TextStyle(color: Colors.green),
                ),
                subtitle: const Text('Industrial Deginer, Youtuber'),
                secondary: OutlinedButton(
                    child: const Text(
                      'Radio Group 생성',
                      style: TextStyle(color: Colors.green),
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, '/RadioButtonGroup');
                    }),
                activeColor: Colors.green,
                onChanged: (value) {
                  // Radio 의 value 와 groupValue 가 같으면 선택 표시 다르면 비선택 표시
                  setState(() {
                    selectRadioTileValue = value!; // 선택된 Radio 의 value 반영
                    showSnackBarMessage(selectRadioTileValue.toString());
                  });
                },
              ),
            ],
          ),
        ));
  }

  void showSnackBarMessage(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          'selectRadioTileValue : $selectRadioTileValue',
          style: TextStyle(color: Colors.grey[800]),
        ),
        duration: const Duration(seconds: 2),
        backgroundColor: Colors.blue[200]!,
      ),
    );
  }
}
