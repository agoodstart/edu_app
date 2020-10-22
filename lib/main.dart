import 'package:flutter/material.dart';
import 'package:novi_app/colors.dart';
import 'package:novi_app/components/navbar.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Novi Hogeschool',
      theme: ThemeData(
        primarySwatch: CustomColors.noviRedDark,
      ),
      home: MyHomePage(title: 'Novi Hogeschool'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Colors.white10,
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Stack(children: [
          Positioned(bottom: 0, left: 0, child: CustomNavbar(size: size))
        ]));
  }
}
