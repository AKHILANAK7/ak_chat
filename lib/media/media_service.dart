import 'package:firebase_storage/firebase_storage.dart';
import 'dart:io';

class MediaService {
  final FirebaseStorage _storage = FirebaseStorage.instance;

  Future<String> uploadMedia(File file, String path) async {
    try {
      final ref = _storage.ref().child(path);
      final uploadTask = ref.putFile(file);
      final snapshot = await uploadTask.whenComplete(() => {});
      return await snapshot.ref.getDownloadURL();
    } catch (e) {
      throw Exception('Error uploading media: $e');
    }
  }

  Future<void> deleteMedia(String url) async {
    try {
      final ref = _storage.refFromURL(url);
      await ref.delete();
    } catch (e) {
      throw Exception('Error deleting media: $e');
    }
  }
}
