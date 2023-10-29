import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_carousel_intro/slider_item_model.dart';
import 'package:provider/provider.dart';
import 'carousel_slide_item.dart';
import 'slider_model.dart';

class CarouselSlides extends StatefulWidget {
  final List<SliderItem> slides;
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
  final TextStyle? titleTextStyle;
  final TextStyle? subtitleTextStyle;
  final TextAlign? titleTextAlign;
  final TextAlign? subtitleTextAlign;

  const CarouselSlides(
    this.slides,
    this.animatedRotateX,
    this.animatedRotateZ,
    this.scale,
    this.animatedOpacity,
    this.physics,
    this.pageViewController, {
    super.key,
    required this.titleTextStyle,
    required this.subtitleTextStyle,
    required this.titleTextAlign,
    required this.subtitleTextAlign,
    required this.scrollDirection,
    required this.autoPlay,
    required this.autoPlaySlideDuration,
    required this.autoPlaySlideDurationTransition,
    required this.autoPlaySlideDurationCurve,
  });

  @override
  State<CarouselSlides> createState() => CarouselSlidesState();
}

class CarouselSlidesState extends State<CarouselSlides> {
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
                ..scale(widget.scale ? value : 1.0, widget.scale ? value : 1.0),
              child: CarouselSlideItem(
                slide: widget.slides[index],
                titleTextStyle: widget.titleTextStyle,
                titleTextAlign: widget.titleTextAlign,
                subtitleTextStyle: widget.subtitleTextStyle,
                subtitleTextAlign: widget.subtitleTextAlign,
              ),
            ),
          ),
        );
      },
    );
  }
}
