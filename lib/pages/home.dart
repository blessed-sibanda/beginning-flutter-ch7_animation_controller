import 'package:ch7_animation_controller/widgets/animated_ballon.dart';
import 'package:ch7_animation_controller/widgets/staggered_animated_ballon.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const <Widget>[
              // AnimatedBallonWidget(),
              StaggeredAnimatedBallonWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
