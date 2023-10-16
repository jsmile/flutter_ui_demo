import 'package:flutter/material.dart';

import './stateless_radio_list_tile.dart';

/// Radio 를 Stateless Widget 으로 구현하는 예제
class StatelessRadioDemo extends StatefulWidget {
  static const String routeName = '/StatelessRadioDemo';
  const StatelessRadioDemo({super.key});

  @override
  State<StatelessRadioDemo> createState() => _StatelessRadioDemoState();
}

class _StatelessRadioDemoState extends State<StatelessRadioDemo> {
  ProductTypeEnum _groupValue = ProductTypeEnum.downloadable;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stateless Widget Radio Demo'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              StatelessRadioListTile(
                title: ProductTypeEnum.downloadable.name,
                value: ProductTypeEnum.downloadable,
                groupValue: _groupValue,
                color: Colors.purple,
                onChanged: (value) {
                  setState(() {
                    _groupValue = value!;
                  });
                },
              ),
              const SizedBox(width: 10.0),
              StatelessRadioListTile(
                title: ProductTypeEnum.deliverable.name,
                value: ProductTypeEnum.deliverable,
                groupValue: _groupValue,
                color: Colors.blue,
                onChanged: statelessRadioOnChanged,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void statelessRadioOnChanged(value) {
    setState(() {
      _groupValue = value!;
    });
  }
}
