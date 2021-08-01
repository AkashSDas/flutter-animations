import 'package:flutter/material.dart';

class RadialTransition extends StatefulWidget {
  @override
  _RadialTransitionState createState() => _RadialTransitionState();
}

class _RadialTransitionState extends State<RadialTransition>
    with SingleTickerProviderStateMixin {
  late AnimationController _ctrl;

  @override
  void initState() {
    super.initState();
    _ctrl = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    )..repeat();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(32),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AnimatedBuilder(
            animation: _ctrl,
            builder: (context, child) => Container(
              height: 200,
              width: 200,
              decoration: BoxDecoration(
                gradient: RadialGradient(
                  radius: 1.5,
                  colors: [Colors.yellow, Colors.transparent],
                  stops: [0, _ctrl.value],
                ),
              ),
            ),
          ),
          SizedBox(height: 16),
          _RadialAnimated(_ctrl),
          SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              if (!_ctrl.isAnimating) {
                _ctrl.repeat();
              } else {
                _ctrl.stop();
              }
            },
            child: Text(
              'Animate',
              style: Theme.of(context).textTheme.headline6,
            ),
          )
        ],
      ),
    );
  }
}

class _RadialAnimated extends AnimatedWidget {
  _RadialAnimated(
    Animation<double> animation, {
    Key? key,
    Widget? child,
  })  : _child = child,
        super(key: key, listenable: animation);

  /// Use child for not rendering child again and again
  final Widget? _child;

  Widget build(BuildContext context) {
    // Use pre-built child here
    Animation<double> animation = listenable as Animation<double>;
    return Container(
      height: 200,
      width: 200,
      decoration: BoxDecoration(
        gradient: RadialGradient(
          radius: 1.5,
          colors: [Colors.yellow, Colors.transparent],
          stops: [0, animation.value],
        ),
      ),
    );
  }
}
