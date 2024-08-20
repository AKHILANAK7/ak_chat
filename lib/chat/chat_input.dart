import 'package:flutter/material.dart';

class ChatInput extends StatelessWidget {
  final Function(String) onSend;

  ChatInput({required this.onSend});

  final TextEditingController _controller = TextEditingController();

  void _handleSend() {
    if (_controller.text.isNotEmpty) {
      onSend(_controller.text);
      _controller.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _controller,
              decoration: InputDecoration(
                hintText: 'Type a message',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
              ),
            ),
          ),
          IconButton(
            icon: Icon(Icons.send),
            onPressed: _handleSend,
          ),
        ],
      ),
    );
  }
}
