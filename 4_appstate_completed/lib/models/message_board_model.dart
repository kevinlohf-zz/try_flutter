import 'package:flutter/material.dart';

class MessageBoardModel extends ChangeNotifier {
  final List<String> _messages = [];

  List<String> get messages => _messages;

  void add(String message) {
    _messages.add(message);
    notifyListeners();
  }

}