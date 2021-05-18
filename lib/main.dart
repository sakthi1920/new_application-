import 'package:flutter/material.dart';
import 'dart:math' as Math;
void main() {
  return runApp(RunApp());
}

class RunApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Remainder',
      home: RunApp(),
    );
  }
}

class AnimationTest extends StatefulWidget {
  @override
  _AnimationTestState createState() => _AnimationTestState();
}

class _AnimationTestState extends State<AnimationTest>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
        vsync: this, duration: Duration(seconds: 10));
    _controller.addListener(() {


    });

    animation = Tween(
      begin: 0.0,
      end: Math.pi * 20 ,
    ).animate(_controller)
      ..addListener(() {
        setState(() {});
      });

    _controller.addStatusListener((state){

      if(state == AnimationStatus.completed){
        _controller.forward();
      }

    });

    _controller.forward();

  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomPaint(
          painter: TestPainter(
              pi: animation.value
          ),
          child: Container(
            height: double.infinity,
          ),
        ));
  }
}

class TestPainter extends CustomPainter {

  final double pi ;

  TestPainter({this.pi});


  @override
  void paint(Canvas canvas, Size size) {
    final height = size.height;
    final width = size.width;

//    canvas.translate(0, height);
//    canvas.scale(1, -1);

    Paint paint = Paint()
      ..style = PaintingStyle.fill
      ..color = Colors.green
      ..strokeWidth = 10;

    var centerY = height * .5 ,
        centerX = width * .5 ,
        offset = 50 ,
        speed = height * .001 ,
        baseRadius = 50 + Math.sin(pi) * offset;


    canvas.drawCircle(Offset(centerX, centerY ), baseRadius, paint);







  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => this != oldDelegate;

  void render({double x, double y, Canvas canvas , Paint paint }) {
    canvas.drawRect(Rect.fromLTWH(x, y, .5, .5), paint);

  }
}


