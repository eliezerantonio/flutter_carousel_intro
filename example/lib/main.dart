import 'package:flutter/material.dart';
import 'package:flutter_carousel_intro/flutter_carousel_intro.dart';
import 'package:flutter_carousel_intro/slider_item_model.dart';
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
        animatedRotateZ: true,
        scale: true,
        autoPlay: true,
        animatedOpacity: false,
        autoPlaySlideDuration: const Duration(seconds: 2),
        autoPlaySlideDurationTransition: const Duration(milliseconds: 1100),
        primaryColor: const Color(0xff6C63FF),
        secondaryColor: Colors.grey,
        scrollDirection: Axis.horizontal,
        indicatorAlign: IndicatorAlign.bottom,
        indicatorEffect: IndicatorEffects.jumping,
        showIndicators: true,
        slides: [
          SliderItem(
            title: 'Title 1',
            subtitle: 'Lorem Ipsum is simply dummy text of the printing',
            widget: SvgPicture.asset("assets/slide-1.svg"),
          ),
          SliderItem(
            title: 'Title 2',
            subtitle: 'Lorem Ipsum is simply dummy text of the printing',
            widget: SvgPicture.asset("assets/slide-2.svg"),
          ),
          SliderItem(
            title: 'Title 3',
            subtitle: 'Lorem Ipsum is simply dummy text of the printing',
            widget: SvgPicture.asset("assets/slide-3.svg"),
          ),
          SliderItem(
            title: 'Title 4',
            subtitle: 'Lorem Ipsum is simply dummy text of the printing',
            widget: SvgPicture.asset("assets/slide-4.svg"),
          ),
          SliderItem(
            title: 'Title 5',
            subtitle: 'Lorem Ipsum is simply dummy text of the printing',
            widget: SvgPicture.asset("assets/slide-5.svg"),
            subtitleTextStyle: const TextStyle(fontWeight: FontWeight.w500),
          ),
          SliderItem(
            title: 'Title 5',
            subtitle: 'Lorem Ipsum is simply dummy text of the printing',
            widget: SvgPicture.asset("assets/slide-6.svg"),
            subtitleTextStyle: Theme.of(context).textTheme.displaySmall,
          ),
        ],
      ),
    );
  }
}
