import 'package:flutter/material.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:provider/provider.dart';

import '../auth/auth_service.dart';
import 'chat_service.dart';
import 'chat_ui.dart';

class ChatScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context);
    final chatService = ChatService();

    return Scaffold(
      appBar: AppBar(
        title: Text('Chat'),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () {
              authService.signOut();
            },
          ),
        ],
      ),
      body: StreamBuilder<List<types.Message>>(
        stream: chatService.getMessages(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          }

          return ChatUI(
            messages: snapshot.data!,
            user: types.User(id: authService.currentUser!.uid),
            onSendPressed: (text) {
              chatService.sendMessage(text.text, authService.currentUser!.uid);
            },
          );
        },
      ),
    );
  }
}
