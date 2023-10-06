import 'package:flutter/material.dart';
import 'dot.dart';

class Dots extends StatelessWidget {
  const Dots({
    Key? key,
    required this.totalSlides,
    required this.dotsCurve,
    required this.scrollDirection,
    this.height,
    this.width,
  }) : super(key: key);
  final int totalSlides;
  final Curve dotsCurve;
  final double? height;
  final double? width;
  final Axis scrollDirection;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: scrollDirection == Axis.horizontal ? 70 : null,
      child: scrollDirection == Axis.horizontal
          ? Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(totalSlides,
                  (index) => Dot(index: index, dotsCurve: dotsCurve)),
            )
          : Column(
              mainAxisSize: MainAxisSize.min,
              children: List.generate(
                  totalSlides,
                  (index) => Dot(
                        index: index,
                        dotsCurve: dotsCurve,
                        scrollDirection: scrollDirection,
                      )),
            ),
    );
  }
}
