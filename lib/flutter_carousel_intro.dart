import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_carousel_intro/utils/enums.dart';
import 'package:provider/provider.dart';
import 'dots.dart';
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
  final double primaryBullet;
  final double secondaryBullet;
  final Curve dotsCurve;
  final ScrollPhysics? physics;
  final double? dotsContainerHeight;
  final double? dotsContainerWidth;
  final PageController? controller;
  final Axis scrollDirection;
  final IndicatorAlign? indicatorAlign;

  const FlutterCarouselIntro({
    Key? key,
    required this.slides,
    this.animatedRotateX = false,
    this.animatedRotateZ = false,
    this.animatedOpacity = false,
    this.autoPlay = false,
    this.autoPlaySlideDuration,
    this.scale = false,
    this.dotsCurve = Curves.linear,
    this.primaryColor,
    this.secondaryColor = Colors.grey,
    this.primaryBullet = 20,
    this.secondaryBullet = 14,
    this.physics,
    this.dotsContainerHeight,
    this.dotsContainerWidth,
    this.controller,
    this.scrollDirection = Axis.horizontal,
    this.indicatorAlign,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<SliderModel>(
      create: (_) => SliderModel(),
      child: _FlutterCarousel(
        primaryColor: primaryColor??Theme.of(context).primaryColor,
        secondaryColor: secondaryColor,
        primaryBullet: primaryBullet,
        secondaryBullet: secondaryBullet,
        slides: slides,
        animatedRotateX: animatedRotateX,
        animatedRotateZ: animatedRotateZ,
        scale: scale,
        dotsCurve: dotsCurve,
        animatedOpacity: animatedOpacity,
        physics: physics,
        dotsContainerHeight: dotsContainerHeight,
        dotsContainerWidth: dotsContainerWidth,
        controller: controller,
        scrollDirection: scrollDirection,
        indicatorAlign: indicatorAlign,
        autoPlay: autoPlay,
        autoPlaySlideDuration:
            autoPlaySlideDuration ?? const Duration(milliseconds: 500),
      ),
    );
  }
}

class _FlutterCarousel extends StatelessWidget {
  const _FlutterCarousel({
    Key? key,
    required this.primaryColor,
    required this.secondaryColor,
    required this.primaryBullet,
    required this.secondaryBullet,
    required this.slides,
    required this.animatedRotateX,
    required this.animatedRotateZ,
    required this.scale,
    required this.dotsCurve,
    required this.animatedOpacity,
    required this.physics,
    required this.dotsContainerHeight,
    required this.dotsContainerWidth,
    required this.controller,
    required this.scrollDirection,
    required this.indicatorAlign,
    required this.autoPlay,
    required this.autoPlaySlideDuration,
  }) : super(key: key);

  final Color primaryColor;
  final Color secondaryColor;
  final double primaryBullet;
  final double secondaryBullet;
  final List<Widget> slides;
  final bool animatedRotateX;
  final bool animatedRotateZ;
  final bool scale;
  final Curve dotsCurve;
  final bool animatedOpacity;
  final ScrollPhysics? physics;
  final double? dotsContainerHeight;
  final double? dotsContainerWidth;
  final PageController? controller;
  final Axis scrollDirection;
  final IndicatorAlign? indicatorAlign;
  final bool autoPlay;
  final Duration autoPlaySlideDuration;

  @override
  Widget build(BuildContext context) {
    final slideModelController = context.watch<SliderModel>();

    return Center(
      child: Builder(builder: (context) {
        slideModelController
          ..primaryColor = primaryColor
          ..secondaryColor = secondaryColor
          ..primaryBullet = primaryBullet
          ..secondaryBullet = secondaryBullet;
        return _CreateStructureSlides(
          slides: slides,
          animatedRotateX: animatedRotateX,
          animatedRotateZ: animatedRotateZ,
          scale: scale,
          dotsCurve: dotsCurve,
          animatedOpacity: animatedOpacity,
          physics: physics,
          height: dotsContainerHeight,
          width: dotsContainerWidth,
          pageViewController: controller,
          scrollDirection: scrollDirection,
          indicatorAlign: indicatorAlign,
          autoPlay: autoPlay,
          autoPlaySlideDuration: autoPlaySlideDuration,
        );
      }),
    );
  }
}

class _CreateStructureSlides extends StatelessWidget {
  const _CreateStructureSlides({
    required this.slides,
    required this.animatedRotateX,
    required this.animatedRotateZ,
    required this.scale,
    required this.dotsCurve,
    required this.animatedOpacity,
    required this.physics,
    required this.height,
    required this.width,
    required this.scrollDirection,
    required this.indicatorAlign,
    required this.pageViewController,
    required this.autoPlay,
    required this.autoPlaySlideDuration,
  });

  final List<Widget> slides;
  final Curve dotsCurve;
  final bool animatedRotateX;
  final bool animatedRotateZ;
  final bool scale;
  final bool animatedOpacity;
  final ScrollPhysics? physics;
  final double? height;
  final double? width;
  final Axis scrollDirection;
  final IndicatorAlign? indicatorAlign;
  final PageController? pageViewController;
  final bool autoPlay;
  final Duration autoPlaySlideDuration;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Align(
          alignment: _getAlignmentFromIndicatorAlign(indicatorAlign),
          child: Dots(
            totalSlides: slides.length,
            dotsCurve: dotsCurve,
            scrollDirection: scrollDirection,
          ),
        ),
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

  const _Slides(
    this.slides,
    this.animatedRotateX,
    this.animatedRotateZ,
    this.scale,
    this.animatedOpacity,
    this.physics,
    this.pageViewController, {
    required this.scrollDirection,
    required this.autoPlay,
    required this.autoPlaySlideDuration,
  });

  @override
  State<_Slides> createState() => _SlidesState();
}

class _SlidesState extends State<_Slides> {
  late PageController pageViewController =
      widget.pageViewController ?? PageController();

  @override
  void initState() {
    if (widget.autoPlay) {
      _playSlides();
    }

    pageViewController.addListener(() {
      //update provider
      context.read<SliderModel>().currentPage = pageViewController.page!;
    });
    super.initState();
  }

  void _playSlides() {
    Timer.periodic(widget.autoPlaySlideDuration, (timer) {
      if ((pageViewController.page ?? 0) + 1 >= widget.slides.length) {
        timer.cancel();
      } else {
        pageViewController.nextPage(
          duration: const Duration(milliseconds: 400),
          curve: Curves.ease,
        );
      }
    });
  }

  @override
  void dispose() {
    pageViewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final currentPage = context.watch<SliderModel>().currentPage;
    return PageView.builder(
      itemCount: widget.slides.length,
      controller: pageViewController,
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
