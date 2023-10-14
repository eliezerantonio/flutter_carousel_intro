import 'package:flutter/material.dart';
import 'package:flutter_carousel_intro/page_indicator/effects/indicator_effect.dart';
import 'package:flutter_carousel_intro/page_indicator/effects/worm_effect.dart';
import 'package:flutter_carousel_intro/page_indicator/page_indicator.dart';

/// Draws dot-ish representation of pages by
/// the number of [count] and animates the active
/// page using [offset]
class SmoothIndicator extends StatelessWidget {
  /// The active page offset
  final double offset;

  /// Holds effect configuration to be used in the [BasicIndicatorPainter]
  final IndicatorEffect effect;

  /// The number of pages
  final int count;

  /// Reports dot-taps
  final OnDotClicked? onDotClicked;

  /// The size of canvas
  final Size size;

  /// The page view controller
  final PageController controller;

  /// The rotation of cans based on
  /// text directionality and [axisDirection]
  final int quarterTurns;

  /// Default constructor
  const SmoothIndicator({
    Key? key,
    required this.offset,
    required this.count,
    required this.size,
    required this.controller,
    this.quarterTurns = 0,
    this.effect = const WormEffect(),
    this.onDotClicked,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RotatedBox(
      quarterTurns: quarterTurns,
      child: GestureDetector(
        onTapUp: _onTap,
        child: CustomPaint(
          size: size,
          // rebuild the painter with the new offset every time it updates
          painter: effect.buildPainter(count, offset),
        ),
      ),
    );
  }

  void _onTap(details) {
    int index = effect.hitTestDots(details.localPosition.dx, count, offset);
    if (onDotClicked != null) {
      if (index != -1 && index != offset.toInt()) {
        onDotClicked?.call(index);
      }
    } else {
      /// Swipe the carousel to the current clicked indicator position
      controller.animateToPage(
        index,
        duration: const Duration(milliseconds: 500),
        curve: Curves.ease,
      );
    }
  }
}
