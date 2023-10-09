import 'package:flutter/material.dart';

import '../export_demos.dart';

class Home extends StatelessWidget {
  static const String routeName = '/home';

  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter UI Demo'),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              demoButton(
                context,
                'Expandable Panel Demo',
                ExpandablePanelDemo.routeName,
              ),
              demoButton(
                context,
                'Multi Expandable Panel Demo',
                MultiExpandablePanelDemo.routeName,
              ),
              demoButton(
                context,
                'Basic Sliver Demo',
                BasicSliver.routeName,
              ),
              demoButton(
                context,
                'TabBar Sliver Demo',
                TabBarSliver.routeName,
              ),
              demoButton(
                context,
                'Advancded Sliver Demo',
                AdvancedSliver.routeName,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget demoButton(BuildContext context, String buttonName, String routeName) {
    return Container(
      // height: 30.0,
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      child: FilledButton.tonal(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.blue[200]),
          foregroundColor: MaterialStateProperty.all(Colors.grey[700]),
          side: MaterialStateBorderSide.resolveWith(
            (states) => const BorderSide(
              color: Colors.blue,
              width: 1,
            ),
          ),
        ),
        onPressed: () {
          Navigator.pushNamed(context, routeName);
        },
        child: Text(buttonName),
      ),
    );
  }
}
