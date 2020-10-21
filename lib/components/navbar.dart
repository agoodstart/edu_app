import 'package:flutter/material.dart';
import 'package:novi_app/colors.dart';

class CustomNavBar {
  final Size size;

  CustomNavBar({this.size});

  Widget navBar() {
    return Container(
        width: this.size.width,
        height: 80,
        // color: Colors.white,
        child: Stack(children: [
          CustomPaint(
            size: Size(this.size.width, 80),
            painter: BNBCustomPainter(size: this.size),
          ),
          Center(
              heightFactor: 0.6,
              child: FloatingActionButton(
                onPressed: () {},
                backgroundColor: CustomColors.noviRedDark,
                child: Icon(Icons.school),
                elevation: 0.1,
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

class BNBCustomPainter extends CustomPainter {
  final Size size;

  BNBCustomPainter({this.size});

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;
    Path path = Path()..moveTo(0, 20);
    path.quadraticBezierTo(this.size.width * .20, 0, this.size.width * .35, 0);
    path.quadraticBezierTo(this.size.width * .40, 0, this.size.width * .40, 20);
    path.arcToPoint(Offset(this.size.width * .60, 20),
        radius: Radius.circular(10.0), clockwise: false);
    path.quadraticBezierTo(this.size.width * .60, 0, this.size.width * .65, 0);
    path.quadraticBezierTo(this.size.width * .80, 0, this.size.width, 20);
    path.lineTo(this.size.width, this.size.height);
    path.lineTo(0, this.size.height);
    path.close();
    canvas.drawShadow(path, Colors.black, 5, true);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
