import 'package:flutter/material.dart';

class BoardWidget extends StatefulWidget {
  @override
  _BoardWidgetState createState() => _BoardWidgetState();
}

// When the widget is being recreated, the state is lost.
class _BoardWidgetState extends State<BoardWidget> {

  List<String> _messages = [];

  TextEditingController _controller = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Expanded(
              child: ListView.separated(
                padding: const EdgeInsets.all(8),
                itemCount: _messages.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    height: 50,
                    color: Colors.grey[200],
                    child: Center(child: Text(_messages[index])),
                  );
                },
                separatorBuilder: (BuildContext context, int index) => const Divider(),
              ),
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
    var trimmedText = text.trim();
    if (trimmedText.isNotEmpty) {
      setState(() {
        _messages.add(trimmedText);
      });
    }
    _controller.clear();
  }
}