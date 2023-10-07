import 'package:flutter/material.dart';
import 'package:flutter_carousel_intro/flutter_carousel_intro.dart';
import 'package:flutter_carousel_intro/utils/enums.dart';
import 'package:flutter_svg/svg.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(useMaterial3: false),
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: MySlideShow(),
    );
  }
}

class MySlideShow extends StatelessWidget {
  const MySlideShow({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: FlutterCarouselIntro(
        animatedRotateX: false,
        animatedRotateZ: false,
        scale: false,
        autoPlay: false,
        animatedOpacity: false,
        autoPlaySlideDuration: const Duration(milliseconds: 1000),
        autoPlaySlideDurationTransition: const Duration(milliseconds: 1000),
        primaryColor: Colors.pink,
        secondaryColor: Colors.grey,
        scrollDirection: Axis.horizontal,
        indicatorAlign: IndicatorAlign.bottom,
        indicatorEffect: IndicatorEffects.worm,
        slides: [
          SvgPicture.asset("assets/slide-1.svg"),
          SvgPicture.asset("assets/slide-2.svg"),
          SvgPicture.asset("assets/slide-3.svg"),
          SvgPicture.asset("assets/slide-4.svg"),
          SvgPicture.asset("assets/slide-5.svg"),
        ],
      ),
    );
  }
}
