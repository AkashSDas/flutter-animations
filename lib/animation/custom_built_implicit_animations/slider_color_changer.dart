import 'package:flutter/material.dart';

class SliderColorChanger extends StatefulWidget {
  @override
  _SliderColorChangerState createState() => _SliderColorChangerState();
}

class _SliderColorChangerState extends State<SliderColorChanger> {
  double _sliderValue = 0;
  Color? _newColor = Colors.white;

  @override
  Widget build(BuildContext context) => TweenAnimationBuilder(
        duration: Duration(milliseconds: 100),
        curve: Curves.easeInOut,
        tween: ColorTween(begin: Colors.white, end: _newColor),

        /// Uncommenting onEnd here will give blinking animation between the
        /// colors
        // onEnd: () => setState(() {
        //   _newColor = _newColor == Colors.teal ? Colors.white : Colors.teal;
        // }),

        builder: (context, color, child) => Column(
          children: [
            _buildBox(color),
            SizedBox(height: 16),
            _buildSlider(),
          ],
        ),
      );

  Widget _buildBox(Object? color) => Container(
        width: 200,
        height: 200,
        decoration: BoxDecoration(
          color: color as Color,
          borderRadius: BorderRadius.all(Radius.circular(32)),
          boxShadow: [
            BoxShadow(
              color: Colors.teal.shade200,
              blurRadius: 32,
              offset: Offset(4, 8),
            ),
          ],
        ),
      );

  Widget _buildSlider() => Slider.adaptive(
        value: _sliderValue,
        onChanged: (double value) {
          setState(() {
            _sliderValue = value;
            _newColor = Color.lerp(Colors.white, Colors.teal, _sliderValue);
          });
          print(value);
        },
      );
}
