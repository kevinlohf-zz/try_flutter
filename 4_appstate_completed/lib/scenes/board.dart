import 'package:flutter/material.dart';
import 'package:flutter_example/models/message_board_model.dart';
import 'package:provider/provider.dart';

class BoardWidget extends StatelessWidget {

  final TextEditingController _controller = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Consumer<MessageBoardModel>(
      builder: (context, messageBoard, child) {
        return Scaffold(
          body: SafeArea(
            child: Column(
              children: <Widget>[
                Expanded(
                  child: ListView.separated(
                    padding: const EdgeInsets.all(8),
                    itemCount: messageBoard.messages.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        height: 50,
                        color: Colors.grey[200],
                        child: Center(child: Text(messageBoard.messages[index])),
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
                    onSubmitted: (String text) {
                      _onTextSubmitted(text, messageBoard);
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _onTextSubmitted(String text, MessageBoardModel messageBoard) {
    var trimmedText = text.trim();
    if (trimmedText.isNotEmpty) {
      messageBoard.add(trimmedText);
    }
    _controller.clear();
  }
}
