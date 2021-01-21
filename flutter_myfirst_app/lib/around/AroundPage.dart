import 'package:flutter/material.dart';

class AroundPage extends StatefulWidget {
  AroundPage({Key key}) : super(key: key);

  @override
  _AroundPageState createState() => _AroundPageState();
}

class _AroundPageState extends State<AroundPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: Text("周边"),
      ),
    );
  }
}
