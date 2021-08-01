import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';

class FlareAnimation extends StatelessWidget {
  @override
  Widget build(BuildContext context) => FlareNavbar();
}

class MenuItem {
  final String name;
  final Color color;
  final double x; // alignment in x-axis

  MenuItem(this.name, this.color, this.x);
}

class FlareNavbar extends StatefulWidget {
  @override
  _FlareNavbarState createState() => _FlareNavbarState();
}

class _FlareNavbarState extends State<FlareNavbar> {
  List items = [
    MenuItem('house', Colors.lightBlue, -1.0),
    MenuItem('planet', Colors.purple, -0.5),
    MenuItem('camera', Colors.greenAccent, 0.0),
    MenuItem('heart', Colors.pink, 0.5),
    MenuItem('head', Colors.yellow, 1.0),
  ];

  late MenuItem active;

  @override
  void initState() {
    super.initState();
    active = items[0];
  }

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;

    return Container(
      height: 80,
      color: Colors.black,
      child: Stack(
        children: [
          // Animated indicator
          AnimatedContainer(
            duration: Duration(milliseconds: 200),
            alignment: Alignment(active.x, -1),
            child: AnimatedContainer(
              duration: Duration(milliseconds: 1000),
              height: 8,
              width: w * 0.2,
              color: active.color,
            ),
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: items.map((item) => _flare(item)).toList(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _flare(MenuItem item) => GestureDetector(
        onTap: () => setState(() => active = item),
        child: AspectRatio(
          aspectRatio: 1,
          child: Padding(
            padding: EdgeInsets.only(top: 20),
            child: FlareActor(
              'assets/flare/bottom_nav/${item.name}.flr',
              alignment: Alignment.center,
              fit: BoxFit.contain,
              animation: item.name == active.name ? 'go' : 'idle',
            ),
          ),
        ),
      );
}
