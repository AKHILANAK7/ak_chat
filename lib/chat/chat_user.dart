// import 'package:chatview/chatview.dart';

// /// Custom ChatUser implementation to match the requirements of `chatview` package.
// class ChatUser {
//   /// Unique identifier for the user.
//   final String id;

//   /// Display name of the user.
//   final String name;

//   /// URL of the user's profile picture (optional).
//   final String? avatarUrl;

//   /// Constructs a new `ChatUser`.
//   ChatUser({
//     required this.id,
//     required this.name,
//     this.avatarUrl,
//   });

//   @override
//   String get userId => id;

//   @override
//   String get userName => name;

//   @override
//   String? get userAvatarUrl => avatarUrl;

//   @override
//   bool operator ==(Object other) =>
//       identical(this, other) ||
//       (other is ChatUser &&
//           runtimeType == other.runtimeType &&
//           id == other.id);

//   @override
//   int get hashCode => id.hashCode;

//   @override
//   String toString() => 'ChatUser(id: $id, name: $name, avatarUrl: $avatarUrl)';
// }
