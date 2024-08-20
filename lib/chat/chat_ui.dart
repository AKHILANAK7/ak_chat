import 'package:flutter/material.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;

import 'chat_message.dart';

class ChatUI extends StatelessWidget {
  final List<types.Message> messages;
  final types.User user;
  final void Function(types.PartialText) onSendPressed;

  ChatUI({
    required this.messages,
    required this.user,
    required this.onSendPressed,
  });

  @override
  Widget build(BuildContext context) {
    final List<ChatMessage> chatMessages = messages.map((message) {
      if (message is types.TextMessage) {
        return ChatMessage(
          message: message,
          isMe: message.author.id == user.id,
        );
      } else {
        throw UnsupportedError('Unsupported message type');
      }
    }).toList();

    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: chatMessages.length,
            itemBuilder: (context, index) => chatMessages[index],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  onSubmitted: (text) {
                    onSendPressed(types.PartialText(text: text));
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Type a message',
                  ),
                ),
              ),
              IconButton(
                icon: Icon(Icons.send),
                onPressed: () {
                  // Handle the send button press if needed
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
