import 'package:flutter/material.dart';
import 'package:flutter_carousel_intro/create_structure_slides.dart';
import 'package:flutter_carousel_intro/slider_model.dart';
import 'package:flutter_carousel_intro/utils/enums.dart';
import 'package:provider/provider.dart';

class FlutterCarousel extends StatelessWidget {
  const FlutterCarousel({
    Key? key,
    required this.primaryColor,
    required this.secondaryColor,
    required this.slides,
    required this.animatedRotateX,
    required this.animatedRotateZ,
    required this.scale,
    required this.animatedOpacity,
    required this.physics,
    required this.dotsContainerHeight,
    required this.dotsContainerWidth,
    required this.controller,
    required this.scrollDirection,
    required this.indicatorAlign,
    required this.autoPlay,
    required this.indicatorEffects,
    required this.autoPlaySlideDuration,
    required this.autoPlaySlideDurationTransition,
    required this.autoPlaySlideDurationCurve,
    required this.showIndicators,
  }) : super(key: key);

  final Color primaryColor;
  final Color secondaryColor;
  final List<Widget> slides;
  final bool animatedRotateX;
  final bool animatedRotateZ;
  final bool scale;
  final bool animatedOpacity;
  final ScrollPhysics? physics;
  final double? dotsContainerHeight;
  final double? dotsContainerWidth;
  final PageController? controller;
  final Axis scrollDirection;
  final IndicatorAlign? indicatorAlign;
  final bool autoPlay;
  final Duration autoPlaySlideDuration;
  final IndicatorEffects? indicatorEffects;
  final Duration autoPlaySlideDurationTransition;
  final Curve autoPlaySlideDurationCurve;
  final bool showIndicators;

  @override
  Widget build(BuildContext context) {
    final slideModelController = context.watch<SliderModel>();

    return Center(
      child: Builder(builder: (context) {
        slideModelController
          ..primaryColor = primaryColor
          ..secondaryColor = secondaryColor;
        return CreateStructureSlides(
          slides: slides,
          animatedRotateX: animatedRotateX,
          animatedRotateZ: animatedRotateZ,
          scale: scale,
          animatedOpacity: animatedOpacity,
          physics: physics,
          height: dotsContainerHeight,
          width: dotsContainerWidth,
          pageViewController: controller,
          scrollDirection: scrollDirection,
          indicatorAlign: indicatorAlign,
          autoPlay: autoPlay,
          autoPlaySlideDuration: autoPlaySlideDuration,
          indicatorEffects: indicatorEffects,
          primaryColor: primaryColor,
          secondaryColor: secondaryColor,
          autoPlaySlideDurationTransition: autoPlaySlideDurationTransition,
          autoPlaySlideDurationCurve: autoPlaySlideDurationCurve,
          showIndicators: showIndicators,
        );
      }),
    );
  }
}
