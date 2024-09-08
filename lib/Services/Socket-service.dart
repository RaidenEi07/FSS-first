import 'package:socket_io_client/socket_io_client.dart' as IO;

class SocketService {
  late IO.Socket socket;

  void connect() {
    socket = IO.io('http://your-server-url', <String, dynamic>{
      'transports': ['websocket'],
      'autoConnect': false,
    });

    socket.connect();

    socket.onConnect((_) {
      print('Connected to Socket.IO server');
    });

    socket.onDisconnect((_) {
      print('Disconnected from Socket.IO server');
    });

    // Listen for messages from the server
    socket.on('message', (data) {
      print('Message from server: $data');
      // Handle incoming messages
    });
  }

  void sendMessage(String message) {
    socket.emit('message', message);
  }

  void disconnect() {
    socket.disconnect();
  }
}
