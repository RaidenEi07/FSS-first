import 'package:no1/Services/Socket-service.dart';
import 'package:flutter/material.dart';

class SocketProvider extends ChangeNotifier {
  final SocketService _socketService = SocketService();

  void connect() {
    _socketService.connect();
  }

  void sendMessage(String message) {
    _socketService.sendMessage(message);
  }

  void disconnect() {
    _socketService.disconnect();
  }
}