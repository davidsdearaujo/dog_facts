# Dog Facts
App to show curious facts about dogs.

It's an example to help beginners in creating a new project using `Stores`, `Controllers` and `Pages`. 

https://user-images.githubusercontent.com/16373553/193313290-df2b61e9-2d25-497f-a931-83f75b9f6d94.mov

## A Flutter project made using:
- **Flutter** _(v3.3.2)_

- **Flutter Tiple** _(v1.2.7+2)_: for state management [[pub.dev]](https://pub.dev/packages/flutter_triple) [[doc]](https://triple.flutterando.com.br/docs/getting-started/using-flutter-triple/)

- **Flutter Modular** _(v5.0.3)_: for dependency injection and routes [[pub.dev]](https://pub.dev/packages/flutter_modular) [[doc]](https://modular.flutterando.com.br/)

- **Shimmer** _(v2.0.0)_: for beautiful loading widgets [[pub.dev]](https://pub.dev/packages/shimmer)

- **Loading Animation Widget** _(v1.1.0+3)_: for button loading widgets [[pub.dev]](https://pub.dev/packages/loading_animation_widget)

- **Just Audio** _(v0.9.20)_: for playing audio files [[pub.dev]](https://pub.dev/packages/just_audio)

- **Dio** _(v4.0.6)_: for HTTP requests [[pub.dev]](https://pub.dev/packages/dio)

- **HTML package** _(v0.15.0)_: for scrapping the https://www.readspeaker.com/ website to get the voice [[pub.dev]](https://pub.dev/packages/html)

## About the modules
This project has been developed using module structure, to allow the separation of each module in packages, facilitating the maintenance end cohesion of each module and domain.

 - **CoreModule**: responsible by providing a basic resources to all modules;
 - **DogFactsModule**: responsible by dog facts scope;

## To run this project:
```
flutter pub get
flutter run
```

## If it's your first Flutter Project

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
