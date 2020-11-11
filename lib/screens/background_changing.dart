import 'package:flutter/material.dart';

class BackgroundChangingScreen extends StatefulWidget {
  BackgroundChangingScreen({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _BackgroundChangingScreenState createState() =>
      _BackgroundChangingScreenState();
}

class _BackgroundChangingScreenState extends State<BackgroundChangingScreen>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 10),
      vsync: this,
    )..repeat();
  }

  Animatable<Color> background = TweenSequence<Color>([
    TweenSequenceItem(
      weight: 1.0,
      tween: ColorTween(
        begin: Colors.red,
        end: Colors.green,
      ),
    ),
    TweenSequenceItem(
      weight: 1.0,
      tween: ColorTween(
        begin: Colors.green,
        end: Colors.blue,
      ),
    ),
    TweenSequenceItem(
      weight: 1.0,
      tween: ColorTween(
        begin: Colors.blue,
        end: Colors.pink,
      ),
    ),
  ]);

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return Scaffold(
            appBar: AppBar(
              title: Text('background changing'),
            ),
            body: Container(
              color: background
                  .evaluate(AlwaysStoppedAnimation(_controller.value)),
            ),
          );
        });
  }
}
