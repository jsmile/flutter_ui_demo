import 'dart:math';

import 'package:flutter/material.dart';

const Duration _duration = Duration(milliseconds: 300);

class ExpandableFab extends StatefulWidget {
  final double distance;
  final List<Widget> children;

  const ExpandableFab({
    Key? key,
    required this.distance,
    required this.children,
  }) : super(key: key);

  @override
  _ExpandableFabState createState() => _ExpandableFabState();
}

class _ExpandableFabState extends State<ExpandableFab>
    with SingleTickerProviderStateMixin {
  bool _open = false;
  late AnimationController _controller;
  late Animation<double> _expandAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      value: _open ? 1.0 : 0.0,
      duration: _duration,
      vsync: this,
    );
    _expandAnimation =
        CurvedAnimation(parent: _controller, curve: Curves.fastOutSlowIn);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: Stack(
        alignment: Alignment.bottomRight,
        children: [
          _buildTabToCloseFab(),
          _buildTabToOpenFab(),
        ]..insertAll(0, _buildExpandableActionButton()), // 맨 앞에 추가
      ),
    );
  }

  List<_ExpandableActionButton> _buildExpandableActionButton() {
    List<_ExpandableActionButton> animChildren = [];
    final count = widget.children.length;
    final double gap = 90.0 / (count - 1); // 각 버튼 사이의 각도 차이

    for (int i = 0; i < count; i++) {
      final degree = i * gap;
      animChildren.add(
        _ExpandableActionButton(
          distance: widget.distance,
          degree: degree,
          progress: _expandAnimation,
          child: widget.children[i],
        ),
      );
    }

    return animChildren;
  }

  AnimatedContainer _buildTabToCloseFab() {
    return AnimatedContainer(
      duration: _duration,
      transformAlignment: Alignment.center,
      transform: Matrix4.rotationZ(_open ? 0 : pi / 4),
      child: FloatingActionButton(
        backgroundColor: Colors.white,
        onPressed: toggle,
        child: Icon(
          Icons.close,
          color: Theme.of(context).primaryColor,
        ),
      ),
    );
  }

  AnimatedContainer _buildTabToOpenFab() {
    return AnimatedContainer(
      duration: _duration,
      transformAlignment: Alignment.center,
      transform: Matrix4.rotationZ(_open ? 0 : pi / 4),
      child: AnimatedOpacity(
        duration: _duration,
        opacity: _open ? 0.0 : 1.0,
        child: FloatingActionButton(
          onPressed: toggle,
          child: const Icon(Icons.close),
        ),
      ),
    );
  }

  void toggle() {
    _open = !_open;
    setState(() {
      if (_open) {
        _controller.forward();
      } else {
        _controller.reverse();
      }
    });
  }
}

class _ExpandableActionButton extends StatelessWidget {
  final double distance;
  final double degree;
  final Animation<double> progress;
  final Widget child;

  const _ExpandableActionButton({
    Key? key,
    required this.distance,
    required this.degree,
    required this.progress,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: progress,
      child: child,
      builder: (BuildContext context, Widget? child) {
        final offset = Offset.fromDirection(
            degree * (pi / 180.0), progress.value * distance);
        return Positioned(
          right: offset.dx + 4,
          bottom: offset.dy + 4,
          child: child!, // AnimatedBuilder의 child
        );
      },
    );
  }
}
