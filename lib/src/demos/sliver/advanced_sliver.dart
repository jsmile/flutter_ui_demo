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
    return expandedHeight != oldDelegate.expandedHeight ||
        pined != oldDelegate.pined;
  }

  Widget buildAppBar(double shrinkOffset) {
    return AppBar(
      title: Text(title),
      centerTitle: true,
    );
  }
}
