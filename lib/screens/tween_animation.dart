import 'package:flutter/material.dart';

class MyTweenAnimation extends StatelessWidget {
  final Tween<double> _scaleTween = Tween<double>(begin: 1, end: 10);
  final ColorTween _colorTween = ColorTween(
    begin: Colors.blue,
    end: Colors.red,
  );
  final SizeTween _sizeTween = SizeTween(begin: Size(0, 0), end: Size(10, 10));
  final AlignmentTween _alignmentTween = AlignmentTween(
    begin: Alignment.center,
    end: Alignment.topRight,
  );

  Widget _buildBody(BuildContext context) {
    return Center(
      child: TweenAnimationBuilder(
        tween: _scaleTween,
        duration: Duration(milliseconds: 600),
        builder: (context, scale, child) {
          return Transform.scale(scale: scale, child: child);
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
        title: Text('tween animation'),
      ),
      body: _buildBody(context),
    );
  }
}
