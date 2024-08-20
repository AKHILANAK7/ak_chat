import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;

class ChatService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Stream<List<types.Message>> getMessages() {
    return _firestore
        .collection('messages')
        .orderBy('createdAt', descending: true)
        .snapshots()
        .map((snapshot) => snapshot.docs.map((doc) {
      final data = doc.data();
      return types.TextMessage(
        author: types.User(id: data['authorId']),
        createdAt: data['createdAt'].millisecondsSinceEpoch.toDouble(),
        id: doc.id,
        text: data['text'],
      );
    }).toList());
  }

  Future<void> sendMessage(String text, String userId) async {
    await _firestore.collection('messages').add({
      'text': text,
      'authorId': userId,
      'createdAt': FieldValue.serverTimestamp(),
    });
  }
}
