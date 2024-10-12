<p align="center">
  <img src="https://github.com/andiilhamsyahidris/coword/blob/main/images/showcase.gif?raw=true" height="300px">
</p>

## Installing:

In your pubspec.yaml
```yaml
dependencies:
  coword: latest_version
```

## Basic Usage

```dart
Coword(
    passwordController: passwordController,
    confirmationPasswordController: confirmationPasswordController,
),
```

## Types
### Dots Type

<img src="https://github.com/andiilhamsyahidris/coword/blob/main/images/showcase.gif?raw=true" height="300px">

```dart
Coword(
    passwordController: passwordController,
    confirmationPasswordController: confirmationPasswordController,
    type: CowordTypes.dots,
),
```

### Rectangle Type

<img src="https://github.com/andiilhamsyahidris/coword/blob/main/images/type.gif?raw=true" height="300px">

```dart
Coword(
    passwordController: passwordController,
    confirmationPasswordController: confirmationPasswordController,
    type: CowordTypes.rectangle,
),
```

## Animations
### Fade Animation

<img src="https://github.com/andiilhamsyahidris/coword/blob/main/images/showcase.gif?raw=true" height="300px">

```dart
Coword(
    passwordController: passwordController,
    confirmationPasswordController: confirmationPasswordController,
    cowordAnimation: const CowordAnimation.fade(
        toAnimate: true,
        animationDuration: Duration(milliseconds: 500),
        disappearanceFadeAnimationDuration: Duration(milliseconds: 200),
        curve: Curves.easeOutCubic,
    ),
),
```
### Scale Animation

<img src="https://github.com/andiilhamsyahidris/coword/blob/main/images/scale.gif?raw=true" height="300px">

```dart
Coword(
    passwordController: passwordController,
    confirmationPasswordController: confirmationPasswordController,
    cowordAnimation: const CowordAnimation.scale(
        toAnimate: true,
        animationDuration: Duration(milliseconds: 500),
        disappearanceFadeAnimationDuration: Duration(milliseconds: 200),
        curve: Curves.easeOutCubic,
        appearanceDisappearanceFadeAnimationEnabled: true,
    ),
),
```

## Colors
### Match Color

<img src="https://github.com/andiilhamsyahidris/coword/blob/main/images/matched.gif?raw=true" height="300px">

```dart
Coword(
    passwordController: passwordController,
    confirmationPasswordController: confirmationPasswordController,
    cowordStyle: const CowordStyle(
        matchedColor: Colors.blue,
    ),
),
```

### Unmatch Color

<img src="https://github.com/andiilhamsyahidris/coword/blob/main/images/unmatched.gif?raw=true" height="300px">

```dart
Coword(
    passwordController: passwordController,
    confirmationPasswordController: confirmationPasswordController,
    cowordStyle: const CowordStyle(
        unmatchedColor: Colors.purple,
    ),
),
```