import 'package:flutter/material.dart';

class RadioButtonGroup extends StatefulWidget {
  static const String routeName = '/RadioButtonGroup';

  const RadioButtonGroup({super.key});

  @override
  State<RadioButtonGroup> createState() => _RadioButtonGroupState();
}

class _RadioButtonGroupState extends State<RadioButtonGroup> {
  static const List<String> values = ['Flutter', 'Dart', 'Icon'];
  String? selectedValue = values.first;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Radio Button Group')),
      body: Center(
        child: Theme(
          data: ThemeData(
            unselectedWidgetColor: Colors.green[400],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Divider(),
              // ... 을 붙이면 List<Widget> 을 개별 Widget 으로 변환하여 추가함.
              ...buildRadios(values),
              // ...values.map((e) => buildRadio(e)).toList(),
              const Divider(),
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> buildRadios(List<String> values) {
    return values.map((value) {
      return RadioListTile(
        title: Text(
          value,
          style: TextStyle(
            color: (value == selectedValue) ? Colors.green : Colors.green[400],
          ),
        ),
        value: value,
        groupValue: selectedValue,
        activeColor: Colors.green,
        onChanged: (value) {
          setState(() {
            selectedValue = value;
          });
        },
      );
    }).toList();
  }

  void showSnackBarMessage(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          'selectRadioTileValue : $selectedValue',
          style: TextStyle(color: Colors.grey[800]),
        ),
        duration: const Duration(seconds: 2),
        backgroundColor: Colors.blue[200]!,
      ),
    );
  }
}
