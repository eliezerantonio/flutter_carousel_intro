
# Version >= 1.0.8

## break changes

* in old versions slides were used as follows

```dart
FlutterCarouselIntro(  
      slides: [
        SvgPicture.asset("assets/slide-1.svg"),
        SvgPicture.asset("assets/slide-2.svg"),
        SvgPicture.asset("assets/slide-3.svg"),
        SvgPicture.asset("assets/slide-4.svg"),
        SvgPicture.asset("assets/slide-5.svg"),
      ],
    );
  ```

* now you must use SliderItem, with SliderItem, you get a free title (it's a String), subtitle (it's a String) and a widget, in the widget you can use whatever you want

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
            displaySmall,
          ),
      ],
    );
  ```

## All SliderItem parameters

```dart

  String? title,
  TextStyle? titleTextStyle,
  TextAlign? titleTextAlign,
  String? subtitle,
  TextStyle? subtitleTextStyle,
  TextAlign? subtitleTextAlign,

 ```

# Version 1.0.6

Improve documentation

bugs fixed

Version 1.0.5

## bug fixed

Looking up a deactivated widget's ancestor is unsafe #28

### what's new

* Swipe the carousel to the current clicked indicator

# release new version

## 1.0.1

* new param was added: IndicatorEffects, is an enum

 ```dart
 
   indicatorEffect: IndicatorEffects.worm,

 ```

## from version 1.0.2 to version 1.0.4

## 0.0.12

* in this version was implemented auto play transition

```dart

 autoPlay: true,

 ```

# break changes for indicator positions

* in old versions to toggle indicator for top or bottom was:

 ```dart
 
pointsAbove: true,

 ```

* this param was repleced by indicatorAlign, is an enum

 ```dart
 
indicatorAlign: IndicatorAlign.left,

 ```

## 0.0.10

* in this version you can set different slide direction (Vertial or Horizontal)

```dart

 scrollDirection: Axis.horizontal,

 ```

 ```dart
 
 scrollDirection: Axis.vertical,

 ```

## 0.0.7

* Portuguese documentation.
  
## 0.0.1

## 0.0.5

* Initial documentantion.
