import 'package:flutter/material.dart';

class PageTwo extends StatefulWidget {
  PageTwo({Key key, this.email, this.password}) : super(key: key);

  final String email;
  final String password;

  @override
  _PageTwoState createState() => _PageTwoState();
}

class _PageTwoState extends State<PageTwo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("test"),
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.red,
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("${widget.email}"),
                Text("${widget.password}"),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
