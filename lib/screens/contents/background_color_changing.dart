import 'package:flutter/material.dart';
import 'package:flutter_animations/widgets/app_bar.dart';

class BgColorChanging extends StatefulWidget {
  @override
  _BgColorChangingState createState() => _BgColorChangingState();
}

class _BgColorChangingState extends State<BgColorChanging>
    with SingleTickerProviderStateMixin {
  late AnimationController _ctrl;

  @override
  void initState() {
    _ctrl = AnimationController(
      duration: Duration(seconds: 2),
      vsync: this,
    )..repeat();

    super.initState();
  }

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  /// Animations
  Animatable<Color?> background = TweenSequence<Color?>(
    [
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
    ],
  );

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        appBar: CustomAppBar('Background Color Changing'),
        body: Container(
          // color: background.evaluate(AlwaysStoppedAnimation(_ctrl.value)),
          color: background.evaluate(
            CurvedAnimation(
              parent: _ctrl,
              curve: Curves.easeInOut,
            ),
          ),
          // child: Text("${_ctrl.value}"),
        ),
      );
}
