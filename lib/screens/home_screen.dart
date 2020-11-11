import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  Widget _buildNavigateToBtn(String text, String to, BuildContext context) {
    return RaisedButton(
      onPressed: () {
        Navigator.pushNamed(context, to);
      },
      child: Text(text),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Animations'),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: ListView(
          children: [
            _buildNavigateToBtn(
              'animated container',
              '/animated_container',
              context,
            ),
            SizedBox(height: 10),
            _buildNavigateToBtn(
              'tween animation',
              '/tween_animation',
              context,
            ),
            SizedBox(height: 10),
            _buildNavigateToBtn(
              'background changing',
              '/background_changing',
              context,
            ),
            SizedBox(height: 10),
            _buildNavigateToBtn(
              'animation controller',
              '/animation_controller',
              context,
            ),
          ],
        ),
      ),
    );
  }
}
