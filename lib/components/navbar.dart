import 'package:flutter/material.dart';
import 'package:novi_app/colors.dart';
// import 'package:novi_app/components/fab_menu.dart';

class CustomNavBar {
  final Size size;

  CustomNavBar({this.size});

  double getRadiansFromDegree(double degree) {
    double unitRadian = 57.295779513;
    return degree / unitRadian;
  }

  Widget navBar() {
    return Container(
        width: this.size.width,
        height: 55,
        // color: Colors.white,
        child: Stack(children: [
          CustomPaint(
            size: Size(this.size.width, 80),
            painter: RPSCustomPainter(),
          ),
          Center(
              heightFactor: .6,
              child: Stack(
                children: <Widget>[
                  Transform.translate(
                    offset:
                        Offset.fromDirection(getRadiansFromDegree(320), 100),
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
                  Transform.translate(
                    offset:
                        Offset.fromDirection(getRadiansFromDegree(270), 100),
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
                  Transform.translate(
                    offset:
                        Offset.fromDirection(getRadiansFromDegree(220), 100),
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
                  ),
                  CircularButton(
                    color: CustomColors.noviRedDark,
                    width: 60,
                    height: 60,
                    icon: Icon(
                      Icons.menu,
                      color: Colors.white,
                    ),
                    onClick: () {},
                  ),
                ],
              )),
          Container(
              width: this.size.width,
              height: 80,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                    icon: Icon(Icons.home),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: Icon(Icons.help_outline),
                    onPressed: () {},
                  ),
                  Container(width: this.size.width * .20),
                  IconButton(
                    icon: Icon(Icons.notifications),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: Icon(Icons.account_circle_sharp),
                    onPressed: () {},
                  ),
                ],
              ))
        ]));
  }
}

class RPSCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = new Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill
      ..strokeWidth = 1;

    Path path = Path();
    path.moveTo(0, size.height);
    path.lineTo(0, size.height * 0.25);
    path.quadraticBezierTo(size.width * 0.00, size.height * 0.05,
        size.width * 0.06, size.height * 0.05);
    path.cubicTo(size.width * 0.28, size.height * 0.05, size.width * 0.72,
        size.height * 0.05, size.width * 0.94, size.height * 0.05);
    path.quadraticBezierTo(
        size.width * 1.00, size.height * 0.05, size.width, size.height * 0.25);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
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
