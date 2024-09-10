import 'package:socket_io_client/socket_io_client.dart' as IO;

class SocketService {
  late IO.Socket socket;
  final String baseUrl; // Define your base URL
  final String path; // Define your path

  SocketService(this.baseUrl, this.path);

  void connect() {
    socket = IO.io(
      baseUrl,
      IO.OptionBuilder()
          .setQuery({
        '__sails_io_sdk_version': '1.2.1',
        '__sails_io_sdk_platform': 'flutter',
        '__sails_io_sdk_language': 'dart'
      })
          .setTimeout(10000) // Reduced timeout for quicker feedback
          .setTransports(['websocket']) // for Flutter or Dart VM
          .setPath(path)
          .enableAutoConnect()
          .build(),
    );

    socket.connect();

    socket.onConnect((_) {
      print('Connected to Socket.IO server');
    });

    socket.onDisconnect((_) {
      print('Disconnected from Socket.IO server');
    });

    socket.onError((error) {
      print('Socket error: $error');
    });

    // Listen for messages from the server
    socket.on('message', (data) {
      print('Message from server: $data');
      // Handle incoming messages
    });
  }

  void sendMessage(String message) {
    if (socket.connected) {
      socket.emit('message', message);
    } else {
      print('Socket is not connected. Cannot send message.');
    }
  }

  void disconnect() {
    if (socket.connected) {
      socket.disconnect();
      print('Disconnected from Socket.IO server');
    } else {
      print('Socket is already disconnected.');
    }
  }
}
