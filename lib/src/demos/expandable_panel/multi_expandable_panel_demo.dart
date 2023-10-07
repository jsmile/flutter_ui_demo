import 'package:flutter/material.dart';

// import '../../ansi_color.dart';
import 'item.dart';

class MultiExpandablePanelDemo extends StatefulWidget {
  static const String routeName = '/expandableMultiPanelDemo';

  const MultiExpandablePanelDemo({super.key});

  @override
  State<MultiExpandablePanelDemo> createState() =>
      _MultiExpandablePanelDemoState();
}

class _MultiExpandablePanelDemoState extends State<MultiExpandablePanelDemo> {
  static const loremIpsum =
      'The placeholder text, beginning with the line “Lorem ipsum dolor sit amet, consectetur adipiscing elit”, looks like Latin because in its youth, centuries ago, it was Latin.';

  List<Item> items = [
    Item(
        header: 'panel1',
        body: 'panel 1 ${_MultiExpandablePanelDemoState.loremIpsum}'),
    Item(
        header: 'panel2',
        body: 'panel 2 ${_MultiExpandablePanelDemoState.loremIpsum}'),
    Item(
        header: 'panel3',
        body: 'panel 3 ${_MultiExpandablePanelDemoState.loremIpsum}'),
    Item(
        header: 'panel4',
        body: 'panel 4 ${_MultiExpandablePanelDemoState.loremIpsum}'),
    Item(
        header: 'panel5',
        body: 'panel 5 ${_MultiExpandablePanelDemoState.loremIpsum}'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Expansion Mulit Panel List Demo'),
      ),
      body: SingleChildScrollView(
        child: ExpansionPanelList(
          expansionCallback: (int index, bool isExpanded) => setState(() {
            items[index].isExpanded = isExpanded;
          }),
          children: items
              .map(
                (item) => ExpansionPanel(
                  canTapOnHeader: true, // tile can be tapped
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
                  isExpanded: item.isExpanded,
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}

// class Item2 {
//   final String header;
//   final String body;
//   bool isExpanded;

//   Item2({
//     required this.header,
//     required this.body,
//     this.isExpanded = false,
//   });

//   @override
//   String toString() =>
//       'Item(header: $header, body: $body, isExpanded: $isExpanded)';
// }
