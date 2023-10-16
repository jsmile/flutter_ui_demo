import 'package:flutter/material.dart';

enum ProductTypeEnum { downloadable, deliverable }

/// Radio 를 Stateless Widget 으로 구현하는 예제
/// - Radio 를 StatelessWidget 으로 구현한 다음에
///   StatefulWidget 으로부터
///   생성자의 Parameter 로 setState() 가 반영된 onChange 함수를 받아서 처리하는 방식
class StatelessRadioListTile extends StatelessWidget {
  final String title;
  final ProductTypeEnum value;
  final ProductTypeEnum groupValue;
  final Color? color;
  final void Function(ProductTypeEnum?)? onChanged;

  const StatelessRadioListTile({
    Key? key,
    required this.title,
    required this.value,
    required this.groupValue,
    this.color,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: RadioListTile(
        title: Text(
          title,
          style: TextStyle(color: color),
        ),
        // tileColor: color,
        value: value,
        groupValue: groupValue,
        activeColor: color,
        contentPadding: const EdgeInsets.all(0.0),
        dense: true, // 밀집된 모양
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
          side: BorderSide(color: color!),
        ),
        onChanged: onChanged,
      ),
    );
  }
}
