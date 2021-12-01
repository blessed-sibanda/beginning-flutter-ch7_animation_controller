import 'package:flutter/material.dart';

class StaggeredAnimatedBallonWidget extends StatefulWidget {
  const StaggeredAnimatedBallonWidget({Key? key}) : super(key: key);

  @override
  _StaggeredAnimatedBallonWidgetState createState() =>
      _StaggeredAnimatedBallonWidgetState();
}

class _StaggeredAnimatedBallonWidgetState
    extends State<StaggeredAnimatedBallonWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  late Animation<double> _animationFloatUp;
  late Animation<double> _animationGrowSize;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 4),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double ballonHeight = MediaQuery.of(context).size.height / 2;
    double ballonWidth = MediaQuery.of(context).size.height / 3;
    double ballonBottomLocation =
        MediaQuery.of(context).size.height - ballonHeight;

    _animationFloatUp = Tween(begin: ballonBottomLocation, end: 0.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.0, 1.0, curve: Curves.fastOutSlowIn),
      ),
    );

    _animationGrowSize = Tween(begin: 50.0, end: ballonWidth).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.0, 0.5, curve: Curves.elasticInOut),
      ),
    );

    return AnimatedBuilder(
      animation: _animationFloatUp,
      builder: (context, child) {
        return Container(
          child: child,
          margin: EdgeInsets.only(top: _animationFloatUp.value),
          width: _animationGrowSize.value,
        );
      },
      child: GestureDetector(
        onTap: () {
          _controller.isCompleted
              ? _controller.reverse()
              : _controller.forward();
        },
        child: Image.asset(
          'assets/images/BeginningGoogleFlutter-Balloon.png',
          height: ballonHeight,
          width: ballonWidth,
        ),
      ),
    );
  }
}
