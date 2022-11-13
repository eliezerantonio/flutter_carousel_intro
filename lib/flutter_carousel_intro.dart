import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FlutterCarouselIntro extends StatelessWidget {
  final List<Widget> slides;
  final bool pointsAbove;
  final bool rotateAnimation;
  final bool animatedOpacity;
  final bool scale;
  final Color primaryColor;
  final Color secundaryColor;
  final double primaryBullet;
  final double secundaryBullet;
  final Curve dotsCurve;

   const FlutterCarouselIntro({super.key, 
    required this.slides,
    this.pointsAbove = false,
    this.rotateAnimation = false,
    this.animatedOpacity = false,
    this.scale = false,
    this.dotsCurve = Curves.linear,
    this.primaryColor = Colors.blue,
    this.secundaryColor = Colors.grey,
    this.primaryBullet = 20,
    this.secundaryBullet = 14,
  });
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => _SliderModel(),
      child: SafeArea(
        child: Center(
          child: Builder(builder: (context) {
            context.read<_SliderModel>().primaryColor = primaryColor;
            context.read<_SliderModel>().secundaryColor = secundaryColor;
            context.read<_SliderModel>().primaryBullet = primaryBullet;
            context.read<_SliderModel>().secundaryBullet = secundaryBullet;
            return _CreateStructureSlides(
              pointsAbove: pointsAbove,
              slides: slides,
              rotateAnimation: rotateAnimation,
              scale: scale,
              dotsCurve: dotsCurve,
              animatedOpacity: animatedOpacity,
            );
          }),
        ),
      ),
    );
  }
}

class _CreateStructureSlides extends StatelessWidget {
  _CreateStructureSlides({
    required this.pointsAbove,
    required this.slides,
    required this.rotateAnimation,
    required this.scale,
    required this.dotsCurve,
    required this.animatedOpacity,
  });

  final bool pointsAbove;
  final List<Widget> slides;
  final Curve dotsCurve;
  bool rotateAnimation;
  bool scale;
  bool animatedOpacity;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (pointsAbove) _Dots(slides.length, dotsCurve),
        Expanded(
            child: _Slides(slides, rotateAnimation, scale, animatedOpacity)),
        if (!pointsAbove) _Dots(slides.length, dotsCurve),
      ],
    );
  }
}

class _Dots extends StatelessWidget {
  final int totalSlides;
  final Curve dotsCurve;

  const _Dots(this.totalSlides, this.dotsCurve);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 70,
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
    final slideshoModel = context.watch<_SliderModel>();
    final percent = 1 - (slideshoModel._currentPage - index);
    final value = percent.clamp(0.0, 1.0);

    final condition = (slideshoModel.currentPage >= index - 0.5 &&  slideshoModel.currentPage < index + 0.5);

    final dotSize =
        condition ? slideshoModel.primaryBullet : slideshoModel.secundaryBullet;
    return Center(
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 500),
        width: dotSize,
        alignment: Alignment.center,
        margin: const EdgeInsets.symmetric(horizontal: 5),
        height: dotSize,
        transformAlignment: Alignment.center,
        transform: Matrix4.identity()..rotateZ(value * 2),
        curve: dotsCurve,
        decoration: BoxDecoration(
          color: condition
              ? slideshoModel.primaryColor
              : slideshoModel.secundaryColor,
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}

class _Slides extends StatefulWidget {
  final List<Widget> slides;
  bool rotateAnimation;
  bool animatedOpacity;
  bool scale;

  _Slides(this.slides, this.rotateAnimation, this.scale, this.animatedOpacity);

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
    return Container(
      child: PageView.builder(
        itemCount: widget.slides.length,
        controller: pageViewController,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (BuildContext context, int index) {
          final percent = 1 - (currentPage - index);
          final value = percent.clamp(0.0, 1.0);

          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: AnimatedOpacity(
              opacity: widget.animatedOpacity ? value : 1,
              duration: const Duration(milliseconds: 500),
              child: Transform(
                alignment: widget.rotateAnimation ? Alignment.center : null,
                transform: Matrix4.identity()
                  ..setEntry(
                    widget.rotateAnimation ? 3 : 1,
                    widget.rotateAnimation ? 2 : 0,
                    widget.rotateAnimation ? 0.002 : 0,
                  )
                  ..rotateX(widget.rotateAnimation ? pi * (value - 1) : 0.0)
                  ..scale(
                    widget.scale ? value : 1.0,
                    widget.scale ? value : 1.0,
                  ),
                child: _Slide(
                  widget.slides[index],
                ),
              ),
            ),
          );
        },
      ),
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
  Color _primaryColor = Colors.blue;
  Color _secundaryColor = Colors.grey;

//dots
  double _primaryBullet = 20;
  double _secundaryBullet = 14;

  double get currentPage => _currentPage;

  set currentPage(double currentPage) {
    _currentPage = currentPage;

    notifyListeners();
  }

//get set corre
  Color get primaryColor => _primaryColor;

  set primaryColor(Color color) {
    _primaryColor = color;
  }

  Color get secundaryColor => _secundaryColor;
  set secundaryColor(Color color) {
    _secundaryColor = color;
  }

  //get set pontos

  double get primaryBullet => _primaryBullet;

  set primaryBullet(double size) {
    _primaryBullet = size;
  }

  double get secundaryBullet => _secundaryBullet;

  set secundaryBullet(double size) {
    _secundaryBullet = size;
  }
}
