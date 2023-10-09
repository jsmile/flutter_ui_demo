import 'package:flutter/material.dart';

class ImageWidget extends StatelessWidget {
  final int index;

  const ImageWidget({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      width: double.infinity,
      child: Card(
        child: Image.network(
          // 'https://picsum.photos/200/300?random=$index',
          'https://source.unsplash.com/random?sig=$index',
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
