# Usage Flutter Packages


### 01) animations 2.0.2

The **container transform** pattern is designed for transitions between UI elements that include a container. This pattern creates a visible connection between two UI elements.

!["Container transform gallery - normal speed and slow motion"](https://github.com/flutter/packages/raw/master/packages/animations/example/demo_gifs/container_transform_lineup.gif)

```dart
OpenContainer(
          transitionDuration: const Duration(milliseconds: 1000),
          closedColor: Colors.pink,
          closedBuilder: (BuildContext c, VoidCallback action){
            return const SizedBox(
              height: 56,
              width: 56,
              child: Center(
                child: Icon(
                  Icons.add,
                  color: Colors.white,
                ),
              ),
            );
          },
          openBuilder: (BuildContext c, VoidCallback action) {
          return MyDelayedDisplay();
    },
      tappable: true,
      closedElevation: 6.0,
      closedShape: const CircleBorder(),
    )
```



### 02) delayed_display: ^2.0.0

A widget that enables you to display a child after a delay and with beautiful fading and sliding animation.

<p align="center">
<img src="https://raw.githubusercontent.com/ThomasEcalle/delayed_display/master/documentation/horizontal.gif" width="140" height="280" hspace="20"/>

<img src="https://raw.githubusercontent.com/ThomasEcalle/delayed_display/master/documentation/vertical.gif" width="140" height="280" hspace="20"/>
</p>


```dart
DelayedDisplay(
  delay: Duration(seconds: 1),
  child: Text(
    "Hello",
    style: TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 35.0,
      color: Colors.white,
    ),
  ),
),
```