import 'package:flutter/material.dart';
import 'package:flutter_ui_demo/src/demos/sliver/image_widget.dart';

class AdvancedSliver extends StatelessWidget {
  static const String routeName = '/AdvancedSliver';

  const AdvancedSliver({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverPersistentHeader(
            delegate: CustomSliverAppBarDelegate(
              expandedHeight: 200.0,
              pined: true,
            ),
          ),
          buildImage(),
        ],
      ),
    );
  }

  Widget buildImage() {
    // SliverGrid 의 delegate 에서 SliverChildBuilderDelegate 을 사용하여 image widget 반환
    return SliverGrid(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, // 2개의 열
      ),
      delegate: SliverChildBuilderDelegate(
        (context, index) => ImageWidget(index: index),
      ),
    );
  }
}

class CustomSliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  final double expandedHeight;
  final bool pined;

  final String title = 'Advanced Sliver Demo'; // AppBar Title 을 위해 선언

  CustomSliverAppBarDelegate({
    required this.expandedHeight,
    required this.pined,
  });

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset, // 줄어든 크기
    bool overlapsContent, // 스크롤 시 화면에 겹치는지 여부
  ) {
    const size = 60;
    final top = expandedHeight - shrinkOffset - size / 2;

    return Stack(
      fit: StackFit.expand,
      children: [
        buildBackground(shrinkOffset),
        buildAppBar(shrinkOffset),
      ],
    );
  }

  @override
  double get maxExtent => expandedHeight;

  // mimum width
  @override
  double get minExtent => kToolbarHeight + 30.0;

  @override
  bool shouldRebuild(covariant CustomSliverAppBarDelegate oldDelegate) {
    // return expandedHeight != oldDelegate.expandedHeight ||
    //     pined != oldDelegate.pined;
    return true;
  }

  Widget buildAppBar(double shrinkOffset) {
    return Opacity(
      opacity: appear(shrinkOffset), // shrinkOffset 근처에서 가장 불투명
      child: AppBar(
        title: Text(title),
        centerTitle: true,
      ),
    );
  }

  double appear(double shrinkOffset) {
    return shrinkOffset / expandedHeight;
  }

  Widget buildBackground(double shrinkOffset) {
    return Opacity(
      opacity: disappear(shrinkOffset), // shrinkOffset 근처에서 가장 투명
      child: Image.network(
        'https://source.unsplash.com/random?mono+dark',
        fit: BoxFit.cover,
      ),
    );
  }

  // 스크롤 시 배경 이미지가 사라지는 비율
  double disappear(double shrinkOffset) {
    return 1 - shrinkOffset / expandedHeight;
  }
}
