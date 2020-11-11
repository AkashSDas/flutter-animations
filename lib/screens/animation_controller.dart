import 'dart:math';

import 'package:flutter/material.dart';

class MyAnimationController extends StatefulWidget {
  @override
  _MyAnimationControllerState createState() => _MyAnimationControllerState();
}

class _MyAnimationControllerState extends State<MyAnimationController>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );

    // to notify when the AnimationController changes value
    // _controller.addListener(() {
    //   setState(() {
    //     // do something
    //   });
    //  });

    // start the animation
    // _controller.forward();
    _controller.repeat(); // to keep animation on forever

    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget _buildBody() {
    return Center(
      child: AnimatedBuilder(
        animation: _controller.view,
        builder: (context, child) {
          return Transform.rotate(
            angle: _controller.value * 2 * pi,
            child: child,
          );
        },
        child: Container(
          width: 200,
          height: 200,
          color: Colors.purple[300],
          child: Center(
            child: Text('Animation'),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('animation controller'),
      ),
      body: _buildBody(),
    );
  }
}
