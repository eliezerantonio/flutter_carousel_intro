import 'package:flutter/material.dart';
import 'package:flutter_carousel_intro/carousel_item.dart';
import 'package:flutter_carousel_intro/page_indicator/page_indicator.dart';
import 'package:flutter_carousel_intro/slider_item_model.dart';
import 'package:flutter_carousel_intro/utils/enums.dart';
import 'package:provider/provider.dart';
import 'slider_model.dart';

class FlutterCarouselIntro extends StatelessWidget {


  final List<SliderItem> slides;

  //* animations transition
  final bool animatedRotateX;
  final bool animatedRotateZ;
  final bool animatedOpacity;
  final bool scale;

  //* Scroll and page view
  final ScrollPhysics? physics;
  final PageController? controller;
  final Axis scrollDirection;

  //* auto play
  final Duration? autoPlaySlideDurationTransition;
  final Curve? autoPlaySlideDurationCurve;
  final Duration? autoPlaySlideDuration;
  final bool autoPlay;

  //* indicators
  final PageIndicator? pageIndicator;
  final IndicatorEffects? indicatorEffect;
  final IndicatorAlign? indicatorAlign;
  final bool showIndicators;
  final Color? primaryColor;
  final Color secondaryColor;
  final double? dotsContainerHeight;
  final double? dotsContainerWidth;

  //* title and subtitle 
  final TextStyle? titleTextStyle;
  final TextAlign? titleTextAlign;
  final TextAlign? subtitleTextAlign;
  final TextStyle? subtitleTextStyle;

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
    this.titleTextStyle,
    this.subtitleTextStyle,
    this.scrollDirection = Axis.horizontal,
    this.indicatorAlign,
    this.pageIndicator,
    this.indicatorEffect,
    this.titleTextAlign,
    this.subtitleTextAlign,
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
        titleTextStyle: titleTextStyle,
        titleTextAlign: titleTextAlign,
        subtitleTextStyle: subtitleTextStyle,
        subtitleTextAlign: subtitleTextAlign,
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
