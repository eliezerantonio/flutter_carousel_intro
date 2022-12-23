import 'package:flutter/material.dart';

import 'dot.dart';

class Dots extends StatelessWidget {
  const Dots(
      {Key? key,
      required this.totalSlides,
      required this.dotsCurve,
      this.height,
      this.width})
      : super(key: key);
  final int totalSlides;
  final Curve dotsCurve;
  final double? height;
  final double? width;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? double.infinity,
      height: height ?? 70,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(
            totalSlides, (index) => Dot(index: index, dotsCurve: dotsCurve)),
      ),
    );
  }
}
