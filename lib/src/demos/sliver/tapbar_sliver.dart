import 'package:flutter/material.dart';

import 'image_widget.dart';

class TabBarSliver extends StatelessWidget {
  static const String routeName = '/TabBarSliver';

  const TabBarSliver({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        length: 2,
        child: NestedScrollView(
          // NestedScrollView의 float 와 pinned 의 동작이 CustomScrollView 와 다름
          // float: 스크롤 시 title 이 사라짐(true) / 고정(false)
          // pinned: 스크롤 시 TabBar 고정(true) / 사라짐(false)
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
            const SliverAppBar(
              title: Text('TabBar Sliver'),
              centerTitle: true,
              floating: true, // 스크롤 시 title 이 사라짐(true) / 고정(false)
              pinned: false, // 스크롤 시 TabBar 고정(true) / 사라짐(false)
              bottom: TabBar(
                tabs: [
                  Tab(icon: Icon(Icons.map), text: 'tab 1'),
                  Tab(icon: Icon(Icons.portrait), text: 'tab 2'),
                ],
              ),
            ),
          ],
          body: TabBarView(
            children: [
              buildImage(),
              buildImage(),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildImage() {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, // 2개 열의 그리드
      ),
      itemCount: 20,
      itemBuilder: (context, index) => ImageWidget(index: index),
      // true: 스크롤 시 TabBar 가 같이 스크롤 됨 / false: 스크롤 시 TabBar 와 별개로 스크롤 됨
      primary: true,
      shrinkWrap: true,
    );
  }
}
