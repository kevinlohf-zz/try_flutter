import 'package:flutter/material.dart';

class BoardWidget extends StatefulWidget {
  @override
  _BoardWidgetState createState() => _BoardWidgetState();
}

class _BoardWidgetState extends State<BoardWidget> {

  TextEditingController _controller = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Expanded(
                child: Container(color: Colors.red)
            ),
            Container(
              padding: new EdgeInsets.all(8),
              child: TextField(
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Enter a message'
                ),
                controller: _controller,
                onSubmitted: _onTextSubmitted,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _onTextSubmitted(String text) {
    if (text.isNotEmpty) {
      final snackBar = SnackBar(content: Text(text));
      Scaffold.of(context).showSnackBar(snackBar);
      _controller.clear();
    }
  }
}