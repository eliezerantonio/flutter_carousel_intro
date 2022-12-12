
# flutter_carousel_intro

## Funcionalidades 

- [X] Custom child widgets
- [X] Slide transition
- [X] Rotate transition
- [ ] Infinite Scroll
- [ ] Forward button && Back button
- [ ] Auto play




## Plataformas suportadas

* Flutter Android
* Flutter iOS
* Flutter web
* Flutter desktop

## Visualização


## Instalação

Adicionar `flutter_carousel_intro: ^0.0.5` no seu  ficheiro de dependências`pubspec.yaml`. E importa:

```dart
import 'package:flutter_carousel_intro/flutter_carousel_intro.dart';
```

## Como usar
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
  
## Gif

Exemplo normal:

![normal](https://github.com/eliezerantonio/flutter_carousel_intro/blob/main/gif/normal.gif)

Opacidade Animada

![normal](https://github.com/eliezerantonio/flutter_carousel_intro/blob/main/gif/opacity.gif)

```dart
animatedOpacity: true
```
Escala Animada

![normal](https://github.com/eliezerantonio/flutter_carousel_intro/blob/main/gif/scale.gif)

```dart
scale: true
  ```
Rotação animada no eixo X

![normal](https://github.com/eliezerantonio/flutter_carousel_intro/blob/main/gif/animated_rotatex.gif)

```dart
animatedRotateX: true
  ```
  
  Rotação animada no eixo Z

![normal](https://github.com/eliezerantonio/flutter_carousel_intro/blob/main/gif/animated_rotatey.gif)

```dart
animatedRotateZ: true
  ```
