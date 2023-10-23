import 'package:flutter/material.dart';
import 'package:flutter_carousel_intro/carousel_slides.dart';
import 'package:flutter_carousel_intro/page_indicator/effects/expanding_dots_effect.dart';
import 'package:flutter_carousel_intro/page_indicator/effects/indicator_effect.dart';
import 'package:flutter_carousel_intro/page_indicator/effects/jumping_dot_effect.dart';
import 'package:flutter_carousel_intro/page_indicator/effects/scale_effect.dart';
import 'package:flutter_carousel_intro/page_indicator/effects/scrolling_dots_effect.dart';
import 'package:flutter_carousel_intro/page_indicator/effects/slide_effect.dart';
import 'package:flutter_carousel_intro/page_indicator/effects/swap_effect.dart';
import 'package:flutter_carousel_intro/page_indicator/effects/worm_effect.dart';
import 'package:flutter_carousel_intro/page_indicator/page_indicator.dart';
import 'package:flutter_carousel_intro/slider_model.dart';
import 'package:flutter_carousel_intro/utils/enums.dart';
import 'package:provider/provider.dart';

import 'page_indicator/effects/color_transition_effect.dart';

class CreateStructureSlides extends StatelessWidget {
  const CreateStructureSlides({
    super.key,
    required this.slides,
    required this.animatedRotateX,
    required this.animatedRotateZ,
    required this.scale,
    required this.animatedOpacity,
    required this.physics,
    required this.height,
    required this.width,
    required this.scrollDirection,
    required this.indicatorAlign,
    required this.pageViewController,
    required this.autoPlay,
    required this.indicatorEffects,
    required this.primaryColor,
    required this.secondaryColor,
    required this.autoPlaySlideDuration,
    required this.autoPlaySlideDurationTransition,
    required this.autoPlaySlideDurationCurve,
    required this.showIndicators,
  });

  final List<Widget> slides;
  final bool animatedRotateX;
  final bool animatedRotateZ;
  final bool scale;
  final bool animatedOpacity;
  final ScrollPhysics? physics;
  final double? height;
  final double? width;
  final Axis scrollDirection;
  final IndicatorEffects? indicatorEffects;
  final IndicatorAlign? indicatorAlign;
  final PageController? pageViewController;
  final bool autoPlay;
  final Duration autoPlaySlideDuration;
  final Color primaryColor;
  final Color secondaryColor;
  final Duration autoPlaySlideDurationTransition;
  final Curve autoPlaySlideDurationCurve;
  final bool showIndicators;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CarouselSlides(
          slides,
          animatedRotateX,
          animatedRotateZ,
          scale,
          animatedOpacity,
          physics,
          pageViewController,
          scrollDirection: scrollDirection,
          autoPlay: autoPlay,
          autoPlaySlideDuration: autoPlaySlideDuration,
          autoPlaySlideDurationTransition: autoPlaySlideDurationTransition,
          autoPlaySlideDurationCurve: autoPlaySlideDurationCurve,
        ),
        if (showIndicators)
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Align(
              alignment: _getAlignmentFromIndicatorAlign(indicatorAlign),
              child: PageIndicator(
                controller: context.watch<SliderModel>().pageViewController,
                effect: getEffectFromIndicatorEffect(
                    indicatorEffects, primaryColor, secondaryColor, 16),
                axisDirection: scrollDirection,
                count: slides.length,
              ),
            ),
          ),
      ],
    );
  }

  Alignment _getAlignmentFromIndicatorAlign(IndicatorAlign? align) {
    switch (align) {
      case IndicatorAlign.left:
        return Alignment.centerLeft;
      case IndicatorAlign.right:
        return Alignment.centerRight;
      case IndicatorAlign.bottom:
        return Alignment.bottomCenter;
      case IndicatorAlign.top:
        return Alignment.topCenter;
      default:
        if (scrollDirection == Axis.horizontal) {
          return Alignment.bottomCenter;
        } else {
          return Alignment.centerLeft;
        }
    }
  }

  IndicatorEffect getEffectFromIndicatorEffect(IndicatorEffects? effect,
      Color primaryColor, Color secondaryColor, double dotSize) {
    switch (effect) {
      case IndicatorEffects.worm:
        return WormEffect(
            activeDotColor: primaryColor,
            dotColor: secondaryColor,
            radius: dotSize);
      case IndicatorEffects.colorTransition:
        return ColorTransitionEffect(
            activeDotColor: primaryColor,
            dotColor: secondaryColor,
            radius: dotSize);
      case IndicatorEffects.expanding:
        return ExpandingDotsEffect(
            activeDotColor: primaryColor,
            dotColor: secondaryColor,
            radius: dotSize);

      case IndicatorEffects.jumping:
        return JumpingDotEffect(
            activeDotColor: primaryColor,
            dotColor: secondaryColor,
            radius: dotSize);

      case IndicatorEffects.scale:
        return ScaleEffect(
            activeDotColor: primaryColor,
            dotColor: secondaryColor,
            radius: dotSize);

      case IndicatorEffects.scrolling:
        return ScrollingDotsEffect(
            activeDotColor: primaryColor,
            dotColor: secondaryColor,
            radius: dotSize);

      case IndicatorEffects.slide:
        return SlideEffect(
            activeDotColor: primaryColor,
            dotColor: secondaryColor,
            radius: dotSize);

      case IndicatorEffects.swap:
        return SwapEffect(
            activeDotColor: primaryColor,
            dotColor: secondaryColor,
            radius: dotSize);
      default:
        return ColorTransitionEffect(
            activeDotColor: primaryColor,
            dotColor: secondaryColor,
            radius: dotSize);
    }
  }
}
