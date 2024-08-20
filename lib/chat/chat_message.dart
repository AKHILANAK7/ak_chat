import 'package:flutter/material.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;

class ChatMessage extends StatelessWidget {
  final types.TextMessage message;
  final bool isMe;

  ChatMessage({
    required this.message,
    required this.isMe,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Align(
        alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
        child: Container(
          padding: const EdgeInsets.all(12.0),
          decoration: BoxDecoration(
            color: isMe ? Colors.blueAccent : Colors.grey[300],
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Text(
            message.text,
            style: TextStyle(
              color: isMe ? Colors.white : Colors.black,
            ),
          ),
        ),
      ),
      subtitle: Align(
        alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
        child: Text(
          DateTime.fromMillisecondsSinceEpoch(message.createdAt!).toLocal().toString(),
          style: TextStyle(
            color: isMe ? Colors.white70 : Colors.black54,
          ),
        ),
      ),
    );
  }
}
