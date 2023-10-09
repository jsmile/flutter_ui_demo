import 'package:flutter/material.dart';

import 'image_widget.dart';

class BasicSliver extends StatelessWidget {
  static const String routeName = '/BasicSliver';

  const BasicSliver({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            // title: const Text('Sliver Flixible Title'),  FlexibleSpaceBar 에서 대신함
            centerTitle: true, // Title 중앙 정렬
            expandedHeight: 200.0, // 최대 확장 높이
            backgroundColor: Colors.blue[200], // AppBar 배경색
            actions: [
              // title 오른쪽에 위치할 위젯들
              IconButton(onPressed: () {}, icon: const Icon(Icons.settings)),
              // const SizedBox(width: 10.0),
            ],
            floating: true, // 상향 스크롤 시 AppBar 를 바로 보여줌( floating ).
            pinned: true, // 스크롤 시 AppBar 를 숨기지 않음( pinned ).
            flexibleSpace: FlexibleSpaceBar(
              background: Image.network(
                'https://source.unsplash.com/random?monochromatic+dark',
                fit: BoxFit.cover,
              ),
              // 이미지 고정(pin), 자동 축소( parallax )
              collapseMode: CollapseMode.parallax,
              title: const Text('Sliver Flixible Title'),
              centerTitle: true, // Title 중앙 정렬
            ),
          ),
          buildImage(),
        ],
      ),
    );
  }

  Widget buildImage() {
    return SliverToBoxAdapter(
        child: GridView.builder(
      gridDelegate:
          const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      itemCount: 20,
      itemBuilder: (context, index) => ImageWidget(index: index),
      primary: false,
      shrinkWrap: true,
    ));
  }
}
