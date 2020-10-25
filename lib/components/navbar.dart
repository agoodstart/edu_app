import 'package:flutter/material.dart';
import 'package:novi_app/components/circular_menu.dart';
import 'package:badges/badges.dart';

class CustomNavbar {
  final Size size;

  CustomNavbar({this.size});

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
              child: CircularMenu(
                size: this.size,
              )),
          Container(
              width: this.size.width,
              height: 80,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        padding: EdgeInsets.zero,
                        constraints: BoxConstraints(),
                        icon: Icon(Icons.home),
                        onPressed: () {},
                      ),
                      Text(
                        "Home",
                        textScaleFactor: .85,
                      )
                    ],
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        padding: EdgeInsets.zero,
                        constraints: BoxConstraints(),
                        icon: Icon(Icons.calendar_today),
                        onPressed: () {},
                      ),
                      Text(
                        "Calendar",
                        textScaleFactor: .85,
                      )
                    ],
                  ),
                  Container(width: this.size.width * .20),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        padding: EdgeInsets.zero,
                        constraints: BoxConstraints(),
                        icon: Icon(Icons.notifications),
                        onPressed: () {},
                      ),
                      Text(
                        "Alerts",
                        textScaleFactor: .85,
                      )
                    ],
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        padding: EdgeInsets.zero,
                        constraints: BoxConstraints(),
                        icon: Icon(Icons.account_circle_sharp),
                        onPressed: () {},
                      ),
                      Text(
                        "Profile",
                        textScaleFactor: .85,
                      )
                    ],
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
