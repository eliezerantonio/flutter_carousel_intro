import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'slider_model.dart';

typedef NavigationButtonBuilder = Widget Function(
  BuildContext context,
  VoidCallback onPressed,
);

class CarouselNavigationButtons extends StatelessWidget {
  const CarouselNavigationButtons({
    super.key,
    required this.slidesCount,
    required this.repeat,
    required this.transitionDuration,
    required this.transitionCurve,
    this.onSkip,
    this.onDone,
    this.showNextButton = false,
    this.skipLabel,
    this.nextLabel,
    this.doneLabel,
    this.buttonStyle,
    this.skipButtonBuilder,
    this.nextButtonBuilder,
    this.doneButtonBuilder,
    this.skipAlignment = Alignment.topRight,
    this.nextAlignment = Alignment.bottomRight,
    this.padding = const EdgeInsets.all(16),
  });

  final int slidesCount;
  final bool repeat;
  final Duration transitionDuration;
  final Curve transitionCurve;

  final VoidCallback? onSkip;
  final VoidCallback? onDone;
  final bool showNextButton;

  final Widget? skipLabel;
  final Widget? nextLabel;
  final Widget? doneLabel;
  final ButtonStyle? buttonStyle;

  final NavigationButtonBuilder? skipButtonBuilder;
  final NavigationButtonBuilder? nextButtonBuilder;
  final NavigationButtonBuilder? doneButtonBuilder;

  final AlignmentGeometry skipAlignment;
  final AlignmentGeometry nextAlignment;
  final EdgeInsetsGeometry padding;

  bool get _hasNextOrDone => showNextButton || onDone != null;

  @override
  Widget build(BuildContext context) {
    if (onSkip == null && !_hasNextOrDone) {
      return const SizedBox.shrink();
    }

    final slider = context.watch<SliderModel>();
    final rawPage = slider.currentPage;
    final currentIndex =
        slidesCount == 0 ? 0 : rawPage.round() % slidesCount;
    final isLast = !repeat && currentIndex >= slidesCount - 1;

    void advance() {
      final controller = slider.pageViewController;
      if (isLast) {
        onDone?.call();
      } else {
        controller.nextPage(
          duration: transitionDuration,
          curve: transitionCurve,
        );
      }
    }

    Widget? skip;
    if (onSkip != null) {
      skip = skipButtonBuilder?.call(context, onSkip!) ??
          TextButton(
            style: buttonStyle,
            onPressed: onSkip,
            child: skipLabel ?? const Text('Skip'),
          );
    }

    Widget? nextOrDone;
    if (_hasNextOrDone) {
      if (isLast && onDone != null) {
        nextOrDone = doneButtonBuilder?.call(context, onDone!) ??
            TextButton(
              style: buttonStyle,
              onPressed: onDone,
              child: doneLabel ?? const Text('Done'),
            );
      } else if (showNextButton) {
        nextOrDone = nextButtonBuilder?.call(context, advance) ??
            TextButton(
              style: buttonStyle,
              onPressed: advance,
              child: nextLabel ?? const Text('Next'),
            );
      }
    }

    return Padding(
      padding: padding,
      child: Stack(
        children: [
          if (skip != null)
            Align(alignment: skipAlignment, child: skip),
          if (nextOrDone != null)
            Align(alignment: nextAlignment, child: nextOrDone),
        ],
      ),
    );
  }
}
