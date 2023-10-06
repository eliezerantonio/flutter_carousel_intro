import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'slider_model.dart';

class Dot extends StatelessWidget {
  const Dot({
    Key? key,
    required this.index,
    required this.dotsCurve,
    this.scrollDirection = Axis.horizontal,
  }) : super(key: key);
  final int index;
  final Curve dotsCurve;
  final Axis scrollDirection;

  @override
  Widget build(BuildContext context) {
    final slideShowModel = context.watch<SliderModel>();
    final percent = 1 - (slideShowModel.currentPage - index);
    final value = percent.clamp(0.0, 1.0);

    final condition = (slideShowModel.currentPage >= index - 0.5 &&
        slideShowModel.currentPage < index + 0.5);
    final dotSize = condition
        ? slideShowModel.primaryBullet
        : slideShowModel.secondaryBullet;

    double dotWidth = dotSize * sin(pi / 4);
    double dotHeight = dotSize * sin(pi / 4);
    return AnimatedContainer(
      duration: const Duration(milliseconds: 500),
      width: dotWidth,
      alignment: Alignment.center,
      margin: scrollDirection == Axis.horizontal
          ? const EdgeInsets.all(5)
          : const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
      height: dotHeight,
      transformAlignment: Alignment.center,
      transform: Matrix4.identity()..rotateZ(value * 2),
      curve: dotsCurve,
      decoration: BoxDecoration(
        color: condition
            ? slideShowModel.primaryColor
            : slideShowModel.secondaryColor,
        shape: BoxShape.circle,
      ),
    );
  }
}
