import 'package:flutter/material.dart';
import 'package:flutter_animations/widgets/app_bar.dart';

class BasicBlocksOfAnimations extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        appBar: CustomAppBar('Basic Blocks Of Animations'),
        body: Container(
          padding: EdgeInsets.all(32),
          child: ListView(
            children: [
              _CounterAnimation(),
              SizedBox(height: 16),
              TweenAnimationBuilder(
                tween: IntTween(begin: 0, end: 299792458),
                duration: Duration(seconds: 5),
                builder: (context, int value, child) => Text('$value m/s'),
              ),
            ],
          ),
        ),
      );
}

class _CounterAnimation extends StatefulWidget {
  @override
  __CounterAnimationState createState() => __CounterAnimationState();
}

class __CounterAnimationState extends State<_CounterAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _ctrl;
  int i = 0;

  @override
  void initState() {
    super.initState();
    _ctrl = AnimationController(
      vsync: this,
      duration: Duration(seconds: 5),
    )
      ..addListener(_update)
      ..forward();
  }

  void _update() {
    setState(() {
      i = (_ctrl.value * 299792458).round();
    });
  }

  @override
  Widget build(BuildContext context) => Text('$i m/s');
}
