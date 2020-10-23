import 'package:flutter/material.dart';
import 'package:novi_app/components/circular_menu.dart';

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
