import 'package:flutter/material.dart';
import 'package:novi_app/colors.dart';

class CircularMenu extends StatefulWidget {
  final Size size;

  CircularMenu({Key key, @required this.size}) : super(key: key);

  @override
  _CircularMenuState createState() => _CircularMenuState();
}

class _CircularMenuState extends State<CircularMenu>
    with SingleTickerProviderStateMixin {
  AnimationController animationController;
  Animation degOneTranslationAnimation,
      degTwoTranslationAnimation,
      degThreeTranslationAnimation;
  Animation rotationAnimation;

  double getRadiansFromDegree(double degree) {
    double unitRadian = 57.295779513;
    return degree / unitRadian;
  }

  @override
  void initState() {
    animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 250));

    degOneTranslationAnimation = TweenSequence([
      TweenSequenceItem<double>(
          tween: Tween<double>(begin: 0.0, end: 1.75), weight: 35.0),
      TweenSequenceItem<double>(
          tween: Tween<double>(begin: 1.75, end: 1.0), weight: 65.0),
    ]).animate(animationController);
    degTwoTranslationAnimation = TweenSequence([
      TweenSequenceItem<double>(
          tween: Tween<double>(begin: 0.0, end: 1.4), weight: 55.0),
      TweenSequenceItem<double>(
          tween: Tween<double>(begin: 1.4, end: 1.0), weight: 45.0),
    ]).animate(animationController);
    degThreeTranslationAnimation = TweenSequence([
      TweenSequenceItem<double>(
          tween: Tween<double>(begin: 0.0, end: 1.2), weight: 75.0),
      TweenSequenceItem<double>(
          tween: Tween<double>(begin: 1.2, end: 1.0), weight: 25.0),
    ]).animate(animationController);
    rotationAnimation = Tween<double>(begin: 180.0, end: 0.0).animate(
        CurvedAnimation(parent: animationController, curve: Curves.easeOut));
    super.initState();
    animationController.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Transform.translate(
          offset: Offset.fromDirection(getRadiansFromDegree(320),
              degOneTranslationAnimation.value * 100),
          child: Transform(
            transform:
                Matrix4.rotationZ(getRadiansFromDegree(rotationAnimation.value))
                  ..scale(degOneTranslationAnimation.value),
            alignment: Alignment.center,
            child: CircularButton(
              color: Colors.blue,
              width: 50,
              height: 50,
              icon: Icon(
                Icons.add,
                color: Colors.white,
              ),
              onClick: () {},
            ),
          ),
        ),
        Transform.translate(
          offset: Offset.fromDirection(getRadiansFromDegree(270),
              degTwoTranslationAnimation.value * 100),
          child: Transform(
            transform:
                Matrix4.rotationZ(getRadiansFromDegree(rotationAnimation.value))
                  ..scale(degTwoTranslationAnimation.value),
            alignment: Alignment.center,
            child: CircularButton(
              color: Colors.black,
              width: 50,
              height: 50,
              icon: Icon(
                Icons.camera_alt,
                color: Colors.white,
              ),
              onClick: () {},
            ),
          ),
        ),
        Transform.translate(
            offset: Offset.fromDirection(getRadiansFromDegree(220),
                degThreeTranslationAnimation.value * 100),
            child: Transform(
              transform: Matrix4.rotationZ(
                  getRadiansFromDegree(rotationAnimation.value))
                ..scale(degThreeTranslationAnimation.value),
              alignment: Alignment.center,
              child: CircularButton(
                color: Colors.orangeAccent,
                width: 50,
                height: 50,
                icon: Icon(
                  Icons.person,
                  color: Colors.white,
                ),
                onClick: () {},
              ),
            )),
        Transform(
          transform:
              Matrix4.rotationZ(getRadiansFromDegree(rotationAnimation.value)),
          alignment: Alignment.center,
          child: CircularButton(
            color: CustomColors.noviRedDark,
            width: 60,
            height: 60,
            icon: Icon(
              Icons.menu,
              color: Colors.white,
            ),
            onClick: () {
              if (animationController.isCompleted) {
                animationController.reverse();
              } else {
                animationController.forward();
              }
            },
          ),
        )
      ],
    );
  }
}

class CircularButton extends StatelessWidget {
  final double width;
  final double height;
  final Color color;
  final Icon icon;
  final Function onClick;

  CircularButton(
      {this.color, this.width, this.height, this.icon, this.onClick});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
            decoration: BoxDecoration(color: color, shape: BoxShape.circle),
            width: width,
            height: height,
            child: IconButton(
              icon: icon,
              enableFeedback: true,
              onPressed: onClick,
            )));
  }
}
