import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FlutterCarouselIntro extends StatelessWidget {
  final List<Widget> slides;
  final bool pointsAbove;
  final bool animatedRotateX;
  final bool animatedRotateZ;
  final bool animatedOpacity;
  final bool scale;
  final Color primaryColor;
  final Color secondaryColor;
  final double primaryBullet;
  final double secondaryBullet;
  final Curve dotsCurve;
  final ScrollPhysics? physics;
  final double? dotsContainerHeight;
  final double? dotsContainerWidth;

  const FlutterCarouselIntro({
    Key? key,
    required this.slides,
    this.pointsAbove = false,
    this.animatedRotateX = false,
    this.animatedRotateZ = false,
    this.animatedOpacity = false,
    this.scale = false,
    this.dotsCurve = Curves.linear,
    this.primaryColor = Colors.blue,
    this.secondaryColor = Colors.grey,
    this.primaryBullet = 20,
    this.secondaryBullet = 14,
    this.physics,
    this.dotsContainerHeight,
    this.dotsContainerWidth,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _SliderModel controller = context.watch<_SliderModel>();
    return ChangeNotifierProvider(
      create: (_) => _SliderModel(),
      child: SafeArea(
        child: Center(
          child: Builder(builder: (context) {
            controller
              ..primaryColor = primaryColor
              ..secondaryColor = secondaryColor
              ..primaryBullet = primaryBullet
              ..secondaryBullet = secondaryBullet;
            return _CreateStructureSlides(
              pointsAbove: pointsAbove,
              slides: slides,
              animatedRotateX: animatedRotateX,
              animatedRotateZ: animatedRotateZ,
              scale: scale,
              dotsCurve: dotsCurve,
              animatedOpacity: animatedOpacity,
              physics: physics,
              height: dotsContainerHeight,
              width: dotsContainerWidth,
            );
          }),
        ),
      ),
    );
  }
}

class _CreateStructureSlides extends StatelessWidget {
  const _CreateStructureSlides({
    required this.pointsAbove,
    required this.slides,
    required this.animatedRotateX,
    required this.animatedRotateZ,
    required this.scale,
    required this.dotsCurve,
    required this.animatedOpacity,
    required this.physics,
    required this.height,
    required this.width,
  });

  final bool pointsAbove;
  final List<Widget> slides;
  final Curve dotsCurve;
  final bool animatedRotateX;
  final bool animatedRotateZ;
  final bool scale;
  final bool animatedOpacity;
  final ScrollPhysics? physics;
  final double? height;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (pointsAbove) _Dots(slides.length, dotsCurve, height, width),
        Expanded(
          child: _Slides(
            slides,
            animatedRotateX,
            animatedRotateZ,
            scale,
            animatedOpacity,
            physics,
          ),
        ),
        if (!pointsAbove) _Dots(slides.length, dotsCurve, height, width),
      ],
    );
  }
}

class _Dots extends StatelessWidget {
  final int totalSlides;
  final Curve dotsCurve;
  final double? height;
  final double? width;

  const _Dots(this.totalSlides, this.dotsCurve, this.height, this.width);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? double.infinity,
      height: height ?? 70,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(totalSlides, (index) => _Dot(index, dotsCurve)),
      ),
    );
  }
}

class _Dot extends StatelessWidget {
  const _Dot(this.index, this.dotsCurve);
  final int index;
  final Curve dotsCurve;

  @override
  Widget build(BuildContext context) {
    final slideShowModel = context.watch<_SliderModel>();
    final percent = 1 - (slideShowModel._currentPage - index);
    final value = percent.clamp(0.0, 1.0);

    final condition = (slideShowModel.currentPage >= index - 0.5 &&
        slideShowModel.currentPage < index + 0.5);
    final dotSize = condition
        ? slideShowModel.primaryBullet
        : slideShowModel.secondaryBullet;

    double dotWidth = dotSize * sin(pi / 4);
    double dotHeight = dotSize * sin(pi / 4);

    return Center(
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 500),
        width: dotWidth,
        alignment: Alignment.center,
        margin: const EdgeInsets.symmetric(horizontal: 5),
        height: dotHeight,
        transformAlignment: Alignment.center,
        transform: Matrix4.identity()..rotateZ(value * 2),
        curve: dotsCurve,
        decoration: BoxDecoration(
          color: condition
              ? slideShowModel.primaryColor
              : slideShowModel.secondaryColor,
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}

class _Slides extends StatefulWidget {
  final List<Widget> slides;
  final bool animatedRotateX;
  final bool animatedRotateZ;
  final bool animatedOpacity;
  final bool scale;
  final ScrollPhysics? physics;

  const _Slides(
    this.slides,
    this.animatedRotateX,
    this.animatedRotateZ,
    this.scale,
    this.animatedOpacity,
    this.physics,
  );

  @override
  State<_Slides> createState() => _SlidesState();
}

class _SlidesState extends State<_Slides> {
  final pageViewController = PageController();

  @override
  void initState() {
    pageViewController.addListener(() {
      //update provider

      context.read<_SliderModel>().currentPage = pageViewController.page!;
    });
    super.initState();
  }

  @override
  void dispose() {
    pageViewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final currentPage = context.watch<_SliderModel>().currentPage;
    return PageView.builder(
      itemCount: widget.slides.length,
      controller: pageViewController,
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
                )
              // ,
              ,
              child: _Slide(
                widget.slides[index],
              ),
            ),
          ),
        );
      },
    );
  }
}

class _Slide extends StatelessWidget {
  final Widget slide;
  const _Slide(this.slide);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(30),
      child: slide,
    );
  }
}

class _SliderModel with ChangeNotifier {
  double _currentPage = 0.0;

//colors
  Color primaryColor = Colors.blue;
  Color secondaryColor = Colors.grey;

//dots
  double primaryBullet = 20;
  double secondaryBullet = 14;

  double get currentPage => _currentPage;

  set currentPage(double currentPage) {
    _currentPage = currentPage;

    notifyListeners();
  }
}
