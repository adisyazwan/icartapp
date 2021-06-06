import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';

class ImageCarousel extends StatefulWidget {
  _ImageCarouselState createState() => new _ImageCarouselState();
}

class _ImageCarouselState extends State<ImageCarousel>
    with SingleTickerProviderStateMixin {
  Animation<double> animation;
  AnimationController controller;

  initState() {
    super.initState();
    controller = new AnimationController(
        duration: const Duration(milliseconds: 2000), vsync: this);
    animation = new Tween(begin: 0.0, end: 18.0).animate(controller)
      ..addListener(() {
        setState(() {
          // the state that has changed here is the animation object’s value
        });
      });
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    Widget carousel = new Carousel(
      boxFit: BoxFit.cover,
      images: [
        new AssetImage('assets/1.png'),
        new AssetImage('assets/2.png'),
        new AssetImage('assets/Supermarket.png'),
      ],
      animationCurve: Curves.fastOutSlowIn,
      animationDuration: Duration(seconds: 1),
    );

    return new Scaffold(
      backgroundColor: Colors.teal[400],
      body: new Center(
        child: new Container(
          padding: const EdgeInsets.all(20.0),
          height: screenHeight / 2,
          child: new ClipRRect(
            borderRadius: BorderRadius.circular(30.0),
            child: new Stack(
              children: [
                carousel,
              ],
            ),
          ),
        ),
      ),
    );
  }

  dispose() {
    controller.dispose();
    super.dispose();
  }
}
