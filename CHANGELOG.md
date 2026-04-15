
# Version 1.0.13

## what's new

* Built-in navigation buttons — `Skip`, `Next` and `Done` are now available
  directly on `FlutterCarouselIntro`, no need to assemble them manually:

```dart
FlutterCarouselIntro(
  showNextButton: true,
  onSkip: () => Navigator.of(context).pushReplacementNamed('/home'),
  onDone: () => Navigator.of(context).pushReplacementNamed('/home'),
  skipLabel: const Text('Skip'),
  nextLabel: const Text('Next'),
  doneLabel: const Text('Done'),
  slides: [...],
);
```

  On the last slide the `Next` button is automatically replaced by `Done`
  (when `onDone` is provided). In `repeat: true` mode there is no last slide,
  so `Next` is always shown. Each button can be fully overridden via
  `skipButtonBuilder` / `nextButtonBuilder` / `doneButtonBuilder`, styled via
  `navigationButtonStyle`, and repositioned via `skipButtonAlignment`,
  `nextButtonAlignment` and `navigationButtonsPadding`.

* New `repeat` parameter: when `autoPlay` is enabled, setting `repeat: true`
  makes the carousel loop back to the first slide instead of stopping at the
  last one.

```dart
FlutterCarouselIntro(
  autoPlay: true,
  repeat: true,
  slides: [...],
);
```

## improvements

* Auto-play `Timer` is now properly cancelled on dispose (no more leaks when
  navigating away from the carousel).
* Safer `SliderModel` wiring via `addPostFrameCallback` to avoid touching the
  page controller before the first frame.
* Bumped minimum Flutter SDK to `3.24.0` / Dart `3.5.0` and updated
  `flutter_lints` to `^5.0.0`.

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
