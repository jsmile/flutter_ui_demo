import 'package:flutter/material.dart';

import 'item.dart';

class ExpandablePanelDemo extends StatelessWidget {
  static const String routeName = '/expandablePanelDemo';

  static const loremIpsum =
      'The placeholder text, beginning with the line “Lorem ipsum dolor sit amet, consectetur adipiscing elit”, looks like Latin because in its youth, centuries ago, it was Latin.';

  final List<Item> items = [
    Item(header: 'panel1', body: 'panel 1 $loremIpsum'),
    Item(header: 'panel2', body: 'panel 2 $loremIpsum'),
    Item(header: 'panel3', body: 'panel 3 $loremIpsum'),
    Item(header: 'panel4', body: 'panel 4 $loremIpsum'),
    Item(header: 'panel5', body: 'panel 5 $loremIpsum'),
  ];

  ExpandablePanelDemo({super.key}); // const 로 초기화되지 않았으므로 생성자의 const 제거

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Expansion Panel List Demo'),
      ),
      body: SingleChildScrollView(
        child: ExpansionPanelList.radio(
          children: items
              .map(
                (item) => ExpansionPanelRadio(
                  value: item.header,
                  headerBuilder: (context, isExpanded) {
                    return ListTile(
                      title: Text(item.header),
                      titleTextStyle: TextStyle(
                        color: Colors.blue[400],
                        fontSize: 18.0,
                      ),
                    );
                  },
                  body: ListTile(
                    title: Text(item.body),
                    titleTextStyle: TextStyle(
                      color: Colors.grey[700],
                      fontSize: 18.0,
                    ),
                  ),
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
