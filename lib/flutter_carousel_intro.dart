import 'package:flutter/material.dart';
import 'package:flutter_carousel_intro/carousel_item.dart';
import 'package:flutter_carousel_intro/page_indicator/page_indicator.dart';
import 'package:flutter_carousel_intro/utils/enums.dart';
import 'package:provider/provider.dart';
import 'slider_model.dart';

class FlutterCarouselIntro extends StatelessWidget {
  //* Slide list
  final List<Widget> slides;
  final bool animatedRotateX;
  final bool animatedRotateZ;
  final bool animatedOpacity;
  final bool scale;
  final bool autoPlay;
  final Duration? autoPlaySlideDuration;
  final Color? primaryColor;
  final Color secondaryColor;
  final ScrollPhysics? physics;
  final double? dotsContainerHeight;
  final double? dotsContainerWidth;
  final PageController? controller;
  final Axis scrollDirection;
  final IndicatorAlign? indicatorAlign;
  final PageIndicator? pageIndicator;
  final IndicatorEffects? indicatorEffect;
  final Duration? autoPlaySlideDurationTransition;
  final Curve? autoPlaySlideDurationCurve;
  final bool showIndicators;

  const FlutterCarouselIntro({
    Key? key,
    required this.slides,
    this.animatedRotateX = false,
    this.animatedRotateZ = false,
    this.animatedOpacity = false,
    this.autoPlay = false,
    this.autoPlaySlideDuration,
    this.scale = false,
    this.primaryColor,
    this.secondaryColor = Colors.grey,
    this.physics,
    this.dotsContainerHeight,
    this.dotsContainerWidth,
    this.controller,
    this.scrollDirection = Axis.horizontal,
    this.indicatorAlign,
    this.pageIndicator,
    this.indicatorEffect,
    this.autoPlaySlideDurationTransition,
    this.autoPlaySlideDurationCurve,
    this.showIndicators = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<SliderModel>(
      create: (_) => SliderModel(),
      child: CarouselItem(
        primaryColor: primaryColor ?? Theme.of(context).primaryColor,
        secondaryColor: secondaryColor,
        slides: slides,
        animatedRotateX: animatedRotateX,
        animatedRotateZ: animatedRotateZ,
        scale: scale,
        animatedOpacity: animatedOpacity,
        physics: physics,
        dotsContainerHeight: dotsContainerHeight,
        dotsContainerWidth: dotsContainerWidth,
        controller: controller,
        scrollDirection: scrollDirection,
        indicatorAlign: indicatorAlign,
        autoPlay: autoPlay,
        autoPlaySlideDurationCurve: autoPlaySlideDurationCurve ?? Curves.ease,
        autoPlaySlideDurationTransition: autoPlaySlideDurationTransition ??
            const Duration(milliseconds: 500),
        autoPlaySlideDuration:
            autoPlaySlideDuration ?? const Duration(milliseconds: 500),
        indicatorEffects: indicatorEffect,
        showIndicators: showIndicators,
      ),
    );
  }
}
