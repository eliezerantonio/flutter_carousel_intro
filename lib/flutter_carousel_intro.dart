import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_carousel_intro/page_indicator/effects/color_transition_effect.dart';
import 'package:flutter_carousel_intro/page_indicator/effects/expanding_dots_effect.dart';
import 'package:flutter_carousel_intro/page_indicator/effects/indicator_effect.dart';
import 'package:flutter_carousel_intro/page_indicator/effects/jumping_dot_effect.dart';
import 'package:flutter_carousel_intro/page_indicator/effects/scale_effect.dart';
import 'package:flutter_carousel_intro/page_indicator/effects/scrolling_dots_effect.dart';
import 'package:flutter_carousel_intro/page_indicator/effects/slide_effect.dart';
import 'package:flutter_carousel_intro/page_indicator/effects/swap_effect.dart';
import 'package:flutter_carousel_intro/page_indicator/effects/worm_effect.dart';
import 'package:flutter_carousel_intro/page_indicator/page_indicator.dart';
import 'package:flutter_carousel_intro/utils/enums.dart';
import 'package:provider/provider.dart';
import 'slider_model.dart';

class FlutterCarouselIntro extends StatelessWidget {
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
    this.showIndicators=true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<SliderModel>(
      create: (_) => SliderModel(),
      child: _FlutterCarousel(
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
        autoPlaySlideDurationCurve: Curves.ease,
        autoPlaySlideDurationTransition: autoPlaySlideDurationTransition ??
            const Duration(milliseconds: 500),
        autoPlaySlideDuration:
            autoPlaySlideDuration ?? const Duration(milliseconds: 500),
        indicatorEffects: indicatorEffect,
        showIndicators:showIndicators
      ),
    );
  }
}

class _FlutterCarousel extends StatelessWidget {
  const _FlutterCarousel(
      {Key? key,
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
        required this.showIndicators})
      : super(key: key);

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
  final  bool  showIndicators;

  @override
  Widget build(BuildContext context) {
    final slideModelController = context.watch<SliderModel>();

    return Center(
      child: Builder(builder: (context) {
        slideModelController
          ..primaryColor = primaryColor
          ..secondaryColor = secondaryColor;
        return _CreateStructureSlides(
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
          autoPlaySlideDurationCurve: autoPlaySlideDurationCurve, showIndicators: showIndicators,
        );
      }),
    );
  }
}

class _CreateStructureSlides extends StatelessWidget {


  const _CreateStructureSlides(
      {required this.slides,
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
        _Slides(
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
        if(showIndicators)
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

class _Slides extends StatefulWidget {
  final List<Widget> slides;
  final bool animatedRotateX;
  final bool animatedRotateZ;
  final bool animatedOpacity;
  final bool scale;
  final ScrollPhysics? physics;
  final PageController? pageViewController;
  final Axis scrollDirection;
  final bool autoPlay;
  final Duration autoPlaySlideDuration;
  final Duration autoPlaySlideDurationTransition;
  final Curve autoPlaySlideDurationCurve;

  const _Slides(this.slides, this.animatedRotateX, this.animatedRotateZ,
      this.scale, this.animatedOpacity, this.physics, this.pageViewController,
      {required this.scrollDirection,
      required this.autoPlay,
      required this.autoPlaySlideDuration,
      required this.autoPlaySlideDurationTransition,
      required this.autoPlaySlideDurationCurve});

  @override
  State<_Slides> createState() => _SlidesState();
}

class _SlidesState extends State<_Slides> {
  @override
  void initState() {
    if (widget.pageViewController != null) {
      context.read<SliderModel>().pageViewController =
          widget.pageViewController!;
    }
    if (widget.autoPlay) {
      _playSlides();
    }

    context.read<SliderModel>().pageViewController.addListener(() {
      //update provider
      context.read<SliderModel>().currentPage =
          context.read<SliderModel>().pageViewController.page!;
    });
    super.initState();
  }

  void _playSlides() {
    Timer.periodic(widget.autoPlaySlideDuration, (timer) {
      if ((context.read<SliderModel>().pageViewController.page ?? 0) + 1 >=
          widget.slides.length) {
        timer.cancel();
      } else {
        context.read<SliderModel>().pageViewController.nextPage(
              duration: widget.autoPlaySlideDurationTransition,
              curve: widget.autoPlaySlideDurationCurve,
            );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentPage = context.watch<SliderModel>().currentPage;
    return PageView.builder(
      itemCount: widget.slides.length,
      controller: context.read<SliderModel>().pageViewController,
      scrollDirection: widget.scrollDirection,
      physics: widget.physics ?? const BouncingScrollPhysics(),
      itemBuilder: (BuildContext context, int index) {
        final percent = 1 - (currentPage - index);
        final value = percent.clamp(0.0, 1.0);

        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: AnimatedOpacity(
            opacity: widget.animatedOpacity ? value : 1,
            duration: const Duration(milliseconds: 500),
            child: Transform(
              alignment: widget.animatedRotateX ? Alignment.center : null,
              transform: Matrix4.identity()
                ..setEntry(
                  widget.animatedRotateX ? 3 : 1,
                  widget.animatedRotateX ? 2 : 0,
                  widget.animatedRotateX ? 0.002 : 0,
                )
                ..rotateX(widget.animatedRotateX ? pi * (value - 1) : 0.0)
                ..rotateZ(widget.animatedRotateZ ? pi * (value - 1) : 0.0)
                ..scale(
                  widget.scale ? value : 1.0,
                  widget.scale ? value : 1.0,
                ),
              child: _SlideItem(
                widget.slides[index],
              ),
            ),
          ),
        );
      },
    );
  }
}

class _SlideItem extends StatelessWidget {
  final Widget slide;
  const _SlideItem(this.slide);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(30),
      child: slide,
    );
  }
}
