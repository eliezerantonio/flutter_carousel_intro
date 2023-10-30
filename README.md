 [English](README.md) | [Português](resources/translation/pt_pt/README.md)

# flutter_carousel_intro

by:  [Eliezer António](https://github.com/eliezerantonio/)

see in Flutter Gems: <https://fluttergems.dev/packages/flutter_carousel_intro>

<img src="https://github.com/eliezerantonio/flutter_carousel_intro/blob/main/gif/main_gif.gif?raw=true" height="400">

 Swipe the carousel to the current clicked indicator

<img src="https://github.com/eliezerantonio/flutter_carousel_intro/blob/main/gif/clicke_indicator.gif?raw=true" height="400">

## Current Features

- [X] Custom child widgets
- [X] Slide
- [X] Rotate transition
- [X] Auto play
- [X] Horizontal transition
- [X] Vertical transition
- [X] Swipe the carousel to the current clicked indicator

# Features to be implemented

- [ ] Repeat
- [ ] Forward button & Back button (isn't very important)

## Supported Platforms

- Flutter Android
- Flutter iOS
- Flutter web
- Flutter desktop

## Preview

## Installation

Add `flutter_carousel_intro: ^1.0.11` to your `pubspec.yaml` dependencies. And import it:

```dart
import 'package:flutter_carousel_intro/flutter_carousel_intro.dart';
```

## How to use

```dart
FlutterCarouselIntro(  
       slides: [
          SliderItem(
            title: 'Title 1',
            subtitle: const Text('Lorem Ipsum is simply dummy text'),
            widget: SvgPicture.asset("assets/slide-1.svg"),
          ),
          SliderItem(
            title: 'Title 2',
            subtitle: const Text('Lorem Ipsum is simply dummy text'),
            widget: SvgPicture.asset("assets/slide-2.svg"),
          ),
          SliderItem(
            title: 'Title 3',
            subtitle: const Text('Lorem Ipsum is simply dummy text'),
            widget: SvgPicture.asset("assets/slide-3.svg"),
          ),
          SliderItem(
            title: 'Title 4',
            subtitle: const Text('Lorem Ipsum is simply dummy text'),
            widget: SvgPicture.asset("assets/slide-4.svg"),
          ),
          SliderItem(
            title: 'Title 5',
            subtitle: const Text('Lorem Ipsum is simply dummy text'),
            widget: SvgPicture.asset("assets/slide-5.svg"),
          ),
          SliderItem(
            title: 'Title 5',
            widget: SvgPicture.asset("assets/slide-6.svg"),
            subtitle: ElevatedButton(
              onPressed: () {},
              child: const Text("skip"),
            ),
          ),
        ],
    );
  ```

### All SliderItem parameters

```dart

  String? title,
  TextStyle? titleTextStyle,
  TextAlign? titleTextAlign,
  Widget? subtitle,
  
 ```
  
## General Example

```dart
class MySlideShow extends StatelessWidget {
  const MySlideShow({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return FlutterCarouselIntro(
        animatedRotateX: false,
        animatedRotateZ: true,
        scale: true,
        autoPlay: true,
        animatedOpacity: false,
        autoPlaySlideDuration: const Duration(seconds: 2),
        autoPlaySlideDurationTransition: const Duration(milliseconds: 1100),
        primaryColor: Colors.pink,
        secondaryColor: Colors.grey,
        scrollDirection: Axis.horizontal,
        indicatorAlign: IndicatorAlign.bottom,
        indicatorEffect: IndicatorEffects.jumping,
        showIndicators: true,
         slides: [
          SliderItem(
            title: 'Title 1',
            subtitle: const Text('Lorem Ipsum is simply dummy text'),
            widget: SvgPicture.asset("assets/slide-1.svg"),
          ),
          SliderItem(
            title: 'Title 2',
            subtitle: const Text('Lorem Ipsum is simply dummy text'),
            widget: SvgPicture.asset("assets/slide-2.svg"),
          ),
          SliderItem(
            title: 'Title 3',
            subtitle: const Text('Lorem Ipsum is simply dummy text'),
            widget: SvgPicture.asset("assets/slide-3.svg"),
          ),
          SliderItem(
            title: 'Title 4',
            subtitle: const Text('Lorem Ipsum is simply dummy text'),
            widget: SvgPicture.asset("assets/slide-4.svg"),
          ),
          SliderItem(
            title: 'Title 5',
            subtitle: const Text('Lorem Ipsum is simply dummy text'),
            widget: SvgPicture.asset("assets/slide-5.svg"),
          ),
          SliderItem(
            title: 'Title 5',
            widget: SvgPicture.asset("assets/slide-6.svg"),
            subtitle: ElevatedButton(
              onPressed: () {},
              child: const Text("skip"),
            ),
          ),
        ],
      );
  }
}
  ```  

## Gif

Normal Example:

<img src="https://github.com/eliezerantonio/flutter_carousel_intro/blob/main/gif/normal.gif?raw=true" height="400">

Animated Opacity

![normal](gif/opacity.gif)

<img src="https://github.com/eliezerantonio/flutter_carousel_intro/blob/main/gif/opacity.gif?raw=true" height="400">

```dart
animatedOpacity: true
```

Animated Scale

<img src="https://github.com/eliezerantonio/flutter_carousel_intro/blob/main/gif/scale.gif?raw=true" height="400">

```dart
scale: true
  ```

Animated Rotation on the X Axis

<img src="https://github.com/eliezerantonio/flutter_carousel_intro/blob/main/gif/animated_rotatex.gif?raw=true" height="400">

```dart
animatedRotateX: true
  ```
  
  Animated Rotation on the Z Axis

<img src="https://github.com/eliezerantonio/flutter_carousel_intro/blob/main/gif/animated_rotatey.gif?raw=true" height="400">

```dart
animatedRotateZ: true
  ```

## Contributions

Feel free to contribute to this project.

If you find a bug or want a feature, but don't know how to fix/implement it, please fill an [issue][issue].  
If you fixed a bug or implemented a feature, please send a [pull request][pr].

[issue]: https://github.com/eliezerantonio/flutter_carousel_intro/issues
[pr]: https://github.com/eliezerantonio/flutter_carousel_intro/pulls

## My Packages
  
  [Flutter Responsivity Widget](https://pub.dev/packages/flutter_responsivity_widget)
