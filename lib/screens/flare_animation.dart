import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';

class FlareAnimation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.black,
        child: Center(
          child: FlareNavbar(),
        ),
      ),
    );
  }
}

class MenuItem {
  final String name;
  final Color color;
  final double x; // alignment in x-axis
  MenuItem({this.name, this.color, this.x});
}

class FlareNavbar extends StatefulWidget {
  @override
  _FlareNavbarState createState() => _FlareNavbarState();
}

class _FlareNavbarState extends State<FlareNavbar> {
  List items = [
    MenuItem(x: -1.0, name: 'house', color: Colors.lightBlue[100]),
    MenuItem(x: -0.5, name: 'planet', color: Colors.purple),
    MenuItem(x: 0.0, name: 'camera', color: Colors.greenAccent),
    MenuItem(x: 0.5, name: 'heart', color: Colors.pink),
    MenuItem(x: 1.0, name: 'head', color: Colors.yellow),
  ];
  MenuItem active;

  @override
  void initState() {
    super.initState();
    active = items[0];
  }

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text('flare animation'),
      ),
      body: Container(
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
      ),
    );
  }

  Widget _flare(MenuItem item) {
    return GestureDetector(
      onTap: () {
        setState(() {
          active = item;
        });
      },
      child: AspectRatio(
        aspectRatio: 1,
        child: Padding(
          padding: EdgeInsets.only(top: 20),
          child: FlareActor(
            'assets/flare_assets/${item.name}.flr',
            alignment: Alignment.center,
            fit: BoxFit.contain,
            animation: item.name == active.name ? 'go' : 'idle',
          ),
        ),
      ),
    );
  }
}
