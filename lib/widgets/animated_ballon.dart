import 'package:flutter/material.dart';

class AnimatedBallonWidget extends StatefulWidget {
  const AnimatedBallonWidget({Key? key}) : super(key: key);

  @override
  _AnimatedBallonWidgetState createState() => _AnimatedBallonWidgetState();
}

class _AnimatedBallonWidgetState extends State<AnimatedBallonWidget>
    with TickerProviderStateMixin {
  late AnimationController _controllerFloatUp;
  late AnimationController _controllerGrowSize;

  late Animation<double> _animationFloatUp;
  late Animation<double> _animationGrowSize;

  @override
  void initState() {
    super.initState();
    _controllerFloatUp = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 4),
    );
    _controllerGrowSize = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );
  }

  @override
  void dispose() {
    _controllerFloatUp.dispose();
    _controllerGrowSize.dispose();
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
        parent: _controllerFloatUp,
        curve: Curves.fastOutSlowIn,
      ),
    );

    _animationGrowSize = Tween(begin: 50.0, end: ballonWidth).animate(
      CurvedAnimation(
        parent: _controllerGrowSize,
        curve: Curves.elasticInOut,
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
          if (_controllerFloatUp.isCompleted) {
            _controllerFloatUp.reverse();
            _controllerGrowSize.reverse();
          } else {
            _controllerFloatUp.forward();
            _controllerGrowSize.forward();
          }
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
