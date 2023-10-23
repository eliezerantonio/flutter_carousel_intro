import 'package:flutter/material.dart';

class CarouselSlideItem extends StatelessWidget {
  final Widget slide;
  const CarouselSlideItem(this.slide, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(30),
      child: slide,
    );
  }
}
