import 'dart:math';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:vector_math/vector_math.dart' show radians;

class RadialMenu extends StatefulWidget {
  @override
  _RadialMenuState createState() => _RadialMenuState();
}

class _RadialMenuState extends State<RadialMenu>
    with SingleTickerProviderStateMixin {
  AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      duration: Duration(milliseconds: 900),
      vsync: this,
    );
    // ..addListener(() => setState(){}); // AnimatedBuilder make this part unecessary
  }

  Widget _buildBody() {
    return RadialAnimation(controller: controller);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Radial Menu'),
      ),
      body: SizedBox.expand(
        child: _buildBody(),
      ),
    );
  }
}

class RadialAnimation extends StatelessWidget {
  final AnimationController controller;
  final Animation<double> scale;
  final Animation<double> translation;
  final Animation<double> rotation;

  RadialAnimation({Key key, this.controller})
      : scale = Tween<double>(begin: 1.5, end: 0.0).animate(
          CurvedAnimation(
            parent: controller,
            curve: Curves.fastOutSlowIn,
          ),
        ),
        translation = Tween<double>(begin: 0.0, end: 100.0).animate(
          CurvedAnimation(
            parent: controller,
            curve: Curves.elasticOut,
          ),
        ),
        // offset from main animation (staggered animation)
        // this is done by using Interval
        rotation = Tween<double>(
          begin: 0.0,
          end: 360.0,
        ).animate(
          CurvedAnimation(
            parent: controller,
            curve: Interval(
              0.0, 0.7, // start at 0% and end at 70% of main animation
              curve: Curves.easeInExpo,
            ),
          ),
        ),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) {
        return Transform.rotate(
          angle: radians(rotation.value),
          child: Stack(
            alignment: Alignment.center,
            children: [
              _buildButton(
                0,
                color: Colors.red,
                icon: FontAwesomeIcons.thumbtack,
                heroTag: 'btn3',
              ),
              _buildButton(
                45,
                color: Colors.green,
                icon: FontAwesomeIcons.sprayCan,
                heroTag: 'btn4',
              ),
              _buildButton(
                90,
                color: Colors.orange,
                icon: FontAwesomeIcons.fire,
                heroTag: 'btn5',
              ),
              _buildButton(
                135,
                color: Colors.blue,
                icon: FontAwesomeIcons.kiwiBird,
                heroTag: 'btn6',
              ),
              _buildButton(
                180,
                color: Colors.black,
                icon: FontAwesomeIcons.cat,
                heroTag: 'btn7',
              ),
              _buildButton(
                225,
                color: Colors.indigo,
                icon: FontAwesomeIcons.paw,
                heroTag: 'btn8',
              ),
              _buildButton(
                270,
                color: Colors.pink,
                icon: FontAwesomeIcons.bong,
                heroTag: 'btn9',
              ),
              _buildButton(
                315,
                color: Colors.yellow,
                icon: FontAwesomeIcons.bolt,
                heroTag: 'btn10',
              ),
              Transform.scale(
                scale: scale.value - 1.5,
                child: FloatingActionButton(
                  heroTag: 'btn1',
                  child: Icon(FontAwesomeIcons.timesCircle),
                  onPressed: _close,
                  backgroundColor: Colors.red,
                ),
              ),
              Transform.scale(
                scale: scale.value,
                child: FloatingActionButton(
                  heroTag: 'btn2',
                  child: Icon(FontAwesomeIcons.solidDotCircle),
                  onPressed: _open,
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  _buildButton(double angle, {Color color, IconData icon, String heroTag}) {
    final double rad = radians(angle);
    return Transform(
      transform: Matrix4.identity()
        ..translate(
          (translation.value) * cos(rad),
          (translation.value) * sin(rad),
        ),
      child: FloatingActionButton(
        heroTag: heroTag,
        child: Icon(icon),
        backgroundColor: color,
        onPressed: _close,
        elevation: 0,
      ),
    );
  }

  _open() {
    controller.forward();
  }

  _close() {
    controller.reverse();
  }
}
