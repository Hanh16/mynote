import 'package:flutter/material.dart';

class LikeScreen extends StatefulWidget {
  @override
  _LikeScreenState createState() => _LikeScreenState();
}

class _LikeScreenState extends State<LikeScreen> {
  int count = 0;

  void onPressCount() {
    setState(() {
      count += 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
            Text("Count :$count"),
            ButtonBar(
              mainAxisSize: MainAxisSize
                  .min, // this will take space as minimum as posible(to center)
              children: <Widget>[
                new RaisedButton(
                  child: new Text('Hello'),
                  onPressed: onPressCount,
                ),
                new RaisedButton(
                  child: new Text('Hi'),
                  onPressed: null,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
