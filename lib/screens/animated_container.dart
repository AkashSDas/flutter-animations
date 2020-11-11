import 'package:flutter/material.dart';
import 'package:flutter_animations/curves.dart';

class MyAnimatedContainer extends StatefulWidget {
  @override
  _MyAnimatedContainerState createState() => _MyAnimatedContainerState();
}

class _MyAnimatedContainerState extends State<MyAnimatedContainer> {
  double _width = 200;
  double _height = 200;
  Color _color = Colors.orange[300];

  void _updateState() {
    setState(() {
      _width = 400;
      _height = 400;
      _color = Colors.pink[300];
    });
  }

  Widget _buildBody() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          RaisedButton(
            onPressed: () {
              _updateState();
            },
            child: Text('Animate'),
          ),
          AnimatedContainer(
            duration: Duration(milliseconds: 900),
            // curve: Curves.bounceOut,
            curve: SineCurve(count: 2), // using custom curve
            width: _width,
            height: _height,
            color: _color,
            child: Center(
              child: Text('Animation'),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('animated container'),
      ),
      body: _buildBody(),
    );
  }
}
