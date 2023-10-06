import 'package:flutter/material.dart';

import 'effects/indicator_effect.dart';
import 'effects/worm_effect.dart';
import 'painters/indicator_painter.dart';

/// Signature for a callback function used to report
/// dot tap-events
typedef OnDotClicked = void Function(int index);

/// A widget that draws a representation of pages count
/// Inside of a  [PageView]
///
/// Uses the [PageController.offset] to animate the active dot
class PageIndicator extends StatefulWidget {
  /// The page view controller
  final PageController controller;

  /// Holds effect configuration to be used in the [BasicIndicatorPainter]
  final IndicatorEffect effect;

  /// Layout direction vertical || horizontal
  ///
  /// This will only rotate the canvas in which the dots are drawn.
  ///
  /// It will not affect [effect.dotWidth] and [effect.dotHeight]
  final Axis axisDirection;

  /// The number of pages
  final int count;

  /// If [textDirection] is [TextDirection.rtl], page direction will be flipped
  final TextDirection? textDirection;

  /// Reports dot taps
  final OnDotClicked? onDotClicked;

  /// Default constructor
  const PageIndicator({
    Key? key,
    required this.controller,
    required this.count,
    this.axisDirection = Axis.horizontal,
    this.textDirection,
    this.onDotClicked,
    this.effect = const WormEffect(),
  }) : super(key: key);

  @override
  State<PageIndicator> createState() => _PageIndicatorState();
}

mixin _SizeAndRotationCalculatorMixin {
  /// The size of canvas
  late Size size;

  /// Rotation quarters of canvas
  int quarterTurns = 0;

  BuildContext get context;

  TextDirection? get textDirection;

  Axis get axisDirection;

  int get count;

  IndicatorEffect get effect;

  void updateSizeAndRotation() {
    size = effect.calculateSize(count);

    /// if textDirection is not provided use the nearest directionality up the widgets tree;
    final isRTL = (textDirection ?? _getDirectionality()) == TextDirection.rtl;
    if (axisDirection == Axis.vertical) {
      quarterTurns = 1;
    } else {
      quarterTurns = isRTL ? 2 : 0;
    }
  }

  TextDirection? _getDirectionality() {
    return context
        .findAncestorWidgetOfExactType<Directionality>()
        ?.textDirection;
  }
}

class _PageIndicatorState extends State<PageIndicator>
    with _SizeAndRotationCalculatorMixin {
  @override
  void initState() {
    super.initState();
    updateSizeAndRotation();
  }

  @override
  void didUpdateWidget(covariant PageIndicator oldWidget) {
    super.didUpdateWidget(oldWidget);
    updateSizeAndRotation();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: widget.controller,
      builder: (context, _) => SmoothIndicator(
        offset: _offset,
        count: count,
        effect: effect,
        onDotClicked: widget.onDotClicked,
        size: size,
        quarterTurns: quarterTurns,
      ),
    );
  }

  double get _offset {
    try {
      var offset =
          widget.controller.page ?? widget.controller.initialPage.toDouble();
      return offset % widget.count;
    } catch (_) {
      return widget.controller.initialPage.toDouble();
    }
  }

  @override
  int get count => widget.count;

  @override
  IndicatorEffect get effect => widget.effect;

  @override
  Axis get axisDirection => widget.axisDirection;

  @override
  TextDirection? get textDirection => widget.textDirection;
}

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

  /// The rotation of cans based on
  /// text directionality and [axisDirection]
  final int quarterTurns;

  /// Default constructor
  const SmoothIndicator({
    Key? key,
    required this.offset,
    required this.count,
    required this.size,
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
    if (onDotClicked != null) {
      var index = effect.hitTestDots(details.localPosition.dx, count, offset);
      if (index != -1 && index != offset.toInt()) {
        onDotClicked?.call(index);
      }
    }
  }
}
