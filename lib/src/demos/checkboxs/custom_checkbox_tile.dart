import 'package:flutter/material.dart';

class CustomCheckBoxListTile extends StatefulWidget {
  final String titleText;
  final Color normalColor;
  final Color activeColor;
  final IconData? secondary;

  const CustomCheckBoxListTile({
    Key? key,
    required this.titleText,
    required this.normalColor,
    required this.activeColor,
    this.secondary,
  }) : super(key: key);

  @override
  State<CustomCheckBoxListTile> createState() => _CustomCheckBoxListTileState();
}

class _CustomCheckBoxListTileState extends State<CustomCheckBoxListTile> {
  bool _isChecked = false;

  @override
  Widget build(BuildContext context) {
    // Color getColor(Set<MaterialState> states) {
    //   const Set<MaterialState> interactiveStates = <MaterialState>{
    //     MaterialState.pressed, // pressed 상태
    //     MaterialState.hovered, // hover 상태
    //     MaterialState.focused, // focused 상태
    //   };
    //   if (states.any(interactiveStates.contains)) {
    //     return Colors.blue;
    //   }
    //   return Colors.purple;
    // }

    return Theme(
      data: ThemeData(
        unselectedWidgetColor: widget.normalColor, // 체크 안된 상태의 색상
      ),
      child: CheckboxListTile(
        value: _isChecked,
        title: Text(
          widget.titleText,
          style: TextStyle(
              color: _isChecked ? widget.activeColor : widget.normalColor),
        ),
        // 없으면 checkbox 만 나옴
        secondary: Icon(widget.secondary ?? Icons.check,
            color: _isChecked ? widget.activeColor : widget.normalColor),
        controlAffinity: ListTileControlAffinity.trailing, // 오른쪽 checkbox
        activeColor: widget.activeColor, // check 시 색상
        // fillColor: MaterialStateProperty.resolveWith(getColor),
        onChanged: (newValue) {
          setState(() {
            _isChecked = newValue!;
          });
        },
      ),
    );
  }
}