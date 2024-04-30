import 'dart:convert';

import 'package:equatable/equatable.dart';

class ChatHead extends Equatable {
  final String id;
  final String fullName;
  final String lastMessage;
  final bool isOnline;
  final String? profilePhoto;

  const ChatHead({
    required this.id,
    required this.fullName,
    required this.lastMessage,
    required this.isOnline,
    this.profilePhoto,
  });

  @override
  List<Object?> get props {
    return [
      id,
      fullName,
      lastMessage,
      isOnline,
      profilePhoto,
    ];
  }

  ChatHead copyWith({
    String? id,
    String? fullName,
    String? lastMessage,
    bool? isOnline,
    String? profilePhoto,
  }) {
    return ChatHead(
      id: id ?? this.id,
      fullName: fullName ?? this.fullName,
      lastMessage: lastMessage ?? this.lastMessage,
      isOnline: isOnline ?? this.isOnline,
      profilePhoto: profilePhoto ?? this.profilePhoto,
    );
  }

  factory ChatHead.fromMap(Map<String, dynamic> map) {
    return ChatHead(
      id: map['id'] ?? '',
      fullName: map['full_name'] ?? '',
      lastMessage: map['last_message'] ?? '',
      isOnline: map['is_online'] ?? false,
      profilePhoto: map['profile_photo'],
    );
  }

  factory ChatHead.fromJson(String source) =>
      ChatHead.fromMap(json.decode(source));

  @override
  String toString() {
    return 'ChatHead(id: $id, fullName: $fullName, lastMessage: $lastMessage, isOnline: $isOnline, profilePhoto: $profilePhoto)';
  }
}
